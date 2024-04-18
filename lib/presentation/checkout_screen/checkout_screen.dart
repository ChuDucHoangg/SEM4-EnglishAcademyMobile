import 'dart:convert';

import 'package:country_pickers/utils/my_alert_dialog.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import '../../data/model/CourseModel.dart';
import '../../service/CourseService.dart';

class CheckoutScreen extends StatefulWidget {
  final String slug;

  CheckoutScreen({Key? key, required this.slug}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late Future<CourseModel> _courseFuture;

  @override
  void initState() {
    super.initState();
    _courseFuture = CourseService.fetchCourseDetail(widget.slug);
    Stripe.publishableKey =
        "pk_test_51OVqT0DQZzhwaulm9QNS20I55bgkpOt6eQa1gHTm113njc8xGE3A3YoiJ5WEweMhQizzHnQGtFH0zEw8mXCYFbcB00s9xR5vEC";
  }

  Map<String, dynamic>? paymentIntent;

  void makePayment(double coursePrice) async {
    try {
      paymentIntent = await createPaymentIntent((coursePrice * 100).toInt());

      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!["client_secret"],
              style: ThemeMode.light,
              merchantDisplayName: "Sabir",
              googlePay: gpay));

      displayPaymentSheet();
    } catch (e) {
      print(e.toString());
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      final CourseModel course = await _courseFuture;
      var slug = course.slug;
      await CourseService.buyCourse(1, course.id);
      Navigator.pushNamed(context, AppRoutes.thankYouScreen,
          arguments: slug);
      print("Done");
    } catch (e) {
      print("Failed to send payment data: $e");
      showPurchaseFailedDialog();
    }
  }

  void showPurchaseFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Purchase Failed"),
          content: Text("This course has been purchased."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  createPaymentIntent(int amount) async {
    try {
      Map<String, dynamic> body = {
        "amount": amount.toString(),
        "currency": "USD"
      };

      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            "Authorization":
                "Bearer sk_test_51OVqT0DQZzhwaulmETF7hT7LKG3W2935ChKZDk4yxOsE8lE4aVRxPOEy9dvlxuHs85DGiWPgu6IBqngCeRn8Ue3w00TUzMCkeH",
            "Content-Type": "application/x-www-form-urlencoded"
          });
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CourseModel>(
        future: _courseFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final CourseModel course = snapshot.data!;
            return Scaffold(
                appBar: _buildAppBar(context),
                body: SizedBox(
                  width: SizeUtils.width,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 20.v),
                    child: Column(
                      children: [
                        _buildInformation(context),
                        SizedBox(height: 18.v),
                        _buildCourseOrder(context, course),
                        SizedBox(height: 18.v),
                        _buildPaymentMethod(context),
                        SizedBox(height: 18.v),
                        _buildOrderSummary(context, course),
                        SizedBox(height: 10.v),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: _buildButtomBarNavigator(context, course));
          }
        });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 35.h,
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 22.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Checkout",
      ),
    );
  }

  /// Section Widget
  Widget _buildInformation(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Billing Address",
              style: theme.textTheme.titleMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.v),
              child: Text(
                "Change",
                style: CustomTextStyles.labelLargePrimary,
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 15.h),
      Container(
        width: 327.h,
        margin: EdgeInsets.symmetric(horizontal: 23.h),
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 13.v,
        ),
        decoration: AppDecoration.outlineBluegray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.v),
            Text(
              "Jason Mark,",
              style: theme.textTheme.titleSmall,
            ),
            SizedBox(height: 7.v),
            Container(
              width: 286.h,
              margin: EdgeInsets.only(right: 8.h),
              child: Text(
                "3702 Oliver Street, Fort Worth, TX, Texas, 76102, 817-352-2015, jasonmark@gmail.com",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall!.copyWith(
                  height: 1.60,
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildCourseOrder(BuildContext context, CourseModel course) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 24.h),
          child: Text(
            "Order details",
            style: theme.textTheme.titleMedium,
          ),
        ),
      ),
      SizedBox(height: 15.v),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 24.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 17.v,
        ),
        decoration: AppDecoration.outlineBluegray503.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          children: [
            Container(
              height: 56.v,
              width: 63.h,
              padding: EdgeInsets.symmetric(vertical: 6.v),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder12,
                image: DecorationImage(
                  image: NetworkImage(course.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 204.h,
                      child: Text(
                        course.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.labelLargeGray900_1.copyWith(
                          height: 1.60,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.v),
                    Text(
                      "Price: \$${course.price.toString()}",
                      style: CustomTextStyles.labelLargePrimary_1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 24.h),
          child: Text(
            "Payment method",
            style: theme.textTheme.titleMedium,
          ),
        ),
      ),
      SizedBox(height: 15.v),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.checkoutPaymentMethodScreen);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 23.h),
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 16.v,
          ),
          decoration: AppDecoration.outlineBluegray50.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.v),
                child: CustomIconButton(
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  padding: EdgeInsets.all(9.h),
                  decoration: IconButtonStyleHelper.fillGrayTL8,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgStripeLogo,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 1.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Stripe",
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 8.v),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Checked automatically",
                        style: theme.textTheme.bodySmall,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRightBlueGray30001,
                height: 18.adaptSize,
                width: 18.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 12.v),
              )
            ],
          ),
        ),
      )
    ]);
  }

  /// Section Widget
  Widget _buildOrderSummary(BuildContext context, CourseModel course) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order summary",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 16.v),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillGray5002.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildItem(
                          context,
                          label: "Original price",
                          price: '\$${course.price.toString()}',
                        ),
                        _buildItem(
                          context,
                          label: "Payment fee",
                          price: "0.00",
                        ),
                        SizedBox(height: 16.v),
                        _buildItem(
                          context,
                          label: "Total buy",
                          price: '\$${course.price.toString()}',
                        ),
                        SizedBox(height: 12.v)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///Section Widget
  Widget _buildButtomBarNavigator(BuildContext context, CourseModel course) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.outlineGray9007,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 13.v,
            ),
            decoration: AppDecoration.outlineBluegray503.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgTelevisionGray900,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    "Promo code",
                    style: CustomTextStyles.bodyMediumBluegray300,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowRightBlueGray30001,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                )
              ],
            ),
          ),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 3.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: CustomTextStyles.bodySmallBluegray300_1,
                    ),
                    SizedBox(height: 3.v),
                    Text(
                      '\$${course.price.toString()}',
                      style: CustomTextStyles.titleMedium18,
                    )
                  ],
                ),
              ),
              CustomElevatedButton(
                height: 48.v,
                width: 164.h,
                text: "Pay Now",
                buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                onPressed: () {
                  makePayment(course.price);
                },
              ),
            ],
          ),
          SizedBox(height: 15.v)
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildItem(
    BuildContext context, {
    required String label,
    required String price,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.v),
      decoration: AppDecoration.outlineBluegray502,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              label,
              style: theme.textTheme.bodySmall!.copyWith(
                color: appTheme.gray60001,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              price,
              style: CustomTextStyles.bodySmallGray900.copyWith(
                color: appTheme.gray900,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

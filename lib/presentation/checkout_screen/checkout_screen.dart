import 'dart:convert';
import 'package:easy_paypal/easy_paypal.dart';
import 'package:english_academy_mobile/presentation/checkout_screen/widgets/checkout_course_order_item.dart';
import 'package:english_academy_mobile/presentation/checkout_screen/widgets/checkout_information_item.dart';
import 'package:english_academy_mobile/presentation/checkout_screen/widgets/checkout_order_summary_item.dart';
import 'package:english_academy_mobile/presentation/checkout_screen/widgets/checkout_payment_method_item.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/widgets.dart';
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
  final _easyPaypalPlugin = EasyPaypal();

  bool isPaypalChecked = true;
  bool isStripeChecked = false;

  @override
  void initState() {
    super.initState();
    _courseFuture = CourseService.fetchCourseDetail(widget.slug);
    Stripe.publishableKey =
        "pk_test_51OVqT0DQZzhwaulm9QNS20I55bgkpOt6eQa1gHTm113njc8xGE3A3YoiJ5WEweMhQizzHnQGtFH0zEw8mXCYFbcB00s9xR5vEC";
    initPlatformState();

    isPaypalChecked = true;
    isStripeChecked = false;
  }

  void handleSelectionChange(bool selectedPaypal, bool selectedStripe) {
    setState(() {
      if (selectedPaypal) {
        isPaypalChecked = true;
        isStripeChecked = false;
      } else if (selectedStripe) {
        isPaypalChecked = false;
        isStripeChecked = true;
      }
    });
  }

  //payment with paypal
  PPOrder order(double coursePrice) => PPOrder(
        intent: PPOrderIntent.capture,
        appContext: PPOrderAppContext(
          shippingPreference: PPShippingPreference.noShipping,
        ),
        purchaseUnitList: [
          PPPurchaseUnit(
            orderAmount: PPOrderAmount(
              currencyCode: PPCurrencyCode.usd,
              value: coursePrice.toString(),
            ),
          ),
        ],
      );

  Future<void> initPlatformState() async {
    try {
      _easyPaypalPlugin.initConfig(
          config: PPCheckoutConfig(
        clientId:
            'AcvKRJ0Oi28AoLvgQ3LQBRmpHaEEJ7ZZNRLP5V5SZAYjqvwmYJJvJGklKMLvb-plw3XhwmEBskvrwsCK',
        environment: PPEnvironment.sandbox,
        returnUrl: 'com.example.easy.paypal://paypalpay',
      ));
      _easyPaypalPlugin.setCallback(PPCheckoutCallback(onApprove: (data) async {
        final CourseModel course = await _courseFuture;
        var slug = course.slug;
        await CourseService.buyCourse(1, course.id, "PAYPAL");
        Navigator.pushNamed(context, AppRoutes.thankYouScreen, arguments: slug);
        debugPrint('done: $data');
      }, onError: (data) {
        debugPrint('onError: $data');
      }, onCancel: () {
        debugPrint('onCancel');
      }, onShippingChange: (data) {
        debugPrint('onShippingChange: $data');
      }));
    } catch (e) {
      debugPrint(':::: ERROR: $e');
    }
    if (!mounted) return;
  }

  // payment with stripe
  Map<String, dynamic>? paymentIntent;

  void makePaymentStripe(double coursePrice) async {
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
      await CourseService.buyCourse(1, course.id, "STRIPE");
      Navigator.pushNamed(context, AppRoutes.thankYouScreen, arguments: slug);
      print("Done");
    } catch (e) {
      print("Failed to send payment data: $e");
    }
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
    return CheckoutInformationItem();
  }

  /// Section Widget
  Widget _buildCourseOrder(BuildContext context, CourseModel course) {
    return CheckoutCourseOrderItem(course: course);
  }

  /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    return Column(
      children: [
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            children: [
              CheckoutPaymentMethodItem(
                paymentMethodName: "Paypal",
                paymentMethodDescription: "Checked automatically",
                paymentMethodLogoPath: ImageConstant.imgLogosPaypal,
                isChecked: isPaypalChecked,
                onChanged: (selected) {
                  handleSelectionChange(selected, false);
                },
              ),
              CheckoutPaymentMethodItem(
                paymentMethodName: "Stripe",
                paymentMethodDescription: "Master Card, Visa,...",
                paymentMethodLogoPath: ImageConstant.imgTelevisionPrimary,
                isChecked: isStripeChecked,
                onChanged: (selected) {
                  handleSelectionChange(false, selected);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildOrderSummary(BuildContext context, CourseModel course) {
    return CheckoutOrderSummaryItem(course: course);
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
                  if (isPaypalChecked) {
                    _easyPaypalPlugin.checkout(order: order(course.price));
                  } else if (isStripeChecked) {
                    makePaymentStripe(course.price);
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 15.v)
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

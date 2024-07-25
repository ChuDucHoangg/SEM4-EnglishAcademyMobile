import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:easy_paypal/easy_paypal.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../data/model/BookingModel.dart';
import '../../../service/BookingService.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../checkout_screen/widgets/checkout_payment_method_item.dart';
import '../../tutor_screen/tutor_detail_screen/tutor_detail_screen.dart';

class BookingWaitingDetailScreen extends StatefulWidget {
  final int id;

  const BookingWaitingDetailScreen({super.key, required this.id});

  @override
  State<BookingWaitingDetailScreen> createState() =>
      _BookingWaitingDetailScreenState();
}

class _BookingWaitingDetailScreenState
    extends State<BookingWaitingDetailScreen> {
  late Future<StudentPackageDTO> _bookingWaitingFuture;
  final _easyPaypalPlugin = EasyPaypal();

  bool isPaypalChecked = true;
  bool isStripeChecked = false;

  @override
  void initState() {
    super.initState();
    _bookingWaitingFuture = BookingService.fetchBookingWaitingDetail(widget.id);
    Stripe.publishableKey =
        "pk_test_51OVqT0DQZzhwaulm9QNS20I55bgkpOt6eQa1gHTm113njc8xGE3A3YoiJ5WEweMhQizzHnQGtFH0zEw8mXCYFbcB00s9xR5vEC";
    initPlatformState();

    isPaypalChecked = true;
    isStripeChecked = false;
  }

  void handleSelectionChange(bool selectedPaypal, bool selectedStripe) {
    setState(() {
      isPaypalChecked = selectedPaypal;
      isStripeChecked = selectedStripe;
    });
  }

  //payment with paypal
  PPOrder order(double packagePrice) => PPOrder(
        intent: PPOrderIntent.capture,
        appContext: PPOrderAppContext(
          shippingPreference: PPShippingPreference.noShipping,
        ),
        purchaseUnitList: [
          PPPurchaseUnit(
            orderAmount: PPOrderAmount(
              currencyCode: PPCurrencyCode.usd,
              value: packagePrice.toString(),
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
        final StudentPackageDTO bookingWaiting = await _bookingWaitingFuture;
        await BookingService.paymentBookingWaiting(
            bookingWaiting.id, "PAYPAL", bookingWaiting.packagePrice);
        Navigator.pushNamed(context, AppRoutes.thankYouScreenBooking);
        debugPrint('done: $data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
                padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Center(
                  child: Text(
                    "Payment success!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        );
      }, onError: (data) {
        debugPrint('onError: $data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
                padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
                decoration: AppDecoration.fillRedA.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Text(
                  "Error! An error occurred. Please try again later!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                )),
          ),
        );
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

  void makePaymentStripe(double packagePrice) async {
    try {
      paymentIntent = await createPaymentIntent((packagePrice * 100).toInt());

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

      final StudentPackageDTO bookingWaiting = await _bookingWaitingFuture;
      await BookingService.paymentBookingWaiting(
          bookingWaiting.id, "PAYPAL", bookingWaiting.packagePrice);
      Navigator.pushNamed(context, AppRoutes.thankYouScreenBooking);
      print("Done");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Center(
                child: Text(
                  "Payment success!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      );
    } catch (e) {
      print("Failed to send payment data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
              decoration: AppDecoration.fillRedA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Text(
                "Error! An error occurred. Please try again later!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
      );
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

  void _showBottomSheet(double packagePrice) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 400,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.h, top: 40),
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
                            setModalState(() {
                              handleSelectionChange(selected, false);
                            });
                          },
                        ),
                        CheckoutPaymentMethodItem(
                          paymentMethodName: "Stripe",
                          paymentMethodDescription: "Master Card, Visa,...",
                          paymentMethodLogoPath:
                              ImageConstant.imgTelevisionPrimary,
                          isChecked: isStripeChecked,
                          onChanged: (selected) {
                            setModalState(() {
                              handleSelectionChange(false, selected);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: CustomElevatedButton(
                      height: 35.v,
                      width: 140.h,
                      text: "Pay \$${packagePrice.toString()}",
                      alignment: Alignment.bottomRight,
                      buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                      onPressed: () {
                        if (isPaypalChecked) {
                          _easyPaypalPlugin.checkout(
                              order: order(packagePrice));
                        } else if (isStripeChecked) {
                          makePaymentStripe(packagePrice);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StudentPackageDTO>(
        future: _bookingWaitingFuture,
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
            final StudentPackageDTO bookingWaiting = snapshot.data!;
            return Scaffold(
              appBar: _buildAppBar(context),
              body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 20.v),
                  child: Column(
                    children: [
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Information",
                                style: theme.textTheme.titleMedium,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.v),
                                child: Row(
                                  children: [
                                    Text(
                                      "Status: ",
                                      style: CustomTextStyles.labelLargePrimary,
                                    ),
                                    Text(
                                      bookingWaiting.status,
                                      style: CustomTextStyles.labelLargePrimary,
                                    ),
                                  ],
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
                            children: [
                              SizedBox(height: 7.v),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.h,
                                  vertical: 4.v,
                                ),
                                decoration: AppDecoration.fillGray100.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder12,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.v),
                                      decoration:
                                          AppDecoration.outlineBluegray502,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 2.v),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Student Name: ",
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                                Text(
                                                  bookingWaiting.studentName,
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.v),
                                      decoration:
                                          AppDecoration.outlineBluegray502,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 2.v),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Package Name: ",
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                                Text(
                                                  bookingWaiting.packageName,
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.v),
                                      decoration:
                                          AppDecoration.outlineBluegray502,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 2.v),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Sessions: ",
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                                Text(
                                                  bookingWaiting
                                                      .remainingSessions
                                                      .toString(),
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.v),
                                      decoration:
                                          AppDecoration.outlineBluegray502,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 2.v),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Price: ",
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                                Text(
                                                  bookingWaiting.packagePrice
                                                      .toString(),
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.v),
                                      decoration:
                                          AppDecoration.outlineBluegray502,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 2.v),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Created Date: ",
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                                Text(
                                                  bookingWaiting.createdDate !=
                                                          null
                                                      ? bookingWaiting
                                                          .createdDate
                                                          .toString()
                                                      : "N/A",
                                                  style: theme
                                                      .textTheme.titleSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.h,
                                    vertical: 4.v,
                                  ),
                                  decoration: AppDecoration.fillYellow.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder12,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: bookingWaiting.lessonDays
                                        .map(
                                          (lessonDay) => Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12.v),
                                            decoration: AppDecoration
                                                .outlineBluegray502,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 2.v),
                                                  child: Text(
                                                    lessonDay['dayOfWeek'],
                                                    style: theme
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                      color: appTheme.gray60001,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 1.v),
                                                  child: Text(
                                                    "${lessonDay['startTime']} - ${lessonDay['endTime']}",
                                                    style: CustomTextStyles
                                                        .bodySmallGray900
                                                        .copyWith(
                                                      color: appTheme.gray900,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  )),
                              SizedBox(height: 7.v),
                              Center(
                                child: (bookingWaiting.status == 'confirmed' &&
                                        bookingWaiting.packagePrice > 0)
                                    ? Text(
                                        "Note: Please pay before the next payment date!",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : null,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                      ])
                    ],
                  ),
                ),
              ),
              floatingActionButton: (bookingWaiting.status == 'confirmed' &&
                      bookingWaiting.packagePrice > 0)
                  ? ExtendedFloatingActionButton(
                      onPressed: () {
                        _showBottomSheet(bookingWaiting.packagePrice);
                      },
                      label: Text(
                        'PAYMENT NOW',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.payment, color: Colors.white),
                      backgroundColor: Color(0xFF1E2857),
                    )
                  : null,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            );
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
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Booking Detail",
      ),
    );
  }
}

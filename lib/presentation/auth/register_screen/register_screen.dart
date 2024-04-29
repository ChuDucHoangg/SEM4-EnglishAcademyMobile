import 'package:english_academy_mobile/presentation/auth/login_screen/login_screen.dart';
import 'package:english_academy_mobile/presentation/auth/register_screen/widgets/register_email_item.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key})
      : super(
          key: key,
        );

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 26.v),
              Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Text(
                  "Sign up to Overskill",
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 12.v),
              Container(
                width: 305.h,
                margin: EdgeInsets.only(
                  left: 25.h,
                  right: 45.h,
                ),
                child: Text(
                  "Explore the best courses online with thousands of classes in design, business, marketing, and many more.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyLargeBluegray30002.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              // SizedBox(height: 12.v),
              SizedBox(height: 350.v, child: RegisterEmailItem()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: [
                    Container(
                      height: 150.h,
                      width: 313.h,
                      margin: EdgeInsets.only(left: 4.h, right: 3.h),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "By signing up you agree to Overskill's",
                            style: CustomTextStyles.bodyMediumff111827,
                          ),
                          TextSpan(
                              text: " Terms of Services",
                              style: CustomTextStyles.titleSmallff111827),
                          TextSpan(
                              text: " and ",
                              style: CustomTextStyles.bodyMediumff111827),
                          TextSpan(
                              text: "Privacy Policy",
                              style: CustomTextStyles.titleSmallff111827)
                        ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 19.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?",
                            style: CustomTextStyles.bodyLargeff111827,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                              text: "Sign In",
                              style: CustomTextStyles.titleMediumff1d2857_1,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                }),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 22.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

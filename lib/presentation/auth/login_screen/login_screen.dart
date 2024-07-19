import 'package:english_academy_mobile/presentation/auth/login_screen/widgets/login_email_item.dart';
import 'package:english_academy_mobile/presentation/auth/login_screen/widgets/login_phone_number_item.dart';
import 'package:english_academy_mobile/presentation/auth/register_screen/register_screen.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_outlined_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26.v),
                Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Text(
                    "Hi! Welcome Back",
                    style: theme.textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary
                    ),
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
                    "We happy to see you again! to use your account, you should sign in first.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeBluegray30002.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
                SizedBox(height: 22.v),
                _buildTabview(context),
                SizedBox(
                  height: 320.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      LoginEmailItem(),
                      LoginPhoneNumberItem(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    children: [
                      SizedBox(height: 20.v),
                      _buildOr(context),
                      SizedBox(height: 26.v),
                      _buildBtnSocial(context),
                      SizedBox(height: 19.v),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t have an account?",
                              style: CustomTextStyles.bodyLargeBluegray30002
                            ),
                            TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                                text: "Sign Up",
                                style: CustomTextStyles.bodyLargeff111827.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()));
                                  }),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 54.v),
                    ],
                  ),
                )
              ],
            ),
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

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 54.v,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.blueGray100,
            width: 1.h,
          ),
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: Color(0xFF1E2857),
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelColor: appTheme.gray600,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.colorScheme.primary,
              width: 1.h,
            ),
          ),
        ),
        dividerColor: Colors.transparent,
        tabs: [
          Tab(
            child: Text(
              "Email",
              style: TextStyle(

              ),
            ),
          ),
          Tab(
            child: Text(
              "Phone Number",
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOr(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 8.v,
              bottom: 7.v,
            ),
            child: SizedBox(
              width: 93.h,
              child: Divider(
                color: appTheme.gray100,
              ),
            ),
          ),
          Text(
            "Or with email",
            style: CustomTextStyles.titleSmallBluegray300,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8.v,
              bottom: 7.v,
            ),
            child: SizedBox(
              width: 93.h,
              child: Divider(
                color: appTheme.gray100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildApple(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        text: "Apple",
        margin: EdgeInsets.only(right: 8.h),
        leftIcon: Container(
          margin: EdgeInsets.only(right: 28.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgFoundationSocialApple,
            color: Theme.of(context).colorScheme.onPrimary,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        buttonStyle: CustomButtonStyles.outlineBlueGray,
        buttonTextStyle: theme.textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGoogle(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        text: "Google",
        margin: EdgeInsets.only(left: 8.h),
        leftIcon: Container(
          margin: EdgeInsets.only(right: 24.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgFlatcoloriconsgoogleAmber500,
            height: 22.adaptSize,
            width: 22.adaptSize,
          ),
        ),
        buttonStyle: CustomButtonStyles.outlineGray,
        buttonTextStyle: theme.textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBtnSocial(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildApple(context),
          _buildGoogle(context),
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

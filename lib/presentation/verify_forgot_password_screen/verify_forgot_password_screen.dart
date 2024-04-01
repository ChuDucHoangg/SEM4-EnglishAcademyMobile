import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_pin_code_text_field.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class VerifyForgotPasswordScreen extends StatelessWidget {
  const VerifyForgotPasswordScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 34.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 36.v),
              Text(
                "Code has been Send to ( +1 ) ***-***-*529",
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 38.v),
              CustomPinCodeTextField(
                context: context,
                onChanged: (value) {},
              ),
              SizedBox(height: 51.v),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Resend Code in ",
                      style: CustomTextStyles.titleSmallff545454,
                    ),
                    TextSpan(
                      text: "59",
                      style: CustomTextStyles.titleMediumMulishff0961f5,
                    ),
                    TextSpan(
                      text: "s",
                      style: CustomTextStyles.titleSmallff545454,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 51.v),
              _buildVerify(context),
              SizedBox(height: 64.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.h),
                child: _buildFour(
                  context,
                  four: "1",
                  five: "2",
                  six: "3",
                ),
              ),
              SizedBox(height: 56.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.h),
                child: _buildFour(
                  context,
                  four: "4",
                  five: "5",
                  six: "6",
                ),
              ),
              SizedBox(height: 55.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.h),
                child: _buildFour(
                  context,
                  four: "7",
                  five: "8",
                  six: "9",
                ),
              ),
              SizedBox(height: 56.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 31.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "*",
                      style: CustomTextStyles.titleLargeMulishGray800,
                    ),
                    Spacer(
                      flex: 51,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.v),
                      child: Text(
                        "0",
                        style: CustomTextStyles.titleMediumMulishGray800,
                      ),
                    ),
                    Spacer(
                      flex: 48,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCloseGray90001,
                      height: 16.v,
                      margin: EdgeInsets.only(
                        top: 2.v,
                        bottom: 8.v,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 35.h,
          top: 17.v,
          bottom: 18.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Forgot Password",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildVerify(BuildContext context) {
    return SizedBox(
      height: 60.v,
      width: 350.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 60.v,
              width: 350.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  30.h,
                ),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black900.withOpacity(0.3),
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: Offset(
                      1,
                      2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 9.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 11.v,
                      bottom: 9.v,
                    ),
                    child: Text(
                      "Verify",
                      style: CustomTextStyles.titleMediumWhiteA700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 94.h),
                    child: CustomIconButton(
                      height: 48.adaptSize,
                      width: 48.adaptSize,
                      padding: EdgeInsets.all(13.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgFill1Primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFour(
      BuildContext context, {
        required String four,
        required String five,
        required String six,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          four,
          style: CustomTextStyles.titleMediumMulishGray800.copyWith(
            color: appTheme.gray800,
          ),
        ),
        Text(
          five,
          style: CustomTextStyles.titleMediumMulishGray800.copyWith(
            color: appTheme.gray800,
          ),
        ),
        Text(
          six,
          style: CustomTextStyles.titleMediumMulishGray800.copyWith(
            color: appTheme.gray800,
          ),
        ),
      ],
    );
  }
}

import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class LetSYouInScreen extends StatelessWidget {
  const LetSYouInScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 39.h,
            vertical: 90.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Let’s you in",
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 27.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    height: 48.adaptSize,
                    width: 48.adaptSize,
                    padding: EdgeInsets.all(13.h),
                    decoration: IconButtonStyleHelper.outlineBlackTL24,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgGoogle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 15.v,
                      bottom: 11.v,
                    ),
                    child: Text(
                      "Continue with Google",
                      style: CustomTextStyles.titleMediumMulishGray700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    height: 48.adaptSize,
                    width: 48.adaptSize,
                    padding: EdgeInsets.all(14.h),
                    decoration: IconButtonStyleHelper.outlineBlackTL24,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgGroup3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 15.v,
                      bottom: 11.v,
                    ),
                    child: Text(
                      "Continue with Apple",
                      style: CustomTextStyles.titleMediumMulishGray700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.v),
              Text(
                "( Or )",
                style: CustomTextStyles.titleSmallExtraBold,
              ),
              SizedBox(height: 28.v),
              CustomElevatedButton(
                text: "Sign In with Your Account",
              ),
              SizedBox(height: 29.v),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don’t have an Account? ",
                      style: CustomTextStyles.titleSmallff545454,
                    ),
                    TextSpan(
                      text: "SIGN UP",
                      style: CustomTextStyles.titleSmallff0961f5,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 121.h,
                  child: Divider(
                    color: theme.colorScheme.primary,
                    endIndent: 65.h,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

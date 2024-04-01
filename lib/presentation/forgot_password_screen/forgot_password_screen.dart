import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 123.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Container(
                width: 303.h,
                margin: EdgeInsets.symmetric(horizontal: 28.h),
                child: Text(
                  "Select which contact details should we use to Reset Your Password",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 38.v),
              _buildOne(context),
              SizedBox(height: 20.v),
              _buildTwo(context),
              SizedBox(height: 40.v),
              _buildContinue(context),
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
  Widget _buildOne(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.v),
            child: CustomIconButton(
              height: 36.adaptSize,
              width: 36.adaptSize,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.outlineTeal,
              child: CustomImageView(
                imagePath: ImageConstant.imgLockTeal700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Via Email",
                  style: CustomTextStyles.labelLargeGray800,
                ),
                SizedBox(height: 5.v),
                Text(
                  "priscilla.frank26@gmail.com",
                  style: CustomTextStyles.titleSmallBluegray900_2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.v),
            child: CustomIconButton(
              height: 36.adaptSize,
              width: 36.adaptSize,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.outlineTeal,
              child: CustomImageView(
                imagePath: ImageConstant.imgLockTeal700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Via SMS",
                  style: CustomTextStyles.labelLargeGray800,
                ),
                SizedBox(height: 5.v),
                Text(
                  "( +1 ) 480-894-5529",
                  style: CustomTextStyles.titleSmallBluegray900_2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
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
                    padding: EdgeInsets.symmetric(vertical: 10.v),
                    child: Text(
                      "Continue",
                      style: CustomTextStyles.titleMediumWhiteA700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 81.h),
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
}

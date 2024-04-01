import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_switch.dart';
import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen({Key? key})
      : super(
    key: key,
  );

  bool isSelectedSwitch = false;

  bool isSelectedSwitch1 = false;

  bool isSelectedSwitch2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 14.v,
          ),
          child: Column(
            children: [
              _buildOne(context),
              SizedBox(height: 40.v),
              _buildTwo(context),
              SizedBox(height: 40.v),
              _buildThree(context),
              SizedBox(height: 45.v),
              _buildFour(context),
              Spacer(),
              CustomOutlinedButton(
                text: "Change PIN",
                margin: EdgeInsets.symmetric(horizontal: 4.h),
                buttonStyle: CustomButtonStyles.outlineBlueGrayTL301,
              ),
              SizedBox(height: 30.v),
              CustomElevatedButton(
                text: "Change Password",
                margin: EdgeInsets.symmetric(horizontal: 4.h),
                rightIcon: Container(
                  padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
                  margin: EdgeInsets.only(left: 30.h),
                  decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    borderRadius: BorderRadius.circular(
                      24.h,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFill1Primary,
                    height: 17.v,
                  ),
                ),
              ),
              SizedBox(height: 27.v),
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
        text: "Security",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 3.v,
            bottom: 5.v,
          ),
          child: Text(
            "Remember Me",
            style: CustomTextStyles.titleMediumMulishBold,
          ),
        ),
        CustomSwitch(
          value: isSelectedSwitch,
          onChange: (value) {
            isSelectedSwitch = value;
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 3.v,
            bottom: 5.v,
          ),
          child: Text(
            "Biometric ID",
            style: CustomTextStyles.titleMediumMulishBold,
          ),
        ),
        CustomSwitch(
          value: isSelectedSwitch1,
          onChange: (value) {
            isSelectedSwitch1 = value;
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildThree(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 3.v,
            bottom: 5.v,
          ),
          child: Text(
            "Face ID",
            style: CustomTextStyles.titleMediumMulishBold,
          ),
        ),
        CustomSwitch(
          value: isSelectedSwitch2,
          onChange: (value) {
            isSelectedSwitch2 = value;
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Google Authenticator",
          style: CustomTextStyles.titleMediumMulishBold,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRightGray90001,
          width: 10.h,
          margin: EdgeInsets.only(bottom: 2.v),
        ),
      ],
    );
  }
}

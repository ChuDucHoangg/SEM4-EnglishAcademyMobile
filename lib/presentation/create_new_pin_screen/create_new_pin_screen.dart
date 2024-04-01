import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_pin_code_text_field.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CreateNewPinScreen extends StatelessWidget {
  const CreateNewPinScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 34.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 26.v),
            Container(
              width: 273.h,
              margin: EdgeInsets.only(
                left: 42.h,
                right: 43.h,
              ),
              child: Text(
                "Add a Pin Number to Make Your Account more Secure",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall,
              ),
            ),
            SizedBox(height: 84.v),
            CustomPinCodeTextField(
              context: context,
              onChanged: (value) {},
            ),

            SizedBox(height: 70.v),
            _buildContinue(context),
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
          top: 18.v,
          bottom: 18.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Create New Pin",
        margin: EdgeInsets.only(left: 12.h),
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0.1,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
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

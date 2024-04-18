import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class FortyfiveItemWidget extends StatelessWidget {
  const FortyfiveItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineBluegray501.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 48.adaptSize,
            width: 48.adaptSize,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgAvatar,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  radius: BorderRadius.circular(
                    24.h,
                  ),
                  alignment: Alignment.center,
                ),
                _buildFortyFive(context),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 2.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Merrill Kervin",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 10.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgTelevision,
                      height: 14.adaptSize,
                      width: 14.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "585k students",
                        style: CustomTextStyles.labelLargeGray60001,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgForward,
            height: 14.adaptSize,
            width: 14.adaptSize,
            margin: EdgeInsets.only(
              top: 31.v,
              bottom: 3.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 2.h,
              top: 30.v,
              bottom: 2.v,
            ),
            child: Text(
              "12 courses",
              style: CustomTextStyles.labelLargeGray60001,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFortyFive(BuildContext context) {
    return CustomElevatedButton(
      height: 16.v,
      width: 32.h,
      text: "4.5",
      buttonStyle: CustomButtonStyles.fillAmberA,
      buttonTextStyle: CustomTextStyles.labelSmallOnErrorContainer,
      alignment: Alignment.bottomCenter,
    );
  }
}

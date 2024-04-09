import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class Uxdesign3ItemWidget extends StatelessWidget {
  const Uxdesign3ItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17.h),
      decoration: AppDecoration.outlineGray100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 51.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage11,
                  height: 66.adaptSize,
                  width: 66.adaptSize,
                  radius: BorderRadius.circular(
                    6.h,
                  ),
                  margin: EdgeInsets.only(bottom: 2.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomElevatedButton(
                        height: 20.v,
                        width: 55.h,
                        text: "UX Design",
                        buttonTextStyle: theme.textTheme.labelSmall!,
                      ),
                      SizedBox(height: 3.v),
                      SizedBox(
                        width: 157.h,
                        child: Text(
                          "Master Digital Product Design: UX Research",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall!.copyWith(
                            height: 1.60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "75% completed",
              style: CustomTextStyles.labelLargeGray60001,
            ),
          ),
          SizedBox(height: 12.v),
          Container(
            height: 8.v,
            width: 291.h,
            decoration: BoxDecoration(
              color: appTheme.gray100,
              borderRadius: BorderRadius.circular(
                3.h,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                3.h,
              ),
              child: LinearProgressIndicator(
                value: 0.75,
                backgroundColor: appTheme.gray100,
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

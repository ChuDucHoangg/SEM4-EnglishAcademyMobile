import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class UiuxdesignItemWidget extends StatelessWidget {
  const UiuxdesignItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Row(
        children: [
          Container(
            height: 134.v,
            width: 130.h,
            decoration: BoxDecoration(
              color: appTheme.black900,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16.h),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 19.v,
              bottom: 19.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "UI/UX Design",
                  style: CustomTextStyles.labelLargeOrangeA700,
                ),
                SizedBox(height: 4.v),
                Text(
                  "Intro to UI/UX Design",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 9.v),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSignalAmberA20001,
                      height: 12.adaptSize,
                      width: 12.adaptSize,
                      margin: EdgeInsets.only(top: 3.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 3.h,
                        top: 3.v,
                      ),
                      child: Text(
                        "4.4",
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "|",
                        style: CustomTextStyles.titleSmallBlack900,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 3.v,
                      ),
                      child: Text(
                        "3 Hrs 06 Mins",
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.v),
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 3.v,
                          bottom: 4.v,
                        ),
                        child: Container(
                          height: 6.v,
                          width: 144.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray50,
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                            border: Border.all(
                              color: appTheme.blue50,
                              width: 6.h,
                              strokeAlign: strokeAlignOutside,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                            child: LinearProgressIndicator(
                              value: 0.82,
                              backgroundColor: appTheme.gray50,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                appTheme.teal700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.h),
                        child: Text(
                          "93/125",
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

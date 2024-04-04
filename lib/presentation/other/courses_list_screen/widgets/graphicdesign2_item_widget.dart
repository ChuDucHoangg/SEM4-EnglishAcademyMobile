import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class Graphicdesign2ItemWidget extends StatelessWidget {
  const Graphicdesign2ItemWidget({Key? key})
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
            height: 130.adaptSize,
            width: 130.adaptSize,
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
              top: 15.v,
              bottom: 18.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 195.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Graphic Design",
                        style: CustomTextStyles.labelLargeOrangeA700,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgBookmark,
                        width: 12.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 9.v),
                Text(
                  "Graphic Design Advanced",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 2.v),
                Row(
                  children: [
                    Text(
                      "28",
                      style: CustomTextStyles.titleMediumMulishPrimary,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5.h,
                        top: 3.v,
                      ),
                      child: Text(
                        "42",
                        style: CustomTextStyles.labelLargeBluegray200.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.v),
                Row(
                  children: [
                    Container(
                      width: 32.h,
                      margin: EdgeInsets.only(top: 3.v),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSignalAmberA20001,
                            height: 12.adaptSize,
                            width: 12.adaptSize,
                            margin: EdgeInsets.only(bottom: 2.v),
                          ),
                          Text(
                            "4.2",
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
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
                        "7830 Std",
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

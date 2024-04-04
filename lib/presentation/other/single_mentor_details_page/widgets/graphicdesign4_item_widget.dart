import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class Graphicdesign4ItemWidget extends StatelessWidget {
  const Graphicdesign4ItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 130.adaptSize,
          width: 130.adaptSize,
          decoration: BoxDecoration(
            color: appTheme.black900,
            borderRadius: BorderRadius.circular(
              16.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 15.v,
            bottom: 18.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 176.h,
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
                "Graphic Design Advan..",
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
                      "4.2",
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class GraphicdesignItemWidget extends StatelessWidget {
  const GraphicdesignItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      width: 280.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 134.v,
            width: 280.h,
            decoration: BoxDecoration(
              color: appTheme.black900,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.h),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Graphic Design",
                    style: CustomTextStyles.labelLargeOrangeA700,
                  ),
                  SizedBox(height: 6.v),
                  Text(
                    "Graphic Design Advanced",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 9.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "28",
                        style: CustomTextStyles.titleSmallPrimary,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 17.h),
                        child: Text(
                          "|",
                          style: CustomTextStyles.titleSmallBlack900,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgSignalAmberA20001,
                        height: 12.adaptSize,
                        width: 12.adaptSize,
                        margin: EdgeInsets.only(
                          left: 16.h,
                          top: 3.v,
                          bottom: 3.v,
                        ),
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
              CustomImageView(
                imagePath: ImageConstant.imgFill1,
                width: 14.h,
                margin: EdgeInsets.only(
                  left: 41.h,
                  bottom: 57.v,
                ),
              ),
            ],
          ),
          SizedBox(height: 21.v),
        ],
      ),
    );
  }
}

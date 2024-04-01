import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class OffItemWidget extends StatelessWidget {
  const OffItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder22,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 79.v,
                  width: 190.h,
                  margin: EdgeInsets.only(bottom: 5.v),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(right: 34.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.h,
                            vertical: 23.v,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: fs.Svg(
                                ImageConstant.imgGroup70,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.v),
                              Text(
                                "25% Off*".toUpperCase(),
                                style: CustomTextStyles
                                    .titleSmallWhiteA700ExtraBold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        width: 21.h,
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(right: 10.h),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeftBlueA40001,
                        width: 14.h,
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(
                          top: 24.v,
                          right: 14.h,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Today’s Special",
                          style: CustomTextStyles.titleLargeMulishWhiteA700,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgTriangleBlueA40001,
                  height: 8.adaptSize,
                  width: 8.adaptSize,
                  margin: EdgeInsets.only(
                    left: 7.h,
                    top: 77.v,
                  ),
                ),
                Container(
                  height: 10.v,
                  width: 40.h,
                  margin: EdgeInsets.only(
                    top: 31.v,
                    bottom: 44.v,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20.h,
                    ),
                    border: Border.all(
                      color: appTheme.blueA40001,
                      width: 2.h,
                      strokeAlign: strokeAlignCenter,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.v),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 93.v,
                width: 336.h,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgPath2,
                      height: 76.v,
                      alignment: Alignment.bottomRight,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 172.h,
                        child: Text(
                          "Get a Discount for Every Course Order only Valid for Today.!",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelLargeWhiteA700ExtraBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:english_academy_mobile/widgets/custom_rating_bar.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class PaymentMethods1Screen extends StatelessWidget {
  const PaymentMethods1Screen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.img35PaymentMethods,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 12.adaptSize,
                      width: 12.adaptSize,
                      margin: EdgeInsets.only(
                        top: 41.v,
                        bottom: 10.v,
                      ),
                      decoration: BoxDecoration(
                        color: appTheme.orangeA700,
                        borderRadius: BorderRadius.circular(
                          6.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 11.h),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 147.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgBrightness,
                                  width: 25.h,
                                  margin: EdgeInsets.only(
                                    top: 6.v,
                                    bottom: 9.v,
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgCloseTeal700,
                                  width: 25.h,
                                  margin: EdgeInsets.only(top: 15.v),
                                ),
                                Spacer(),
                                CustomImageView(
                                  imagePath: ImageConstant.imgSignalAmberA40001,
                                  height: 18.adaptSize,
                                  width: 18.adaptSize,
                                  margin: EdgeInsets.only(bottom: 30.v),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.v),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 12.adaptSize,
                              width: 12.adaptSize,
                              margin: EdgeInsets.only(right: 14.h),
                              decoration: BoxDecoration(
                                color: appTheme.gray80001,
                                borderRadius: BorderRadius.circular(
                                  6.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSignal,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(
                        top: 50.v,
                        bottom: 53.v,
                      ),
                    ),
                    Container(
                      height: 118.v,
                      width: 135.h,
                      margin: EdgeInsets.only(
                        left: 14.h,
                        top: 2.v,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgGroup21,
                            width: 60.h,
                            alignment: Alignment.center,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgTriangle,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                            alignment: Alignment.bottomLeft,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 3.h),
                                    child: CustomRatingBar(
                                      initialRating: 0,
                                      itemSize: 36,
                                      itemCount: 2,
                                    ),
                                  ),
                                  SizedBox(height: 33.v),
                                  Container(
                                    height: 8.adaptSize,
                                    width: 8.adaptSize,
                                    decoration: BoxDecoration(
                                      color: appTheme.teal700,
                                      borderRadius: BorderRadius.circular(
                                        4.h,
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
                    CustomImageView(
                      imagePath: ImageConstant.imgTriangleTeal700,
                      height: 14.adaptSize,
                      width: 14.adaptSize,
                      margin: EdgeInsets.only(
                        left: 32.h,
                        bottom: 107.v,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.v),
                Text(
                  "Congratulations",
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 10.v),
                SizedBox(
                  width: 275.h,
                  child: Text(
                    "Your Payment is Successfully. Purchase a New Course",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 16.v),
                Text(
                  "Watch the Course",
                  style: CustomTextStyles.titleMediumTeal700.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 18.v),
                CustomElevatedButton(
                  width: 206.h,
                  text: "E - Receipt",
                ),
                SizedBox(height: 3.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

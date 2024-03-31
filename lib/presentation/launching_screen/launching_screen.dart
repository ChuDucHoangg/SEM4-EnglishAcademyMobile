import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class LaunchingScreen extends StatelessWidget {
  const LaunchingScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SizedBox(
        height: SizeUtils.height,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 49.h,
                  vertical: 289.v,
                ),
                decoration: AppDecoration.fillPrimary,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 18.v),
                    Container(
                      height: 330.adaptSize,
                      width: 330.adaptSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          165.h,
                        ),
                        border: Border.all(
                          color: appTheme.blue50,
                          width: 3.h,
                          strokeAlign: strokeAlignCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildThirtyThree(context),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildThirtyThree(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(left: 1.h),
        padding: EdgeInsets.symmetric(
          horizontal: 155.h,
          vertical: 123.v,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageConstant.imgGroup33,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.v),
            CustomImageView(
              imagePath: ImageConstant.imgIconBlack900,
              height: 116.adaptSize,
              width: 116.adaptSize,
            ),
            Text(
              "Telead",
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              "Learn From Home".toUpperCase(),
              style: CustomTextStyles.labelMediumPoppinsBlack900,
            ),
          ],
        ),
      ),
    );
  }
}

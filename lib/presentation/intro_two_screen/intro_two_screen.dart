import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class IntroTwoScreen extends StatelessWidget {
  const IntroTwoScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 34.h,
          vertical: 50.v,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Skip",
                style: theme.textTheme.titleMedium,
              ),
            ),
            Spacer(
              flex: 78,
            ),
            Text(
              "Learn from Anytime",
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 6.v),
            Text(
              "Booked or Same the Lectures for Future",
              style: theme.textTheme.titleSmall,
            ),
            Spacer(
              flex: 21,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildTelevision(context),
    );
  }

  /// Section Widget
  Widget _buildTelevision(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 34.h,
        right: 34.h,
        bottom: 66.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 10.v,
            margin: EdgeInsets.symmetric(vertical: 25.v),
            child: AnimatedSmoothIndicator(
              activeIndex: 0,
              count: 3,
              effect: ScrollingDotsEffect(
                spacing: 15,
                activeDotColor: theme.colorScheme.primary,
                dotColor: appTheme.teal5001,
                dotHeight: 10.v,
                dotWidth: 10.h,
              ),
            ),
          ),
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(16.h),
            decoration: IconButtonStyleHelper.outlineBlack,
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowRightWhiteA700,
            ),
          ),
        ],
      ),
    );
  }
}

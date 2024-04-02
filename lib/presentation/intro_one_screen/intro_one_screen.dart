import 'package:english_academy_mobile/presentation/intro_two_screen/intro_two_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class IntroOneScreen extends StatelessWidget {
  const IntroOneScreen({Key? key})
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
              flex: 80,
            ),
            Text(
              "Online Learning",
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 6.v),
            SizedBox(
              width: 355.h,
              child: Text(
                "We Provide Classes Online Classes and Pre Recorded Leactures.!",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall,
              ),
            ),
            Spacer(
              flex: 19,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildPagination(context),
    );
  }

  /// Section Widget
  Widget _buildPagination(BuildContext context) {
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
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntroTwoScreen()),
                );
              },
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowRightWhiteA700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

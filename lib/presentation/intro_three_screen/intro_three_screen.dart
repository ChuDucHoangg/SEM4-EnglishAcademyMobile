import 'package:english_academy_mobile/init_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class IntroThreeScreen extends StatelessWidget {
  const IntroThreeScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 16.v,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLightBulb1,
                  height: 240.adaptSize,
                  width: 240.adaptSize,
                ),
                SizedBox(height: 48.v),
                Column(
                  children: [
                    Text(
                      "Welcome to English Academy",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 6.v),
                    SizedBox(
                      width: 220.h,
                      child: Text(
                        "One Lesson at a Time with English Academy.",
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray30002.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

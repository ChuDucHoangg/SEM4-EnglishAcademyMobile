import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

class IntroOneScreen extends StatelessWidget {
  const IntroOneScreen({Key? key}) : super(key: key);

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
                  imagePath: ImageConstant.imgBookStack1,
                  height: 240.adaptSize,
                  width: 240.adaptSize,
                ),
                SizedBox(height: 48.v),
                Column(
                  children: [
                    Text(
                      "Online Learning",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 6.v),
                    SizedBox(
                      width: 355.h,
                      child: Text(
                        "We Provide Classes Online Classes and Pre Recorded Leactures!",
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

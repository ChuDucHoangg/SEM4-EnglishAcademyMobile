import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class IntroTwoScreen extends StatelessWidget {
  const IntroTwoScreen({Key? key})
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
                  imagePath: ImageConstant.imgCertificate1,
                  height: 240.adaptSize,
                  width: 240.adaptSize,
                ),
                SizedBox(height: 48.v),
                Column(
                  children: [
                    Text(
                      "Expand Your Career Opporturnity",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 6.v),
                    SizedBox(
                      width: 355.h,
                      child: Text(
                        "Expand your career opportunities with online courses and quality lectures.",
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

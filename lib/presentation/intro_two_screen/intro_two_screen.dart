import 'package:english_academy_mobile/presentation/intro_three_screen/intro_three_screen.dart';
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyLargeBluegray30002.copyWith(
              ),
            ),
            Spacer(
              flex: 21,
            ),
          ],
        ),
      ),
    );
  }
}

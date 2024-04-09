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
              "Get Online Certificate",
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 10.v),
            Text(
              "Analyse your scores and Track your results",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyLargeBluegray30002.copyWith(
                height: 1.50,
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

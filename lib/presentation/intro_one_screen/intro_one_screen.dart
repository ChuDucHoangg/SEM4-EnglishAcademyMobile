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
                style: CustomTextStyles.bodyLargeBluegray30002.copyWith(
                  height: 1.50,
                ),
              ),
            ),
            Spacer(
              flex: 19,
            ),
          ],
        ),
      ),
    );
  }
}



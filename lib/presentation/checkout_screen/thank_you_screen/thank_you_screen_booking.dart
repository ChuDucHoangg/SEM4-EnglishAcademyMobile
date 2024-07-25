import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import '../../../init_screen.dart';

class ThankYouScreenBooking extends StatefulWidget {
  ThankYouScreenBooking({Key? key}) : super(key: key);

  @override
  ThankYouScreenBookingState createState() => ThankYouScreenBookingState();
}

class ThankYouScreenBookingState extends State<ThankYouScreenBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 50.v,
        ),
        child: Column(
          children: [
            SizedBox(height: 140.v),
            CustomImageView(
              imagePath: ImageConstant.imgPaymentCheck1,
              height: 140.adaptSize,
              width: 140.adaptSize,
            ),
            SizedBox(height: 50.v),
            Text(
              "Successfully Purchased!",
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 8.v),
            Container(
              width: 310.h,
              margin: EdgeInsets.symmetric(horizontal: 8.h),
              child: Text(
                "Neque et fermentum parturient euismod pellentesque.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeGray60001.copyWith(
                  height: 1.50,
                ),
              ),
            ),
            Spacer(),
            SizedBox(height: 12.v),
            CustomOutlinedButton(
              text: "Back to Home",
              buttonStyle: CustomButtonStyles.outlineBlueGrayTL28,
              buttonTextStyle: CustomTextStyles.titleMediumIndigo100,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InitScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

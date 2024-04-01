import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class PaidItemWidget extends StatelessWidget {
  const PaidItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 92.adaptSize,
            width: 92.adaptSize,
            margin: EdgeInsets.only(bottom: 25.v),
            decoration: BoxDecoration(
              color: appTheme.black900,
              borderRadius: BorderRadius.circular(
                18.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 5.v,
              bottom: 28.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Build Personal Branding",
                  style: CustomTextStyles.titleMedium18,
                ),
                SizedBox(height: 4.v),
                Text(
                  "Web Designer",
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 12.v),
                Container(
                  width: 60.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 17.h,
                    vertical: 2.v,
                  ),
                  decoration: AppDecoration.outlineTeal700.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder4,
                  ),
                  child: Text(
                    "Paid",
                    style: CustomTextStyles.labelLargeWhiteA70012,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

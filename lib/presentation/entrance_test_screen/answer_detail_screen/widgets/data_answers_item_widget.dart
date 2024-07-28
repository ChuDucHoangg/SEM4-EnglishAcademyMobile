import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class DataAnswersItemWidget extends StatelessWidget {
  final String optionText;
  final bool isCorrect;

  const DataAnswersItemWidget({
    Key? key,
    required this.optionText,
    required this.isCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String truncateText(String text) {
      if (text.length > 25) {
        return text.substring(0, 25) + '...';
      } else {
        return text;
      }
    }
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 17.v,
      ),
      decoration: isCorrect
        ? AppDecoration.outlineGreen.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      )
          : AppDecoration.outlinePink.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        children: [
          Container(
            height: 20.adaptSize,
            width: 20.adaptSize,
            padding: EdgeInsets.all(3.h),
            decoration: isCorrect
                ? AppDecoration.fillGreenB.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            )
                : AppDecoration.fillRedA.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: CustomImageView(
              imagePath: isCorrect ? ImageConstant.imgCheck : ImageConstant.imgArrowRightOnerrorcontainer,
              height: 13.adaptSize,
              width: 13.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Text(
              truncateText(optionText),
              style: CustomTextStyles.titleMediumMedium,
            ),
          ),
        ],
      ),
    );
  }
}

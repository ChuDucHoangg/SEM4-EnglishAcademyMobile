import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class List5ItemWidget extends StatelessWidget {
  const List5ItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 11.h),
            child: Row(
              children: [
                CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(10.h),
                  decoration: IconButtonStyleHelper.outlineBlueGrayTL20,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgIcon3,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      top: 2.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Congrats! Your order successful",
                          style: CustomTextStyles.titleSmallOnPrimaryContainer,
                        ),
                        SizedBox(height: 5.v),
                        Text(
                          "Orders",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          SizedBox(
            width: 294.h,
            child: Text(
              "Semper consequat pharetra vitae nisl eget lectus. Convallis in turpis quam sed in. Vehicula diam euismod cursus posuere cras urna ultrice.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.labelLargeGray60001.copyWith(
                height: 1.60,
              ),
            ),
          ),
          SizedBox(height: 12.v),
          Text(
            "Jan 28, 2023 04:00 PM",
            style: CustomTextStyles.bodySmallBluegray300_1,
          ),
        ],
      ),
    );
  }
}

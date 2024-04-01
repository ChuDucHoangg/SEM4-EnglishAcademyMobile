import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class WilliamkolivasItemWidget extends StatelessWidget {
  const WilliamkolivasItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 66.adaptSize,
          width: 66.adaptSize,
          decoration: BoxDecoration(
            color: appTheme.black900,
            borderRadius: BorderRadius.circular(
              33.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 11.h,
            top: 9.v,
            bottom: 12.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "William K. Olivas",
                style: CustomTextStyles.titleMedium17,
              ),
              SizedBox(height: 1.v),
              Text(
                "3D Design",
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

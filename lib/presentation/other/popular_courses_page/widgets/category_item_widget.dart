import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 17.h,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(
            left: 21.h,
            top: 1.v,
            bottom: 1.v,
          ),
          child: Text(
            "All",
            style: CustomTextStyles.labelLargeWhiteA700,
          ),
        ),
      ),
    );
  }
}

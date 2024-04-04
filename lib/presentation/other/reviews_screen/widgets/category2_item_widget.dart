import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class Category2ItemWidget extends StatelessWidget {
  const Category2ItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54.h,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(
            left: 18.h,
            top: 2.v,
            bottom: 1.v,
          ),
          child: Text(
            "Excellect",
            style: CustomTextStyles.labelLargeWhiteA700,
          ),
        ),
      ),
    );
  }
}

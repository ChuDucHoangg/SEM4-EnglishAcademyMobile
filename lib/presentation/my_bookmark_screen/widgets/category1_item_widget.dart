import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class Category1ItemWidget extends StatelessWidget {
  const Category1ItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 17.h,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(
            left: 21.h,
            top: 1.v,
            bottom: 1.v,
          ),
          child: Text(
            "All",
            style: CustomTextStyles.labelLargeBluegray900_1,
          ),
        ),
      ),
    );
  }
}

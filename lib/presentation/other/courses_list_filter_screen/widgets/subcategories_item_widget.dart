import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class SubcategoriesItemWidget extends StatelessWidget {
  const SubcategoriesItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 55.h),
      child: Row(
        children: [
          Container(
            height: 28.adaptSize,
            width: 28.adaptSize,
            decoration: BoxDecoration(
              color: appTheme.blue50,
              borderRadius: BorderRadius.circular(
                8.h,
              ),
              border: Border.all(
                color: appTheme.blueGray200,
                width: 2.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 11.h,
              top: 7.v,
              bottom: 2.v,
            ),
            child: Text(
              "3D Design",
              style: CustomTextStyles.titleSmallBluegray900_1,
            ),
          ),
        ],
      ),
    );
  }
}

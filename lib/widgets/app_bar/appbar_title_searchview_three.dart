import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitleSearchviewThree extends StatelessWidget {
  AppbarTitleSearchviewThree({
    Key? key,
    this.hintText,
    this.controller,
    this.margin,
  }) : super(
    key: key,
  );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomSearchView(
        width: 287.h,
        controller: controller,
        hintText: "Search something",
        hintStyle: CustomTextStyles.bodyMediumBluegray300,
        borderDecoration: SearchViewStyleHelper.outlineBlueGray,
        filled: false,
      ),
    );
  }
}

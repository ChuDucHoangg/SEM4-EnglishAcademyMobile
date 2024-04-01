import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 16.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SubCategories:",
                  style: CustomTextStyles.titleMedium18,
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: _buildOne(
                  context,
                  englishUS: "English (US)",
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 6.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "English (UK)",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 25.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Language",
                  style: CustomTextStyles.titleMedium18,
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: _buildOne(
                  context,
                  englishUS: "English (US)",
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Arabic",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Hindi",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 6.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Bengali",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Deutsch",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Italian",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Korean",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Francais",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Russian",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Polish",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 6.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Spanish",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Mandarin",
                        style: CustomTextStyles.titleSmallBluegray90015,
                      ),
                    ),
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
                  ],
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 35.h,
          top: 17.v,
          bottom: 18.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Language",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Common widget
  Widget _buildOne(
      BuildContext context, {
        required String englishUS,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 6.v,
            bottom: 2.v,
          ),
          child: Text(
            englishUS,
            style: CustomTextStyles.titleSmallBluegray90015.copyWith(
              color: appTheme.blueGray900,
            ),
          ),
        ),
        CustomIconButton(
          height: 28.adaptSize,
          width: 28.adaptSize,
          padding: EdgeInsets.all(7.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgCheckmarkWhiteA700,
          ),
        ),
      ],
    );
  }
}

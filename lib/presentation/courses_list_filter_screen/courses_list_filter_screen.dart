import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:grouped_list/grouped_list.dart';
import '../courses_list_filter_screen/widgets/subcategories_item_widget.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_checkbox_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CoursesListFilterScreen extends StatelessWidget {
  CoursesListFilterScreen({Key? key})
      : super(
    key: key,
  );

  List subcategoriesItemList = [
    {'id': 1, 'groupBy': "SubCategories:"},
    {'id': 2, 'groupBy': "SubCategories:"},
    {'id': 3, 'groupBy': "SubCategories:"},
    {'id': 4, 'groupBy': "SubCategories:"},
    {'id': 5, 'groupBy': "SubCategories:"},
    {'id': 6, 'groupBy': "SubCategories:"},
    {'id': 7, 'groupBy': "Levels:"},
    {'id': 8, 'groupBy': "Levels:"},
    {'id': 9, 'groupBy': "Levels:"},
    {'id': 10, 'groupBy': "Levels:"}
  ];

  bool hours = false;

  bool hours1 = false;

  bool hours2 = false;

  bool hours3 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(context),
        body: Container(
          width: 355.h,
          margin: EdgeInsets.fromLTRB(34.h, 22.v, 39.h, 5.v),
          decoration: AppDecoration.fillGray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubCategories(context),
              SizedBox(height: 30.v),
              Text(
                "Price:",
                style: CustomTextStyles.titleMedium18,
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
                child: Row(
                  children: [
                    CustomIconButton(
                      height: 28.adaptSize,
                      width: 28.adaptSize,
                      padding: EdgeInsets.all(7.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgCheckmarkWhiteA700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 11.h,
                        top: 5.v,
                        bottom: 4.v,
                      ),
                      child: Text(
                        "Paid",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
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
                        top: 6.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Free",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.v),
              Text(
                "Features:",
                style: CustomTextStyles.titleMedium18,
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
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
                        "All Captian",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
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
                        "Quizzes",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
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
                        "Coding Exercise",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
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
                        top: 5.v,
                        bottom: 4.v,
                      ),
                      child: Text(
                        "Practice Tests",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 31.v),
              Text(
                "Rating:",
                style: CustomTextStyles.titleMedium18,
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
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
                        "4.5 & Up Above",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
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
                        "4.0 & Up Above",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
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
                        "3.5 & Up Above",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
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
                        "3.0 & Up Above",
                        style: CustomTextStyles.titleSmallBluegray900_1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.v),
              Text(
                "Video Durations:",
                style: CustomTextStyles.titleMedium18,
              ),
              SizedBox(height: 15.v),
              _buildHours(context),
              SizedBox(height: 18.v),
              _buildHours1(context),
              SizedBox(height: 18.v),
              _buildHours2(context),
              SizedBox(height: 18.v),
              _buildHours3(context),
              SizedBox(height: 40.v),
              CustomElevatedButton(
                text: "Apply",
                margin: EdgeInsets.only(left: 5.h),
                rightIcon: Container(
                  padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
                  margin: EdgeInsets.only(left: 30.h),
                  decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    borderRadius: BorderRadius.circular(
                      24.h,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFill1Primary,
                    height: 17.v,
                  ),
                ),
              ),
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
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Filter",
        margin: EdgeInsets.only(left: 12.h),
      ),
      actions: [
        AppbarSubtitleOne(
          text: "Clear",
          margin: EdgeInsets.fromLTRB(34.h, 16.v, 34.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSubCategories(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 159.h),
      child: GroupedListView<dynamic, String>(
        shrinkWrap: true,
        stickyHeaderBackgroundColor: Colors.transparent,
        elements: subcategoriesItemList,
        groupBy: (element) => element['groupBy'],
        sort: false,
        groupSeparatorBuilder: (String value) {
          return Padding(
            padding: EdgeInsets.only(
              top: 30.v,
              bottom: 15.v,
            ),
            child: Text(
              value,
              style: CustomTextStyles.titleMedium18.copyWith(
                color: appTheme.blueGray900,
              ),
            ),
          );
        },
        itemBuilder: (context, model) {
          return SubcategoriesItemWidget();
        },
        separator: SizedBox(
          height: 18.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHours(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 31.h),
      child: CustomCheckboxButton(
        text: "0-2 Hours",
        value: hours,
        padding: EdgeInsets.symmetric(vertical: 3.v),
        onChange: (value) {
          hours = value;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHours1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 31.h),
      child: CustomCheckboxButton(
        text: "3-6 Hours",
        value: hours1,
        padding: EdgeInsets.symmetric(vertical: 3.v),
        onChange: (value) {
          hours1 = value;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHours2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 31.h),
      child: CustomCheckboxButton(
        text: "7-16 Hours",
        value: hours2,
        padding: EdgeInsets.symmetric(vertical: 3.v),
        onChange: (value) {
          hours2 = value;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHours3(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 31.h),
      child: CustomCheckboxButton(
        text: "17+ Hours",
        value: hours3,
        padding: EdgeInsets.symmetric(vertical: 3.v),
        onChange: (value) {
          hours3 = value;
        },
      ),
    );
  }
}

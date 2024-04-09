import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:english_academy_mobile/widgets/custom_drop_down.dart';
import '../../widgets/custom_search_view.dart';
import 'widgets/data_course_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CourseScreen extends StatelessWidget {
  CourseScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList1 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              child: Align(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 65.v),
                      CustomSearchView(
                        controller: searchController,
                        hintText: "Search",
                        hintStyle: CustomTextStyles.bodyMediumBluegray300,
                        borderDecoration:
                            SearchViewStyleHelper.outlineBlueGrayTL12,
                        filled: false,
                      ),
                      SizedBox(height: 10.v),
                      _buildTab(context),
                      SizedBox(height: 26.v),
                      _buildTitle(context),
                      SizedBox(height: 16.v),
                      _buildUXDesign(context),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 74.v,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.5, 0.09),
                    end: Alignment(0.5, 0.92),
                    colors: [
                      theme.colorScheme.onErrorContainer.withOpacity(0),
                      theme.colorScheme.onErrorContainer.withOpacity(0.7),
                      theme.colorScheme.onErrorContainer.withOpacity(1),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTab(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomOutlinedButton(
          height: 32.v,
          width: 77.h,
          text: "Filter",
          leftIcon: Container(
            margin: EdgeInsets.only(right: 8.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgUserGray60001,
              height: 14.adaptSize,
              width: 14.adaptSize,
            ),
          ),
        ),
        CustomDropDown(
          width: 117.h,
          icon: Container(
            margin: EdgeInsets.only(right: 8.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowdownGray60001,
              height: 16.adaptSize,
              width: 16.adaptSize,
            ),
          ),
          hintText: "Sort by",
          items: dropdownItemList,
        ),
        CustomDropDown(
          width: 117.h,
          icon: Container(
            margin: EdgeInsets.only(right: 8.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowdownGray60001,
              height: 16.adaptSize,
              width: 16.adaptSize,
            ),
          ),
          hintText: "All levels",
          items: dropdownItemList1,
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Popular Courses",
          style: theme.textTheme.titleMedium,
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgGridPrimary,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgMegaphone,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(left: 4.h),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildUXDesign(BuildContext context) {
    return DataCourseItemWidget();
  }
}

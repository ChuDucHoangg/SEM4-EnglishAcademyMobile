import 'package:english_academy_mobile/presentation/home_screen/widgets/category_item_widget.dart';
import 'package:english_academy_mobile/presentation/home_screen/widgets/popular_course_item_widget.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_title.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'widgets/off_item_widget.dart';
import 'widgets/sonja_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 43.v,
              left: 34.h,
              bottom: 5.v,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(right: 20.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 14.h),
                          child: CustomSearchView(
                            controller: searchController,
                            hintText: "Search for..",
                          ),
                        ),
                        SizedBox(height: 30.v),
                        _buildOff(context),
                        SizedBox(height: 31.v),
                        Padding(
                          padding: EdgeInsets.only(right: 16.h),
                          child: _buildHEADING(
                            context,
                            name: "Categories",
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildDDesign(context),
                        SizedBox(height: 15.v),
                        Padding(
                          padding: EdgeInsets.only(right: 16.h),
                          child: _buildHEADING(
                            context,
                            name: "Popular Course",
                          ),
                        ),
                        _buildPOPULARCOURSE(context),
                        SizedBox(height: 45.v),
                        Padding(
                          padding: EdgeInsets.only(right: 16.h),
                          child: _buildHEADING(
                            context,
                            name: "Top Mentor",
                          ),
                        ),
                        SizedBox(height: 13.v),
                        _buildSonja(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 80.v,
      title: Padding(
        padding: EdgeInsets.only(left: 35.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarTitle(
              text: "Hi, Ronald A. Martin",
              margin: EdgeInsets.only(right: 4.h),
            ),
            SizedBox(height: 3.v),
            AppbarSubtitleOne(
              text: "What Would you like to learn Today? Search Below.",
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          margin: EdgeInsets.fromLTRB(34.h, 16.v, 34.h, 14.v),
        ),
      ],
    );
  }

  /// Common Widget
  Widget _buildHEADING(
    BuildContext context, {
    required String name,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: CustomTextStyles.titleMedium18,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 4.v,
              bottom: 6.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "See All".toUpperCase(),
                  style: CustomTextStyles.labelLargePrimary,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowRightPrimary,
                  width: 5.h,
                  margin: EdgeInsets.only(
                    left: 10.h,
                    top: 2.v,
                    bottom: 3.v,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOff(BuildContext context) {
    return OffItemWidget();
  }

  /// Section Widget
  Widget _buildDDesign(BuildContext context) {
    return CategoryItemWidget();
  }

  /// Section Widget
  Widget _buildPOPULARCOURSE(BuildContext context) {
    return PopularCourseItemWidget();
  }

  /// Section Widget
  Widget _buildSonja(BuildContext context) {
    return SonjaItemWidget();
  }
}

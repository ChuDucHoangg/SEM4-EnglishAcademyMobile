import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_title.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/off_item_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/sonja_item_widget.dart';
import 'widgets/graphicdesign_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController searchController = TextEditingController();

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 43.v),
            child: Container(
              height: 898.v,
              width: 394.h,
              margin: EdgeInsets.only(
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
                      decoration: AppDecoration.fillGray,
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
                          _buildHEADING(context),
                          SizedBox(height: 12.v),
                          _buildDDesign(context),
                          SizedBox(height: 395.v),
                          Padding(
                            padding: EdgeInsets.only(right: 16.h),
                            child: _buildHeading(
                              context,
                              poluparCourses: "Top Mentor",
                              seeAll: "See All",
                            ),
                          ),
                          SizedBox(height: 13.v),
                          _buildSonja(context),
                        ],
                      ),
                    ),
                  ),
                  _buildPOPULARCOURSE(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 80.v,
      title: Padding(
        padding: EdgeInsets.only(left: 35.h),
        child: Column(
          children: [
            AppbarTitle(
              text: "Hi, Ronald A. Martin",
              margin: EdgeInsets.only(right: 4.h),
            ),
            SizedBox(height: 3.v),
            AppbarSubtitleTwo(
              text: "What Would you like to learn Today? Search Below.",
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgUserTeal700,
          margin: EdgeInsets.fromLTRB(34.h, 16.v, 34.h, 14.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildOff(BuildContext context) {
    return SizedBox(
      height: 180.v,
      width: 360.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 180.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (
                  index,
                  reason,
                  ) {
                sliderIndex = index;
              },
            ),
            itemCount: 1,
            itemBuilder: (context, index, realIndex) {
              return OffItemWidget();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 8.v,
              margin: EdgeInsets.only(bottom: 16.v),
              child: AnimatedSmoothIndicator(
                activeIndex: sliderIndex,
                count: 1,
                axisDirection: Axis.horizontal,
                effect: ScrollingDotsEffect(
                  spacing: 8,
                  activeDotColor: appTheme.amberA200,
                  dotColor: appTheme.blueA40001,
                  dotHeight: 8.v,
                  dotWidth: 8.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHEADING(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
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
  Widget _buildDDesign(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 9.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              "3D Design",
              style: CustomTextStyles.titleSmallGray50015,
            ),
          ),
          Text(
            "Arts & Humanities",
            style: CustomTextStyles.titleSmallPrimary15,
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              "Graphic Design",
              style: CustomTextStyles.titleSmallGray50015,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSonja(BuildContext context) {
    return SizedBox(
      height: 97.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
            context,
            index,
            ) {
          return SizedBox(
            width: 18.h,
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return SonjaItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPOPULARCOURSE(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 168.v),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 36.h),
              child: _buildHeading(
                context,
                poluparCourses: "Polupar Courses",
                seeAll: "See All",
              ),
            ),
            SizedBox(height: 8.v),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 58.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 6.v,
                        ),
                        decoration: AppDecoration.fillBlue.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder15,
                        ),
                        child: Text(
                          "All",
                          style: CustomTextStyles.labelLargeBluegray900_1,
                        ),
                      ),
                      Container(
                        width: 130.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 17.h,
                          vertical: 4.v,
                        ),
                        decoration: AppDecoration.fillTeal.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder15,
                        ),
                        child: Text(
                          "Graphic Design",
                          style: CustomTextStyles.labelLargeWhiteA700,
                        ),
                      ),
                      Container(
                        width: 104.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 19.h,
                          vertical: 4.v,
                        ),
                        decoration: AppDecoration.fillBlue.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder15,
                        ),
                        child: Text(
                          "3D Design",
                          style: CustomTextStyles.labelLargeBluegray900_1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 66.h,
                  margin: EdgeInsets.only(left: 12.h),
                  padding: EdgeInsets.symmetric(vertical: 6.v),
                  decoration: AppDecoration.fillBlue.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder15,
                  ),
                  child: Text(
                    "Arts & Humanities",
                    style: CustomTextStyles.labelLargeBluegray900_1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.v),
            SizedBox(
              height: 240.v,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (
                    context,
                    index,
                    ) {
                  return SizedBox(
                    width: 20.h,
                  );
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GraphicdesignItemWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildHeading(
      BuildContext context, {
        required String poluparCourses,
        required String seeAll,
      }) {
    return Row(
      children: [
        Text(
          poluparCourses,
          style: CustomTextStyles.titleMedium18.copyWith(
            color: appTheme.blueGray900,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.v),
          child: Text(
            seeAll,
            style: CustomTextStyles.labelLargePrimary.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRightPrimary,
          width: 5.h,
          margin: EdgeInsets.only(
            left: 10.h,
            top: 7.v,
            bottom: 9.v,
          ),
        ),
      ],
    );
  }
}

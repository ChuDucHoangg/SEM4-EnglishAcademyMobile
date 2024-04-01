import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 16.v,
          ),
          child: Column(
            children: [
              CustomSearchView(
                controller: searchController,
                hintText: "Search for..",
                contentPadding: EdgeInsets.only(
                  left: 20.h,
                  top: 21.v,
                  bottom: 21.v,
                ),
              ),
              SizedBox(height: 57.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 50.h,
                    right: 29.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgUserOnerror,
                            height: 51.v,
                          ),
                          SizedBox(height: 8.v),
                          Text(
                            "3D Design",
                            style: CustomTextStyles.titleSmallBluegray900,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.v),
                        child: Column(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgThumbsUpBlack900,
                              width: 39.h,
                            ),
                            SizedBox(height: 7.v),
                            Text(
                              "Graphic Design",
                              style: CustomTextStyles.titleSmallBluegray900,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 69.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 17.v),
                      child: Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgComputer,
                            height: 36.v,
                          ),
                          SizedBox(height: 12.v),
                          Text(
                            "Web Development",
                            style: CustomTextStyles.titleSmallBluegray900,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgCalendarGray200,
                          height: 58.adaptSize,
                          width: 58.adaptSize,
                        ),
                        SizedBox(height: 7.v),
                        Text(
                          "SEO & Marketing",
                          style: CustomTextStyles.titleSmallBluegray900,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  right: 6.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgThumbsUpTeal900,
                            width: 53.h,
                          ),
                          SizedBox(height: 8.v),
                          Text(
                            "Finance & Accounting",
                            style: CustomTextStyles.titleSmallBluegray900,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgTelevisionBlue600,
                          height: 60.adaptSize,
                          width: 60.adaptSize,
                        ),
                        SizedBox(height: 8.v),
                        Text(
                          "Personal Development",
                          style: CustomTextStyles.titleSmallBluegray900,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 68.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 14.v),
                      child: Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSearch,
                            height: 42.adaptSize,
                            width: 42.adaptSize,
                          ),
                          SizedBox(height: 10.v),
                          Text(
                            "Office Productivity",
                            style: CustomTextStyles.titleSmallBluegray900,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgSettings,
                          height: 59.v,
                        ),
                        SizedBox(height: 7.v),
                        Text(
                          "HR Management",
                          style: CustomTextStyles.titleSmallBluegray900,
                        ),
                      ],
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
        text: "All Category",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }
}

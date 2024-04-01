import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key})
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
            vertical: 3.v,
          ),
          child: Column(
            children: [
              CustomSearchView(
                controller: searchController,
                hintText: "Graphic Design",
              ),
              SizedBox(height: 29.v),
              _buildHEADING(context),
              SizedBox(height: 30.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesign(
                  context,
                  graphicDesign: "3D Design",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesign(
                  context,
                  graphicDesign: "Graphic Design",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesign(
                  context,
                  graphicDesign: "Programming",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesign(
                  context,
                  graphicDesign: "SEO & Marketing",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesign(
                  context,
                  graphicDesign: "Web Development",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesign(
                  context,
                  graphicDesign: "Office Productivity",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesign(
                  context,
                  graphicDesign: "Personal Development",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesign(
                  context,
                  graphicDesign: "Finance & Accounting",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesign(
                  context,
                  graphicDesign: "HR Management",
                  x: "X",
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
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Search",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildHEADING(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Recents Search",
            style: CustomTextStyles.titleSmallJostBluegray900,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              bottom: 2.v,
            ),
            child: Text(
              "See All".toUpperCase(),
              style: CustomTextStyles.labelLargePrimary,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightPrimary,
            width: 5.h,
            margin: EdgeInsets.only(
              left: 10.h,
              top: 5.v,
              bottom: 6.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildGraphicDesign(
      BuildContext context, {
        required String graphicDesign,
        required String x,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            graphicDesign,
            style: CustomTextStyles.titleSmallGray50015.copyWith(
              color: appTheme.gray500,
            ),
          ),
        ),
        Text(
          x,
          style: CustomTextStyles.titleSmallGray80001.copyWith(
            color: appTheme.gray80001,
          ),
        ),
      ],
    );
  }
}

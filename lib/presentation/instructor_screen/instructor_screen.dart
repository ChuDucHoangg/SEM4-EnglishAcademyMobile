import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:english_academy_mobile/widgets/custom_drop_down.dart';
import 'widgets/fortyfive_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class InstructorScreen extends StatelessWidget {
  InstructorScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController searchController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SizedBox(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 15.v),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchView(
                  controller: searchController,
                  hintText: "Search",
                  hintStyle: CustomTextStyles.bodyMediumBluegray300,
                  borderDecoration: SearchViewStyleHelper.outlineBlueGrayTL12,
                  filled: false,
                ),
                SizedBox(height: 24.v),
                _buildTab(context),
                SizedBox(height: 27.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Showing ",
                        style: CustomTextStyles.titleSmallff6b7280,
                      ),
                      TextSpan(
                        text: "13,376 instructor",
                        style: CustomTextStyles.titleSmallff111827,
                      )
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 17.v),
                _buildFortyFive(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 40.h,
      title: AppbarSubtitleOne(
        margin: EdgeInsets.only(left: 22.h),
        text: "Instructor",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgTelevision,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildFilter(BuildContext context) {
    return CustomOutlinedButton(
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
    );
  }

  /// Section Widget
  Widget _buildTab(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFilter(context),
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
  Widget _buildFortyFive(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 16.v,
        );
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        return FortyfiveItemWidget();
      },
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

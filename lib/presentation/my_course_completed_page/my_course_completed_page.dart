import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/graphicdesign5_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class MyCourseCompletedPage extends StatelessWidget {
  MyCourseCompletedPage({Key? key})
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
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 34.h),
            child: Column(
              children: [
                SizedBox(height: 2.v),
                CustomSearchView(
                  controller: searchController,
                  hintText: "Search for …",
                  contentPadding: EdgeInsets.only(
                    left: 15.h,
                    top: 21.v,
                    bottom: 21.v,
                  ),
                ),
                SizedBox(height: 20.v),
                _buildCategory(context),
                SizedBox(height: 16.v),
                _buildGraphicDesign(context),
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
      title: AppbarSubtitle(
        text: "My Courses",
        margin: EdgeInsets.only(left: 35.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgFavoriteGray90001,
          margin: EdgeInsets.fromLTRB(34.h, 20.v, 34.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomElevatedButton(
            height: 48.v,
            text: "Completed",
            margin: EdgeInsets.only(right: 10.h),
            buttonStyle: CustomButtonStyles.fillTeal,
            buttonTextStyle: CustomTextStyles.titleSmallWhiteA700ExtraBold,
          ),
        ),
        Expanded(
          child: CustomElevatedButton(
            height: 48.v,
            text: "Ongoing",
            margin: EdgeInsets.only(left: 10.h),
            buttonStyle: CustomButtonStyles.fillBlue,
            buttonTextStyle: CustomTextStyles.titleSmallBluegray900ExtraBold15,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildGraphicDesign(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 20.v,
        );
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return Graphicdesign5ItemWidget();
      },
    );
  }
}

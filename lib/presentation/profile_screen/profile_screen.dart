// import 'package:english_academy_mobile/presentation/home_scroll_down_page/home_scroll_down_page.dart';
// import 'package:english_academy_mobile/presentation/my_learning_list_page/my_learning_list_page.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/count_item_widget.dart';
import 'widgets/uxdesign3_item_widget.dart';
import 'package:english_academy_mobile/widgets/custom_bottom_app_bar.dart';
import 'package:english_academy_mobile/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            children: [
              SizedBox(height: 32.v),
              _buildProfile(context),
              SizedBox(height: 16.v),
              _buildMusic(context),
              SizedBox(height: 15.v),
              _buildFrameSeventySix(context),
              SizedBox(height: 24.v),
              Divider(
                color: appTheme.blueGray100,
              ),
              SizedBox(height: 23.v),
              _buildCount(context),
              SizedBox(height: 16.v),
              _buildUXDesign(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 40.h,
      leadingWidth: 46.h,
      title: AppbarSubtitleOne(
        margin: EdgeInsets.only(left: 22.h),
        text: "Profile",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotificationGray900,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildProfile(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillGray5002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAvatar9,
            height: 48.adaptSize,
            width: 48.adaptSize,
            radius: BorderRadius.circular(
              24.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 9.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              top: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jason Mark",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 9.v),
                Text(
                  "jasonmark@mail.com",
                  style: CustomTextStyles.bodySmallBluegray300_1,
                ),
                SizedBox(height: 7.v),
                Text(
                  "UI/UX, Development, Finance",
                  style: CustomTextStyles.labelLargeBluegray500,
                )
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgSearchBlueGray300,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 21.v),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMusic(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.fillGreen.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMusic,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.h,
                      top: 2.v,
                      bottom: 1.v,
                    ),
                    child: Text(
                      "11",
                      style: CustomTextStyles.titleMediumGreenA400,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.v),
              Text(
                "Course Completed",
                style: CustomTextStyles.labelLargeGray60001_1,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 40.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.fillYellow.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgUserAmberA200,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.h,
                      top: 2.v,
                      bottom: 1.v,
                    ),
                    child: Text(
                      "4",
                      style: CustomTextStyles.titleMediumAmberA200,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.v),
              Text(
                "Days Streak",
                style: CustomTextStyles.labelLargeGray60001_1,
              )
            ],
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildFrameSeventySix(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.h),
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 6.h,
              right: 4.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 73.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 4.v,
                  ),
                  decoration: AppDecoration.outlineGray9008.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder5,
                  ),
                  child: Text(
                    "UX Design",
                    style: CustomTextStyles.labelMediumGreenA400,
                  ),
                ),
                Container(
                  width: 61.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 5.v,
                  ),
                  decoration: AppDecoration.outlineGray9009.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder5,
                  ),
                  child: Text(
                    "Finance",
                    style: CustomTextStyles.labelMediumRedA200,
                  ),
                ),
                Container(
                  width: 56.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 4.v,
                  ),
                  decoration: AppDecoration.outlineGray90010.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder5,
                  ),
                  child: Text(
                    "Design",
                    style: CustomTextStyles.labelMediumPrimary,
                  ),
                ),
                Container(
                  width: 62.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 5.v,
                  ),
                  decoration: AppDecoration.outlineGray90011.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder5,
                  ),
                  child: Text(
                    "Website",
                    style: CustomTextStyles.labelMediumAmberA200,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 12.v),
          SizedBox(
            height: 8.v,
            width: 303.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8.v,
                    width: 303.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.72,
                        backgroundColor: appTheme.gray100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.greenA400,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8.v,
                    width: 303.h,
                    decoration: BoxDecoration(
                      color: appTheme.amberA200,
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.72,
                        backgroundColor: appTheme.amberA200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.greenA400,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8.v,
                    width: 303.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: appTheme.gray100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.redA200,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8.v,
                    width: 303.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        backgroundColor: appTheme.gray100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.blueA700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 6.v)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCount(BuildContext context) {
    return Wrap(
      runSpacing: 16.v,
      spacing: 16.h,
      children: List<Widget>.generate(3, (index) => CountItemWidget()),
    );
  }

  /// Section Widget
  Widget _buildUXDesign(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 16.v,
        );
      },
      itemCount: 2,
      itemBuilder: (context, index) {
        return Uxdesign3ItemWidget();
      },
    );
  }
}

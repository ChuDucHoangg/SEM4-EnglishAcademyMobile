import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'widgets/circle_item_widget.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class MyCourseLessonsScreen extends StatelessWidget {
  MyCourseLessonsScreen({Key? key})
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
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.h),
                child: CustomSearchView(
                  controller: searchController,
                  hintText: "3D Design Illustration",
                  contentPadding: EdgeInsets.only(
                    left: 21.h,
                    top: 21.v,
                    bottom: 21.v,
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              SizedBox(
                height: 727.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 34.h),
                        padding: EdgeInsets.symmetric(vertical: 7.v),
                        decoration: AppDecoration.outlineBlack9001.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder15,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 17.v),
                            _buildSectionIntrodu(context),
                            SizedBox(height: 20.v),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.h,
                                right: 30.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 46.adaptSize,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.h,
                                      vertical: 12.v,
                                    ),
                                    decoration:
                                    AppDecoration.outlineBlue.copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder22,
                                    ),
                                    child: Text(
                                      "03",
                                      style: CustomTextStyles
                                          .titleSmallJostBluegray900SemiBold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 6.h,
                                        top: 2.v,
                                        bottom: 2.v,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Take a Look Blender Interfa…",
                                            style: theme.textTheme.titleMedium,
                                          ),
                                          Text(
                                            "20 Mins",
                                            style: theme.textTheme.labelLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath:
                                    ImageConstant.imgFill1Primary18x18,
                                    height: 18.adaptSize,
                                    width: 18.adaptSize,
                                    margin: EdgeInsets.only(
                                      left: 21.h,
                                      top: 14.v,
                                      bottom: 14.v,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.v),
                            Divider(),
                            SizedBox(height: 20.v),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.h,
                                right: 30.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 46.adaptSize,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 13.h,
                                      vertical: 12.v,
                                    ),
                                    decoration:
                                    AppDecoration.outlineBlue.copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder22,
                                    ),
                                    child: Text(
                                      "04",
                                      style: CustomTextStyles
                                          .titleSmallJostBluegray900SemiBold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 6.h,
                                      top: 4.v,
                                      bottom: 2.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "The Basic of 3D Modelling",
                                          style: theme.textTheme.titleMedium,
                                        ),
                                        Text(
                                          "25 Mins",
                                          style: theme.textTheme.labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 14.v),
                                    child: CustomIconButton(
                                      height: 18.adaptSize,
                                      width: 18.adaptSize,
                                      child: CustomImageView(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.v),
                            Divider(),
                            SizedBox(height: 20.v),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.h,
                                right: 30.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 46.adaptSize,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 14.h,
                                          vertical: 12.v,
                                        ),
                                        decoration:
                                        AppDecoration.outlineBlue.copyWith(
                                          borderRadius:
                                          BorderRadiusStyle.roundedBorder22,
                                        ),
                                        child: Text(
                                          "05",
                                          style: CustomTextStyles
                                              .titleSmallJostBluegray900SemiBold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 6.h,
                                          top: 4.v,
                                          bottom: 2.v,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Shading and Lighting",
                                              style:
                                              theme.textTheme.titleMedium,
                                            ),
                                            Text(
                                              "36 Mins",
                                              style: theme.textTheme.labelLarge,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.v,
                                      bottom: 13.v,
                                    ),
                                    child: CustomIconButton(
                                      height: 18.adaptSize,
                                      width: 18.adaptSize,
                                      child: CustomImageView(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.v),
                            Divider(),
                            SizedBox(height: 20.v),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.h,
                                right: 30.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 46.adaptSize,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 13.h,
                                      vertical: 12.v,
                                    ),
                                    decoration:
                                    AppDecoration.outlineBlue.copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder22,
                                    ),
                                    child: Text(
                                      "06",
                                      style: CustomTextStyles
                                          .titleSmallJostBluegray900SemiBold,
                                    ),
                                  ),
                                  Container(
                                    height: 39.v,
                                    width: 161.h,
                                    margin: EdgeInsets.only(
                                      left: 6.h,
                                      top: 4.v,
                                      bottom: 2.v,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            "Using Graphic Plugins",
                                            style: theme.textTheme.titleMedium,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "10 Mins",
                                            style: theme.textTheme.labelLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  CustomImageView(
                                    imagePath:
                                    ImageConstant.imgFill1Primary18x18,
                                    height: 18.adaptSize,
                                    width: 18.adaptSize,
                                    margin: EdgeInsets.only(
                                      top: 15.v,
                                      bottom: 13.v,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.v),
                            Divider(),
                            SizedBox(height: 25.v),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.h,
                                right: 30.h,
                              ),
                              child: _buildHeading(
                                context,
                                sectionGraphic: "Section 02 - Let’s Practice",
                                time: "35 Mins",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildThirtyFour(context),
                  ],
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
          top: 17.v,
          bottom: 18.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "My Courses",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildSectionIntrodu(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 25.h,
                right: 30.h,
              ),
              child: _buildHeading(
                context,
                sectionGraphic: "Section 01 - Introducation",
                time: "25 Mins",
              ),
            ),
            SizedBox(height: 20.v),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                    context,
                    index,
                    ) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0.v),
                    child: SizedBox(
                      width: 360.h,
                      child: Divider(
                        height: 1.v,
                        thickness: 1.v,
                        color: appTheme.blue50,
                      ),
                    ),
                  );
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CircleItemWidget();
                },
              ),
            ),
            SizedBox(height: 26.v),
            Padding(
              padding: EdgeInsets.only(
                left: 25.h,
                right: 30.h,
              ),
              child: _buildHeading(
                context,
                sectionGraphic: "Section 02 - Graphic Design",
                time: "125 Mins",
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildThirtyFour(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 587.v),
        padding: EdgeInsets.symmetric(
          horizontal: 34.h,
          vertical: 27.v,
        ),
        decoration: AppDecoration.outlineBlack9003,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60.v,
              width: 94.h,
              margin: EdgeInsets.only(bottom: 26.v),
              padding: EdgeInsets.symmetric(
                horizontal: 27.h,
                vertical: 13.v,
              ),
              decoration: AppDecoration.outlineBluegray200.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder30,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgThumbsUpTeal700,
                height: 27.v,
                alignment: Alignment.bottomRight,
              ),
            ),
            CustomElevatedButton(
              width: 250.h,
              text: "Start Course Again",
              margin: EdgeInsets.only(bottom: 26.v),
              rightIcon: Container(
                padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
                margin: EdgeInsets.only(left: 8.h),
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
    );
  }

  /// Common widget
  Widget _buildHeading(
      BuildContext context, {
        required String sectionGraphic,
        required String time,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Section 02 - ",
                style: CustomTextStyles.titleSmallJostff202244,
              ),
              TextSpan(
                text: "Graphic Design",
                style: CustomTextStyles.titleSmallJostff0961f5,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 3.v),
          child: Text(
            time,
            style: CustomTextStyles.labelLargePrimary.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

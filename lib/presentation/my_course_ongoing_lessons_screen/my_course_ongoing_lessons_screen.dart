import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/widgets/custom_rating_bar.dart';

class MyCourseOngoingLessonsScreen extends StatelessWidget {
  MyCourseOngoingLessonsScreen({Key? key})
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
                  child: Stack(
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
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.h,
                                  right: 30.h,
                                ),
                                child: _buildHeading(
                                  context,
                                  sectionGraphic: "Name Section",
                                  time: "125 Mins",
                                ),
                              ),

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
                                      width: 58.adaptSize,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.h,
                                        vertical: 12.v,
                                      ),
                                      decoration:
                                      AppDecoration.outlineBlue.copyWith(
                                        borderRadius:
                                        BorderRadiusStyle.roundedBorder22,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "03",
                                          style: CustomTextStyles
                                              .titleSmallJostBluegray900SemiBold,
                                        ),
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
                                              style:
                                              theme.textTheme.titleMedium,
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
                                      width: 58.adaptSize,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 13.h,
                                        vertical: 12.v,
                                      ),
                                      decoration:
                                      AppDecoration.outlineBlue.copyWith(
                                        borderRadius:
                                        BorderRadiusStyle.roundedBorder22,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "04",
                                          style: CustomTextStyles
                                              .titleSmallJostBluegray900SemiBold,
                                        ),
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 58.adaptSize,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 14.h,
                                            vertical: 12.v,
                                          ),
                                          decoration: AppDecoration.outlineBlue
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder22,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "120",
                                              style: CustomTextStyles
                                                  .titleSmallJostBluegray900SemiBold,
                                            ),
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
                                                style:
                                                theme.textTheme.labelLarge,
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildThirtyFour(context),


          //The widget section displays course completion notifications here
          // _buildFive(context),
        ]));
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
  Widget _buildThirtyFour(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 39.h,
          vertical: 27.v,
        ),
        decoration: AppDecoration.outlineBlack9003,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 26.v),
            CustomElevatedButton(
              text: "Continue Courses",
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
    );
  }

  /// Section Widget
  Widget _buildFive(BuildContext context) {
    return Align(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 34.h),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 54.h,
            vertical: 40.v,
          ),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    margin: EdgeInsets.only(
                      top: 41.v,
                      bottom: 10.v,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.orangeA700,
                      borderRadius: BorderRadius.circular(
                        6.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 147.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgBrightness,
                                width: 25.h,
                                margin: EdgeInsets.only(
                                  top: 6.v,
                                  bottom: 9.v,
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgCloseTeal700,
                                width: 25.h,
                                margin: EdgeInsets.only(top: 15.v),
                              ),
                              Spacer(),
                              CustomImageView(
                                imagePath:
                                ImageConstant.imgSignalAmberA40001,
                                height: 18.adaptSize,
                                width: 18.adaptSize,
                                margin: EdgeInsets.only(bottom: 30.v),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 12.adaptSize,
                            width: 12.adaptSize,
                            margin: EdgeInsets.only(right: 14.h),
                            decoration: BoxDecoration(
                              color: appTheme.gray80001,
                              borderRadius: BorderRadius.circular(
                                6.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 23.h,
                  right: 13.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSignal,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(
                        top: 56.v,
                        bottom: 32.v,
                      ),
                    ),
                    Container(
                      height: 8.adaptSize,
                      width: 8.adaptSize,
                      margin: EdgeInsets.only(
                        left: 15.h,
                        top: 78.v,
                        bottom: 20.v,
                      ),
                      decoration: BoxDecoration(
                        color: appTheme.teal700,
                        borderRadius: BorderRadius.circular(
                          4.h,
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup6Black900,
                      width: 104.h,
                      margin: EdgeInsets.only(left: 9.h),
                    ),
                    Spacer(),
                    CustomImageView(
                      imagePath: ImageConstant.imgTriangleTeal700,
                      height: 14.adaptSize,
                      width: 14.adaptSize,
                      margin: EdgeInsets.only(
                        top: 6.v,
                        bottom: 86.v,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.v),
              CustomImageView(
                imagePath: ImageConstant.imgTriangle,
                height: 14.adaptSize,
                width: 14.adaptSize,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 55.h),
              ),
              SizedBox(height: 14.v),
              Text(
                "Course Completed",
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 10.v),
              SizedBox(
                width: 251.h,
                child: Text(
                  "Complete your Course. Please Write a Review",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 19.v),
              CustomRatingBar(
                initialRating: 4,
                itemSize: 20,
              ),
              SizedBox(height: 25.v),
              CustomElevatedButton(
                text: "Write a Review",
                margin: EdgeInsets.symmetric(horizontal: 12.h),
              ),
              SizedBox(height: 8.v),
            ],
          ),
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

import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ProfilesPage extends StatelessWidget {
  const ProfilesPage({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          height: 714.v,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 34.h),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 29.h,
                    vertical: 24.v,
                  ),
                  decoration: AppDecoration.outlineBlack9001.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder15,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 64.v),
                      Text(
                        "James S. Hernandez",
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        "hernandex.redial@gmail.ac.in",
                        style: theme.textTheme.labelLarge,
                      ),
                      SizedBox(height: 23.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 108.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgNavProfile,
                                  width: 16.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 14.h),
                                  child: Text(
                                    "Edit Profile",
                                    style: CustomTextStyles
                                        .titleSmallBluegray90015,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowRightGray90001,
                            width: 10.h,
                            margin: EdgeInsets.only(left: 181.h),
                          ),
                        ],
                      ),
                      SizedBox(height: 36.v),
                      _buildNine(
                        context,
                        user: ImageConstant.imgNavTransaction,
                        intiveFriends: "Payment Option",
                      ),
                      SizedBox(height: 35.v),
                      _buildTen(
                        context,
                        clock: ImageConstant.imgUserBlueGray900,
                        logout: "Notifications",
                      ),
                      SizedBox(height: 37.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath:
                            ImageConstant.imgTelevisionBlueGray90020x19,
                            width: 19.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: Text(
                              "Security",
                              style: CustomTextStyles.titleSmallBluegray90015,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowRightGray90001,
                            width: 10.h,
                            margin: EdgeInsets.only(left: 200.h),
                          ),
                        ],
                      ),
                      SizedBox(height: 37.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgFill1Gray90001,
                            height: 18.v,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "Language",
                              style: CustomTextStyles.titleSmallBluegray90015,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 88.h),
                            child: Text(
                              "English (US)",
                              style:
                              CustomTextStyles.titleSmallPrimaryExtraBold,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowRightGray90001,
                            width: 10.h,
                            margin: EdgeInsets.only(left: 15.h),
                          ),
                        ],
                      ),
                      SizedBox(height: 35.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgEye,
                            height: 14.v,
                            margin: EdgeInsets.symmetric(vertical: 2.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              "Dark Mode",
                              style: CustomTextStyles.titleSmallBluegray90015,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowRightGray90001,
                            width: 10.h,
                            margin: EdgeInsets.only(
                              left: 180.h,
                              top: 1.v,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 36.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgUserBlueGray90018x16,
                            width: 16.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.h),
                            child: Text(
                              "Terms & Conditions",
                              style: CustomTextStyles.titleSmallBluegray90015,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowRightGray90001,
                            width: 10.h,
                            margin: EdgeInsets.only(left: 121.h),
                          ),
                        ],
                      ),
                      SizedBox(height: 35.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgProfile,
                            height: 23.adaptSize,
                            width: 23.adaptSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.h,
                              top: 3.v,
                            ),
                            child: Text(
                              "Help Center",
                              style: CustomTextStyles.titleSmallBluegray90015,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowRightGray90001,
                            width: 10.h,
                            margin: EdgeInsets.only(
                              left: 174.h,
                              top: 4.v,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 36.v),
                      _buildNine(
                        context,
                        user: ImageConstant.imgUserPrimarycontainer,
                        intiveFriends: "Intive Friends",
                      ),
                      SizedBox(height: 37.v),
                      _buildTen(
                        context,
                        clock: ImageConstant.imgClock,
                        logout: "Logout",
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 110.adaptSize,
                  width: 110.adaptSize,
                  margin: EdgeInsets.only(top: 4.v),
                  decoration: BoxDecoration(
                    color: appTheme.blueGray100,
                    borderRadius: BorderRadius.circular(
                      55.h,
                    ),
                    border: Border.all(
                      color: appTheme.teal700,
                      width: 4.h,
                      strokeAlign: strokeAlignOutside,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 83.v,
                  right: 129.h,
                ),
                child: CustomIconButton(
                  height: 36.adaptSize,
                  width: 36.adaptSize,
                  padding: EdgeInsets.all(8.h),
                  decoration: IconButtonStyleHelper.outlineTealTL8,
                  alignment: Alignment.topRight,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFill1Teal70036x36,
                  ),
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
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Profile",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Common widget
  Widget _buildNine(
      BuildContext context, {
        required String user,
        required String intiveFriends,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: user,
          height: 18.v,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Text(
            intiveFriends,
            style: CustomTextStyles.titleSmallBluegray90015.copyWith(
              color: appTheme.blueGray900,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRightGray90001,
          width: 10.h,
          margin: EdgeInsets.only(left: 163.h),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildTen(
      BuildContext context, {
        required String clock,
        required String logout,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: clock,
          height: 17.adaptSize,
          width: 17.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: Text(
            logout,
            style: CustomTextStyles.titleSmallBluegray90015.copyWith(
              color: appTheme.blueGray900,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRightGray90001,
          width: 10.h,
          margin: EdgeInsets.only(left: 208.h),
        ),
      ],
    );
  }
}

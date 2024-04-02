import 'package:english_academy_mobile/presentation/popular_courses_page/popular_courses_page.dart';
import 'package:english_academy_mobile/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:english_academy_mobile/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:english_academy_mobile/presentation/transactions_page/transactions_page.dart';
import 'package:english_academy_mobile/presentation/profiles_page/profiles_page.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'widgets/patriciadregalado_item_widget.dart';
import 'package:english_academy_mobile/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class IndoxCallsScreen extends StatelessWidget {
  IndoxCallsScreen({Key? key})
      : super(
    key: key,
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 4.v),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 848.v,
                  width: 360.h,
                  margin: EdgeInsets.symmetric(horizontal: 34.h),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _buildCategory(context),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 25.v),
                          decoration: AppDecoration.outlineBlack9001.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildPatriciaDRegalado(context),
                              SizedBox(height: 20.v),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.h,
                                  right: 30.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 50.adaptSize,
                                      width: 50.adaptSize,
                                      decoration: BoxDecoration(
                                        color: appTheme.black900,
                                        borderRadius: BorderRadius.circular(
                                          25.h,
                                        ),
                                        border: Border.all(
                                          color: appTheme.blue50,
                                          width: 2.h,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.h,
                                        top: 5.v,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Wanda T. Seidl",
                                            style:
                                            theme.textTheme.titleMedium,
                                          ),
                                          SizedBox(height: 1.v),
                                          Row(
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                ImageConstant.imgPlus,
                                                height: 14.adaptSize,
                                                width: 14.adaptSize,
                                                margin: EdgeInsets.only(
                                                    bottom: 3.v),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8.h),
                                                child: Text(
                                                  "Incoming   |   Nov 21, 202X",
                                                  style: theme
                                                      .textTheme.labelLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    CustomImageView(
                                      imagePath:
                                      ImageConstant.imgSettingsPrimary,
                                      height: 22.adaptSize,
                                      width: 22.adaptSize,
                                      margin: EdgeInsets.only(
                                        top: 17.v,
                                        bottom: 11.v,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.v),
                              Divider(),
                              SizedBox(height: 14.v),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: _buildBottomBar(context),
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
          top: 19.v,
          bottom: 16.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Indox",
        margin: EdgeInsets.only(left: 12.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgQrcodeBlueGray900,
          margin: EdgeInsets.fromLTRB(34.h, 21.v, 34.h, 14.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 800.v),
        decoration: AppDecoration.fillGray,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomElevatedButton(
                height: 48.v,
                text: "Chat",
                margin: EdgeInsets.only(right: 10.h),
                buttonStyle: CustomButtonStyles.fillBlue,
                buttonTextStyle:
                CustomTextStyles.titleSmallBluegray900ExtraBold15,
              ),
            ),
            Expanded(
              child: CustomElevatedButton(
                height: 48.v,
                text: "Calls",
                margin: EdgeInsets.only(left: 10.h),
                buttonStyle: CustomButtonStyles.fillTeal,
                buttonTextStyle: CustomTextStyles.titleSmallWhiteA700ExtraBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPatriciaDRegalado(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
          context,
          index,
          ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.v),
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
      itemCount: 7,
      itemBuilder: (context, index) {
        return PatriciadregaladoItemWidget();
      },
    );
  }

  /// Section Widget
  // Widget _buildBottomBar(BuildContext context) {
  //   return CustomBottomBar(
  //     onChanged: (BottomBarEnum type) {
  //       Navigator.pushNamed(
  //           navigatorKey.currentContext!, getCurrentRoute(type));
  //     },
  //   );
  // }
  //
  // ///Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return AppRoutes.popularCoursesPage;
  //     case BottomBarEnum.Mycourses:
  //       return AppRoutes.myCourseCompletedPage;
  //     case BottomBarEnum.Indox:
  //       return AppRoutes.indoxChatsPage;
  //     case BottomBarEnum.Transaction:
  //       return AppRoutes.transactionsPage;
  //     case BottomBarEnum.Profile:
  //       return AppRoutes.profilesPage;
  //     default:
  //       return "/";
  //   }
  // }
  //
  // ///Handling page based on route
  // Widget getCurrentPage(String currentRoute) {
  //   switch (currentRoute) {
  //     case AppRoutes.popularCoursesPage:
  //       return PopularCoursesPage();
  //     case AppRoutes.myCourseCompletedPage:
  //       return MyCourseCompletedPage();
  //     case AppRoutes.indoxChatsPage:
  //       return IndoxChatsPage();
  //     case AppRoutes.transactionsPage:
  //       return TransactionsPage();
  //     case AppRoutes.profilesPage:
  //       return ProfilesPage();
  //     default:
  //       return DefaultWidget();
  //   }
  // }
}

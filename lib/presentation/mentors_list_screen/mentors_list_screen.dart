import 'package:english_academy_mobile/presentation/popular_courses_page/popular_courses_page.dart';
import 'package:english_academy_mobile/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:english_academy_mobile/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:english_academy_mobile/presentation/transactions_page/transactions_page.dart';
import 'package:english_academy_mobile/presentation/profiles_page/profiles_page.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'widgets/brandensbaker_item_widget.dart';
import 'package:english_academy_mobile/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class MentorsListScreen extends StatelessWidget {
  MentorsListScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 3.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 34.h,
                      right: 31.h,
                    ),
                    decoration: AppDecoration.fillGray,
                    child: Column(
                      children: [
                        CustomSearchView(
                          controller: searchController,
                          hintText: "3D Design",
                        ),
                        SizedBox(height: 25.v),
                        _buildCategory(context),
                        SizedBox(height: 15.v),
                        _buildHEADING(context),
                        SizedBox(height: 19.v),
                        _buildBrandenSBaker(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
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
        text: "Mentors",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomElevatedButton(
              height: 48.v,
              text: "Courses",
              margin: EdgeInsets.only(right: 10.h),
              buttonStyle: CustomButtonStyles.fillBlue,
              buttonTextStyle:
              CustomTextStyles.titleSmallBluegray900ExtraBold15,
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              height: 48.v,
              text: "Mentors",
              margin: EdgeInsets.only(left: 10.h),
              buttonStyle: CustomButtonStyles.fillTeal,
              buttonTextStyle: CustomTextStyles.titleSmallWhiteA700ExtraBold,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHEADING(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Result for “",
                  style: CustomTextStyles.titleSmallJostff202244,
                ),
                TextSpan(
                  text: "3D Design",
                  style: CustomTextStyles.titleSmallJostff0961f5,
                ),
                TextSpan(
                  text: "”",
                  style: CustomTextStyles.titleSmallJostff202244,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: Text(
              "18 Founds".toUpperCase(),
              style: CustomTextStyles.labelLargePrimary,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightPrimary,
            width: 5.h,
            margin: EdgeInsets.only(
              left: 10.h,
              top: 4.v,
              bottom: 7.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBrandenSBaker(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
          context,
          index,
          ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 9.5.v),
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
      itemCount: 6,
      itemBuilder: (context, index) {
        return BrandensbakerItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.popularCoursesPage;
      case BottomBarEnum.Mycourses:
        return AppRoutes.myCourseCompletedPage;
      case BottomBarEnum.Indox:
        return AppRoutes.indoxChatsPage;
      case BottomBarEnum.Transaction:
        return AppRoutes.transactionsPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilesPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.popularCoursesPage:
        return PopularCoursesPage();
      case AppRoutes.myCourseCompletedPage:
        return MyCourseCompletedPage();
      case AppRoutes.indoxChatsPage:
        return IndoxChatsPage();
      case AppRoutes.transactionsPage:
        return TransactionsPage();
      case AppRoutes.profilesPage:
        return ProfilesPage();
      default:
        return DefaultWidget();
    }
  }
}

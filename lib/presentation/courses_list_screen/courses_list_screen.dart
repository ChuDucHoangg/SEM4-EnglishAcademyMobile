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
import 'widgets/graphicdesign2_item_widget.dart';
import 'package:english_academy_mobile/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CoursesListScreen extends StatelessWidget {
  CoursesListScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 34.h),
          child: Column(
            children: [
              SizedBox(height: 3.v),
              CustomSearchView(
                controller: searchController,
                hintText: "Graphic Design",
              ),
              SizedBox(height: 25.v),
              _buildCategory(context),
              SizedBox(height: 15.v),
              _buildHEADING(context),
              SizedBox(height: 19.v),
              _buildGraphicDesign(context),
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
        text: "Online Courses",
        margin: EdgeInsets.only(left: 12.h),
      ),
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
            text: "Courses",
            margin: EdgeInsets.only(right: 10.h),
            buttonStyle: CustomButtonStyles.fillTeal,
            buttonTextStyle: CustomTextStyles.titleSmallWhiteA700ExtraBold,
          ),
        ),
        Expanded(
          child: CustomElevatedButton(
            height: 48.v,
            text: "Mentors",
            margin: EdgeInsets.only(left: 10.h),
            buttonStyle: CustomButtonStyles.fillBlue,
            buttonTextStyle: CustomTextStyles.titleSmallBluegray900ExtraBold15,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildHEADING(BuildContext context) {
    return Row(
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
                text: "Graphic Design",
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
            "2480 Founds".toUpperCase(),
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
          height: 16.v,
        );
      },
      itemCount: 4,
      itemBuilder: (context, index) {
        return Graphicdesign2ItemWidget();
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

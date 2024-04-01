import '../congratulations1_dialog/congratulations1_dialog.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "01_LAUNCHING",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.launchingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "02_INTRO-One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.introOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "03_INTRO-Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.introTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "04_INTRO-Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.introThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "05_LET\\'S YOU IN",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.letSYouInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "06_REGISTER NOW",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.registerNowScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "07_LOGIN",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "08_FILL YOUR PROFILE",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.fillYourProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "09_CREATE NEW PIN",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.createNewPinScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "10_SET YOUR FINGERPRINT",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.setYourFingerprintScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "11_CONGRATULATIONS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.congratulationsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "12_FORGOT PASSWORD",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "13_VERIFY-FORGOT PASSWORD",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.verifyForgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "14_CREATE NEW PASSWORD",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.createNewPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "15_CONGRATULATIONS - Dialog",
                          onTapScreenTitle: () => onTapDialogTitle(
                              context, Congratulations1Dialog()),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "16_HOME",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "17_CATEGORY",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.categoryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "18_SEARCH",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.searchScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "19_POPULAR COURSES - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.popularCoursesContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "20_TOP MENTORS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.topMentorsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "21_COURSES LIST",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.coursesListScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "22_COURSES LIST-FILTER",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.coursesListFilterScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "23_MENTORS LIST",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.mentorsListScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "24_SINGLE COURSE DETAILS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.singleCourseDetailsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle:
                          "25_SINGLE COURSE DETAILS - CURRICULCUM - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context,
                              AppRoutes
                                  .singleCourseDetailsCurriculcumTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "26_MY BOOKMARK",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myBookmarkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "27_REMOVE MY BOOKMARK",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.removeMyBookmarkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "28_NOTIFICATIONS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle:
                          "29_SINGLE MENTOR DETAILS - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.singleMentorDetailsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "31_CURRICULCUM",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.curriculcumScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "32_REVIEWS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.reviewsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "33_WRITE A REVIEWS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.writeAReviewsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "34_PAYMENT METHODS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentMethodsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "35_PAYMENT METHODS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentMethods1Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "37_MY COURSE - LESSONS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myCourseLessonsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "38_MY COURSE - CERTIFICATE",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myCourseCertificateScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "39_MY COURSE - ONGOING",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myCourseOngoingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "40_MY COURSE - ONGOING - LESSONS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myCourseOngoingLessonsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "41_MY COURSE - ONGOING - VIDEO",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myCourseOngoingVideoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "42_MY COURSE - COURSE COMPLETED",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myCourseCourseCompletedScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "44_INDOX - CHATS - MESSAGES",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.indoxChatsMessagesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "45_INDOX - CALLS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.indoxCallsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "46_INDOX - CALLS - VOICE CALL",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.indoxCallsVoiceCallScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "48_E-RECEIPT",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.eReceiptScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "49_E-RECEIPT - EDIT",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.eReceiptEditScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "51_EDIT PROFILES",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editProfilesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "52_NOTIFICATIONS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notifications1Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "53_PAYMENT OPTIONS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentOptionsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "54_ADD NEW CARD",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addNewCardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "55_SECURITY",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.securityScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "56_LANGUAGE",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.languageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "57_TERMS & CONDITIONS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.termsConditionsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "58_INVITE FRIENDS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.inviteFriendsScreen),
                        ),
                      ],
                    ),
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
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common click event for dialog
  void onTapDialogTitle(
      BuildContext context,
      Widget className,
      ) {
    showDialog(
      context: context,
      builder: (context) {
        return className;
      },
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
      BuildContext context, {
        required String screenTitle,
        Function? onTapScreenTitle,
      }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
      BuildContext context,
      String routeName,
      ) {
    Navigator.pushNamed(context, routeName);
  }
}

import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';
import '../presentation/launching_screen/launching_screen.dart';
import '../presentation/intro_one_screen/intro_one_screen.dart';
import '../presentation/intro_two_screen/intro_two_screen.dart';
import '../presentation/intro_three_screen/intro_three_screen.dart';
import '../presentation/let_s_you_in_screen/let_s_you_in_screen.dart';
import '../presentation/register_now_screen/register_now_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/fill_your_profile_screen/fill_your_profile_screen.dart';
import '../presentation/create_new_pin_screen/create_new_pin_screen.dart';
import '../presentation/set_your_fingerprint_screen/set_your_fingerprint_screen.dart';
import '../presentation/congratulations_screen/congratulations_screen.dart';
import '../presentation/forgot_password_screen/forgot_password_screen.dart';
import '../presentation/verify_forgot_password_screen/verify_forgot_password_screen.dart';
import '../presentation/create_new_password_screen/create_new_password_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/category_screen/category_screen.dart';
import '../presentation/search_screen/search_screen.dart';
import '../presentation/popular_courses_container_screen/popular_courses_container_screen.dart';
import '../presentation/top_mentors_screen/top_mentors_screen.dart';
import '../presentation/courses_list_screen/courses_list_screen.dart';
import '../presentation/courses_list_filter_screen/courses_list_filter_screen.dart';
import '../presentation/mentors_list_screen/mentors_list_screen.dart';
import '../presentation/single_course_details_screen/single_course_details_screen.dart';
import '../presentation/single_course_details_curriculcum_tab_container_screen/single_course_details_curriculcum_tab_container_screen.dart';
import '../presentation/my_bookmark_screen/my_bookmark_screen.dart';
import '../presentation/remove_my_bookmark_screen/remove_my_bookmark_screen.dart';
import '../presentation/notifications_screen/notifications_screen.dart';
import '../presentation/single_mentor_details_tab_container_screen/single_mentor_details_tab_container_screen.dart';
import '../presentation/curriculcum_screen/curriculcum_screen.dart';
import '../presentation/reviews_screen/reviews_screen.dart';
import '../presentation/write_a_reviews_screen/write_a_reviews_screen.dart';
import '../presentation/payment_methods_screen/payment_methods_screen.dart';
import '../presentation/payment_methods1_screen/payment_methods1_screen.dart';
import '../presentation/my_course_lessons_screen/my_course_lessons_screen.dart';
import '../presentation/my_course_certificate_screen/my_course_certificate_screen.dart';
import '../presentation/my_course_ongoing_screen/my_course_ongoing_screen.dart';
import '../presentation/my_course_ongoing_lessons_screen/my_course_ongoing_lessons_screen.dart';
import '../presentation/my_course_ongoing_video_screen/my_course_ongoing_video_screen.dart';
import '../presentation/my_course_course_completed_screen/my_course_course_completed_screen.dart';
import '../presentation/indox_chats_page/indox_chats_page.dart';
import '../presentation/indox_calls_screen/indox_calls_screen.dart';
import '../presentation/indox_calls_voice_call_screen/indox_calls_voice_call_screen.dart';
import '../presentation/e_receipt_screen/e_receipt_screen.dart';
import '../presentation/e_receipt_edit_screen/e_receipt_edit_screen.dart';
import '../presentation/profiles_page/profiles_page.dart';
import '../presentation/edit_profiles_screen/edit_profiles_screen.dart';
import '../presentation/notifications1_screen/notifications1_screen.dart';
import '../presentation/payment_options_screen/payment_options_screen.dart';
import '../presentation/add_new_card_screen/add_new_card_screen.dart';
import '../presentation/security_screen/security_screen.dart';
import '../presentation/language_screen/language_screen.dart';
import '../presentation/terms_conditions_screen/terms_conditions_screen.dart';
import '../presentation/invite_friends_screen/invite_friends_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String launchingScreen = '/launching_screen';

  static const String introOneScreen = '/intro_one_screen';

  static const String introTwoScreen = '/intro_two_screen';

  static const String introThreeScreen = '/intro_three_screen';

  static const String letSYouInScreen = '/let_s_you_in_screen';

  static const String registerNowScreen = '/register_now_screen';

  static const String loginScreen = '/login_screen';

  static const String fillYourProfileScreen = '/fill_your_profile_screen';

  static const String createNewPinScreen = '/create_new_pin_screen';

  static const String setYourFingerprintScreen = '/set_your_fingerprint_screen';

  static const String congratulationsScreen = '/congratulations_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verifyForgotPasswordScreen =
      '/verify_forgot_password_screen';

  static const String createNewPasswordScreen = '/create_new_password_screen';

  static const String homeScreen = '/home_screen';

  static const String categoryScreen = '/category_screen';

  static const String searchScreen = '/search_screen';

  static const String popularCoursesPage = '/popular_courses_page';

  static const String popularCoursesContainerScreen =
      '/popular_courses_container_screen';

  static const String topMentorsScreen = '/top_mentors_screen';

  static const String coursesListScreen = '/courses_list_screen';

  static const String coursesListFilterScreen = '/courses_list_filter_screen';

  static const String mentorsListScreen = '/mentors_list_screen';

  static const String singleCourseDetailsScreen =
      '/single_course_details_screen';

  static const String singleCourseDetailsCurriculcumPage =
      '/single_course_details_curriculcum_page';

  static const String singleCourseDetailsCurriculcumTabContainerScreen =
      '/single_course_details_curriculcum_tab_container_screen';

  static const String myBookmarkScreen = '/my_bookmark_screen';

  static const String removeMyBookmarkScreen = '/remove_my_bookmark_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String singleMentorDetailsPage = '/single_mentor_details_page';

  static const String singleMentorDetailsTabContainerScreen =
      '/single_mentor_details_tab_container_screen';

  static const String singleMentorDetailsRatingPage =
      '/single_mentor_details_rating_page';

  static const String curriculcumScreen = '/curriculcum_screen';

  static const String reviewsScreen = '/reviews_screen';

  static const String writeAReviewsScreen = '/write_a_reviews_screen';

  static const String paymentMethodsScreen = '/payment_methods_screen';

  static const String paymentMethods1Screen = '/payment_methods1_screen';

  static const String myCourseCompletedPage = '/my_course_completed_page';

  static const String myCourseLessonsScreen = '/my_course_lessons_screen';

  static const String myCourseCertificateScreen =
      '/my_course_certificate_screen';

  static const String myCourseOngoingScreen = '/my_course_ongoing_screen';

  static const String myCourseOngoingLessonsScreen =
      '/my_course_ongoing_lessons_screen';

  static const String myCourseOngoingVideoScreen =
      '/my_course_ongoing_video_screen';

  static const String myCourseCourseCompletedScreen =
      '/my_course_course_completed_screen';

  static const String indoxChatsPage = '/indox_chats_page';

  static const String indoxChatsMessagesScreen = '/indox_chats_messages_screen';

  static const String indoxCallsScreen = '/indox_calls_screen';

  static const String indoxCallsVoiceCallScreen =
      '/indox_calls_voice_call_screen';

  static const String transactionsPage = '/transactions_page';

  static const String eReceiptScreen = '/e_receipt_screen';

  static const String eReceiptEditScreen = '/e_receipt_edit_screen';

  static const String profilesPage = '/profiles_page';

  static const String editProfilesScreen = '/edit_profiles_screen';

  static const String notifications1Screen = '/notifications1_screen';

  static const String paymentOptionsScreen = '/payment_options_screen';

  static const String addNewCardScreen = '/add_new_card_screen';

  static const String securityScreen = '/security_screen';

  static const String languageScreen = '/language_screen';

  static const String termsConditionsScreen = '/terms_conditions_screen';

  static const String inviteFriendsScreen = '/invite_friends_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    launchingScreen: (context) => LaunchingScreen(),
    introOneScreen: (context) => IntroOneScreen(),
    introTwoScreen: (context) => IntroTwoScreen(),
    introThreeScreen: (context) => IntroThreeScreen(),
    letSYouInScreen: (context) => LetSYouInScreen(),
    registerNowScreen: (context) => RegisterNowScreen(),
    loginScreen: (context) => LoginScreen(),
    fillYourProfileScreen: (context) => FillYourProfileScreen(),
    createNewPinScreen: (context) => CreateNewPinScreen(),
    setYourFingerprintScreen: (context) => SetYourFingerprintScreen(),
    congratulationsScreen: (context) => CongratulationsScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    verifyForgotPasswordScreen: (context) => VerifyForgotPasswordScreen(),
    createNewPasswordScreen: (context) => CreateNewPasswordScreen(),
    homeScreen: (context) => HomeScreen(),
    categoryScreen: (context) => CategoryScreen(),
    searchScreen: (context) => SearchScreen(),
    popularCoursesContainerScreen: (context) => PopularCoursesContainerScreen(),
    topMentorsScreen: (context) => TopMentorsScreen(),
    coursesListScreen: (context) => CoursesListScreen(),
    coursesListFilterScreen: (context) => CoursesListFilterScreen(),
    mentorsListScreen: (context) => MentorsListScreen(),
    singleCourseDetailsScreen: (context) => SingleCourseDetailsScreen(),
    singleCourseDetailsCurriculcumTabContainerScreen: (context) =>
        SingleCourseDetailsCurriculcumTabContainerScreen(),
    myBookmarkScreen: (context) => MyBookmarkScreen(),
    removeMyBookmarkScreen: (context) => RemoveMyBookmarkScreen(),
    notificationsScreen: (context) => NotificationsScreen(),
    singleMentorDetailsTabContainerScreen: (context) =>
        SingleMentorDetailsTabContainerScreen(),
    curriculcumScreen: (context) => CurriculcumScreen(),
    reviewsScreen: (context) => ReviewsScreen(),
    writeAReviewsScreen: (context) => WriteAReviewsScreen(),
    paymentMethodsScreen: (context) => PaymentMethodsScreen(),
    paymentMethods1Screen: (context) => PaymentMethods1Screen(),
    myCourseLessonsScreen: (context) => MyCourseLessonsScreen(),
    myCourseCertificateScreen: (context) => MyCourseCertificateScreen(),
    myCourseOngoingScreen: (context) => MyCourseOngoingScreen(),
    myCourseOngoingLessonsScreen: (context) => MyCourseOngoingLessonsScreen(),
    myCourseOngoingVideoScreen: (context) => MyCourseOngoingVideoScreen(),
    myCourseCourseCompletedScreen: (context) => MyCourseCourseCompletedScreen(),
    indoxChatsPage: (context) => IndoxChatsPage(),
    indoxCallsScreen: (context) => IndoxCallsScreen(),
    indoxCallsVoiceCallScreen: (context) => IndoxCallsVoiceCallScreen(),
    eReceiptScreen: (context) => EReceiptScreen(),
    eReceiptEditScreen: (context) => EReceiptEditScreen(),
    profilesPage: (context) => ProfilesPage(),
    editProfilesScreen: (context) => EditProfilesScreen(),
    notifications1Screen: (context) => Notifications1Screen(),
    paymentOptionsScreen: (context) => PaymentOptionsScreen(),
    addNewCardScreen: (context) => AddNewCardScreen(),
    securityScreen: (context) => SecurityScreen(),
    languageScreen: (context) => LanguageScreen(),
    termsConditionsScreen: (context) => TermsConditionsScreen(),
    inviteFriendsScreen: (context) => InviteFriendsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}

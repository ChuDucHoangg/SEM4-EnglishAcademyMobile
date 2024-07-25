import 'package:english_academy_mobile/presentation/auth/change_password_screen/changePassword.dart';
import 'package:english_academy_mobile/presentation/auth/login_screen/login_screen.dart';
import 'package:english_academy_mobile/presentation/auth/register_screen/register_screen.dart';
import 'package:english_academy_mobile/presentation/checkout_screen/thank_you_screen/thank_you_screen_booking.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_my_booking_screen/my_booking_detail.dart';
import 'package:english_academy_mobile/presentation/tutor_screen/tutor_detail_screen/tutor_detail_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/answer_detail_screen/answer_detail_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/entrance_test_finish/entrance_test_finish.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/entrance_test_ielts_screen/entrance_test_ielts_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/entrance_test_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/entrance_test_toeic_screen/entrance_test_toeic_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/learning_paths_ielts_screen/learning_paths_ielts_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/learning_paths_toeic_screen/learning_paths_toeic_screen.dart';
import 'package:english_academy_mobile/presentation/intro_screen/intro_screen.dart';
import 'package:english_academy_mobile/presentation/notification_screen/notification_screen.dart';
import 'package:english_academy_mobile/presentation/personal_data_edit_screen/personal_data_edit_screen.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_my_course_screen/profile_my_course_detail_screen.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_my_course_screen/profile_subject_learing_screen/profile_subject_learing_screen.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_my_course_screen/profile_subject_slot_screen/profile_subject_slot_screen.dart';
import 'package:english_academy_mobile/presentation/test_online_screen/result_test_online_screen/result_test_online_screen.dart';
import 'package:english_academy_mobile/presentation/test_online_screen/test_online_screen.dart';
import 'package:flutter/material.dart';
import '../presentation/checkout_screen/checkout_screen.dart';
import '../presentation/checkout_screen/thank_you_screen/thank_you_screen.dart';
import '../presentation/course_screen/course_learning_screen/course_learning_screen.dart';
import '../presentation/launching_screen/launching_screen.dart';
import '../presentation/intro_one_screen/intro_one_screen.dart';
import '../presentation/intro_two_screen/intro_two_screen.dart';
import '../presentation/intro_three_screen/intro_three_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/course_screen/course_screen.dart';
import '../presentation/course_screen/course_detail_screen/course_detail_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/profile_screen/widgets/profile_more.dart';
import '../presentation/tutor_screen/tutor_screen.dart';

class AppRoutes {
  static const String launchingScreen = '/launching_screen';

  static const String introScreen = '/intro_screen';

  static const String introOneScreen = '/intro_one_screen';

  static const String introTwoScreen = '/intro_two_screen';

  static const String introThreeScreen = '/intro_three_screen';

  static const String loginScreen = '/login_screen';

  static const String registerScreen = '/register_screen';

  static const String homeScreen = '/home_screen';

  static const String tutorScreen = '/tutor_screen';

  static const String tutorDetailScreen = '/tutor_detail_screen';

  static const String animationTutorHire = '/animation_tutor_hire';

  static const String courseScreen = '/course_screen';

  static const String courseDetailScreen = '/course_detail_screen';

  static const String courseLearningScreen = '/course_learning_screen';

  static const String checkoutScreen = '/checkout_screen';

  static const String thankYouScreen = '/thank_you_screen';

  static const String thankYouScreenBooking = '/thank_you_screen_booking';

  static const String entranceTestScreen = '/entrance_test_screen';

  static const String entranceTestToeicScreen = '/entrance_test_toeic_screen';

  static const String entranceTestIeltsScreen = '/entrance_test_ielts_screen';

  static const String entranceTestFinish = '/entrance_test_finish';

  static const String learningPathsIeltsScreen = '/learning_paths_ielts_screen';

  static const String learningPathsToeicScreen = '/learning_paths_toeic_screen';

  static const String answerDetailScreen = '/answer_detail_screen';

  static const String testOnlineScreen = '/test_online_screen';

  static const String resultTestOnlineScreen = '/result_test_online_screen';

  static const String notificationScreen = '/notification_screen';

  static const String profileScreen = '/profile_screen';

  static const String profileMyCourseDetailScreen =
      '/profile_my_course_detail_screen';

  static const String profileSubjectSlotScreen = '/profile_subject_slot_screen';

  static const String profileSubjectLearningScreen =
      '/profile_subject_learning_screen';

  static const String profileBookingDetailScreen =
      '/profile_booking_detail_screen';

  static const String profileMoreScreen = '/profile_more';

  static const String personalDataEditScreen = '/personal_data_edit_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static Map<String, WidgetBuilder> routes = {
    launchingScreen: (context) => LaunchingScreen(),
    introScreen: (context) => IntroScreen(),
    introOneScreen: (context) => IntroOneScreen(),
    introTwoScreen: (context) => IntroTwoScreen(),
    introThreeScreen: (context) => IntroThreeScreen(),
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    homeScreen: (context) => HomeScreen(),
    tutorScreen: (context) => TutorScreen(),
    tutorDetailScreen: (context) {
      final String? code =
          ModalRoute.of(context)?.settings.arguments as String?;
      return TutorDetailScreen(code: code!);
    },
    entranceTestScreen: (context) => EntranceTestScreen(),
    AppRoutes.entranceTestToeicScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return EntranceTestToeicScreen(slug: slug!);
    },
    entranceTestIeltsScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return EntranceTestIeltsScreen(slug: slug!);
    },
    // entranceTestFinish: (context) => EntranceTestFinish(),
    // learningPathsIeltsScreen: (context) => LearningPathsIeltsScreen(),
    // learningPathsToeicScreen: (context) => LearningPathsToeicScreen(),
    // answerDetailScreen: (context) => AnswerDetailScreen(),

    entranceTestFinish: (context) {
      final String? code =
          ModalRoute.of(context)?.settings.arguments as String?;
      return EntranceTestFinish(code: code!);
    },

    learningPathsToeicScreen: (context) {
      final String? code =
          ModalRoute.of(context)?.settings.arguments as String?;
      return LearningPathsToeicScreen(code: code!);
    },

    learningPathsIeltsScreen: (context) {
      final String? code =
          ModalRoute.of(context)?.settings.arguments as String?;
      return LearningPathsIeltsScreen(code: code!);
    },

    answerDetailScreen: (context) {
      final String? code =
          ModalRoute.of(context)?.settings.arguments as String?;
      return AnswerDetailScreen(code: code!);
    },

    testOnlineScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return TestOnlineScreen(slug: slug!);
    },

    resultTestOnlineScreen: (context) {
      final String? testCode =
          ModalRoute.of(context)?.settings.arguments as String?;
      return ResultTestOnline(testCode: testCode!);
    },

    courseScreen: (context) => CourseScreen(),
    courseDetailScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return CourseDetailScreen(slug: slug!);
    },
    courseLearningScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return CourseLearningScreen(slug: slug!);
    },
    checkoutScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return CheckoutScreen(slug: slug!);
    },
    thankYouScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return ThankYouScreen(slug: slug!);
    },
    thankYouScreenBooking: (context) => ThankYouScreenBooking(),
    notificationScreen: (context) => NotificationScreen(),
    profileScreen: (context) => ProfileScreen(),
    profileMyCourseDetailScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return ProfileMyCourseDetailScreen(slug: slug!);
    },
    profileSubjectSlotScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return ProfileSubjectSlotScreen(slug: slug!);
    },
    profileSubjectLearningScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return ProfileSubjectLearningScreen(slug: slug!);
    },
    profileBookingDetailScreen: (context) {
      final int? id = ModalRoute.of(context)?.settings.arguments as int?;
      return MyBookingDetail(id: id!);
    },
    profileMoreScreen: (context) => ProfileMoreScreen(),
    personalDataEditScreen: (context) => PersonalDataEditScreen(),
  };
}

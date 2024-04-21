import 'package:english_academy_mobile/presentation/instructor_screen/instructor_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/answer_detail_screen/answer_detail_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/entrance_test_finish/entrance_test_finish.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/entrance_test_ielts_screen/entrance_test_ielts_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/entrance_test_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/entrance_test_toeic_screen/entrance_test_toeic_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/learning_paths_ielts_screen/learning_paths_ielts_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/learning_paths_toeic_screen/learning_paths_toeic_screen.dart';
import 'package:english_academy_mobile/presentation/intro_screen/intro_screen.dart';
import 'package:english_academy_mobile/presentation/notification_screen/notification_screen.dart';
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

class AppRoutes {
  static const String launchingScreen = '/launching_screen';

  static const String introScreen = '/intro_screen';

  static const String introOneScreen = '/intro_one_screen';

  static const String introTwoScreen = '/intro_two_screen';

  static const String introThreeScreen = '/intro_three_screen';

  static const String homeScreen = '/home_screen';

  static const String instructorScreen = '/instructor_screen';

  static const String courseScreen = '/course_screen';

  static const String courseDetailScreen = '/course_detail_screen';

  static const String courseLearningScreen = '/course_learning_screen';

  static const String checkoutScreen = '/checkout_screen';

  static const String thankYouScreen = '/thank_you_screen';

  static const String entranceTestScreen = '/entrance_test_screen';

  static const String entranceTestToeicScreen = '/entrance_test_toeic_screen';

  static const String entranceTestIeltsScreen = '/entrance_test_ielts_screen';

  static const String entranceTestFinish = '/entrance_test_finish';

  static const String learningPathsIeltsScreen = '/learning_paths_ielts_screen';

  static const String learningPathsToeicScreen = '/learning_paths_toeic_screen';

  static const String answerDetailScreen = '/answer_detail_screen';

  static const String notificationScreen = '/notification_screen';

  static const String profileScreen = '/profile_screen';

  static Map<String, WidgetBuilder> routes = {
    launchingScreen: (context) => LaunchingScreen(),
    introScreen: (context) => IntroScreen(),
    introOneScreen: (context) => IntroOneScreen(),
    introTwoScreen: (context) => IntroTwoScreen(),
    introThreeScreen: (context) => IntroThreeScreen(),
    homeScreen: (context) => HomeScreen(),
    instructorScreen: (context) => InstructorScreen(),
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
    entranceTestFinish: (context) => EntranceTestFinish(),
    learningPathsIeltsScreen: (context) => LearningPathsIeltsScreen(),
    learningPathsToeicScreen: (context) => LearningPathsToeicScreen(),
    answerDetailScreen: (context) => AnswerDetailScreen(),
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
    notificationScreen: (context) => NotificationScreen(),
    profileScreen: (context) => ProfileScreen(),
  };
}

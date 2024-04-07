import 'package:english_academy_mobile/presentation/intro_scren/intro_screen.dart';
import 'package:flutter/material.dart';
import '../presentation/launching_screen/launching_screen.dart';
import '../presentation/intro_one_screen/intro_one_screen.dart';
import '../presentation/intro_two_screen/intro_two_screen.dart';
import '../presentation/intro_three_screen/intro_three_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/course_screen/course_screen.dart';
import '../presentation/course_screen/course_detail_screen/course_detail_screen.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_leaning_screen/course_learning_screen.dart';
import '../presentation/indox_screen/indox_screen.dart';
import '../presentation/transactions_screen/transactions_screen.dart';
import '../presentation/profiles_screen/profiles_screen.dart';

class AppRoutes {
  static const String launchingScreen = '/launching_screen';

  static const String introScreen = '/intro_screen';

  static const String introOneScreen = '/intro_one_screen';

  static const String introTwoScreen = '/intro_two_screen';

  static const String introThreeScreen = '/intro_three_screen';

  static const String homeScreen = '/home_screen';

  static const String courseScreen = '/course_screen';

  static const String courseDetailScreen = '/course_detail_screen';

  static const String courseLearningScreen = '/course_learning_screen';

  static const String indoxScreen = '/indox_screen';

  static const String transactionsScreen = '/transactions_screen';

  static const String profilesScreen = '/profiles_screen';

  static Map<String, WidgetBuilder> routes = {
    launchingScreen: (context) => LaunchingScreen(),
    introScreen: (context) => IntroScreen(),
    introOneScreen: (context) => IntroOneScreen(),
    introTwoScreen: (context) => IntroTwoScreen(),
    introThreeScreen: (context) => IntroThreeScreen(),
    homeScreen: (context) => HomeScreen(),
    courseScreen: (context) => CourseScreen(),
    courseDetailScreen: (context) {
      final String? slug =
          ModalRoute.of(context)?.settings.arguments as String?;
      return CourseDetailScreen(slug: slug!);
    },
    courseLearningScreen: (context) => CourseLearningScreen(),
    indoxScreen: (context) => IndoxScreen(),
    transactionsScreen: (context) => TransactionsScreen(),
    profilesScreen: (context) => ProfilesScreen(),
  };
}

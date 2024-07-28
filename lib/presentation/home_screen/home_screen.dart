import 'dart:convert';
import 'package:english_academy_mobile/presentation/home_screen/widgets/category_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/presentation/home_screen/widgets/banner_home_screen.dart';
import 'package:english_academy_mobile/presentation/home_screen/widgets/our_app_home_screen.dart';
import 'package:english_academy_mobile/presentation/home_screen/widgets/outstanding_tutor_home_screen.dart';
import 'package:english_academy_mobile/presentation/home_screen/widgets/popular_course_home_screen.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_image.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/service/AuthService.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar_home_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String studentNameFromToken = '';

  @override
  void initState() {
    super.initState();
    _getStudentInfo();
  }

  void _getStudentInfo() async {
    try {
      final String token = await AuthService.getToken();
      final List<String> parts = token.split(".");
      final String normalizedToken = base64Url.normalize(parts[1]);
      final String decodedToken =
          utf8.decode(base64Url.decode(normalizedToken));

      final Map<String, dynamic> tokenData = json.decode(decodedToken);

      setState(() {
        studentNameFromToken = tokenData['Fullname'].toString();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Column(
            children: [
              Column(
                children: [
                  _buildBanner(context),
                  SizedBox(height: 19.v),
                  _buildCategory(context),
                  SizedBox(height: 12.v),
                  _buildPopularCourse(context),
                  SizedBox(height: 19.v),
                  _buildTuTor(context),
                  _buildOurApp(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBarHomeScreen(
      height: 50.v,
      title: Padding(
        padding: EdgeInsets.only(left: 24.h),
        child: Column(
          children: [
            Text(
              "Welcome, $studentNameFromToken 👋",
              style: CustomTextStyles.titleMediumOnErrorContainer_1.copyWith(
                color: theme.colorScheme.onErrorContainer.withOpacity(1),
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 9.v),
            Text(
              "Upgrade your skill for better futures !      ",
              style: CustomTextStyles.bodySmallBluegray30002.copyWith(
                color: appTheme.blueGray30002,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(24.h, 5.v, 24.h, 6.v),
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 4.v,
          ),
          decoration: AppDecoration.outlineBluegray30002.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppbarImage(
                imagePath: ImageConstant.imgNotification,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildBanner(BuildContext context) {
    return BannerHomeScreen();
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return CategoryHomeScreen();
  }

  /// Section Widget
  Widget _buildPopularCourse(BuildContext context) {
    return PopularCourseHomeScreen();
  }

  /// Section Widget
  Widget _buildTuTor(BuildContext context) {
    return OutstandingTutorHomeScreen();
  }

  /// Section Widget
  Widget _buildOurApp(BuildContext context) {
    return OurAppHomeScreen();
  }
}

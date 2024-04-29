import 'package:english_academy_mobile/presentation/auth/login_screen/login_screen.dart';
import 'package:english_academy_mobile/presentation/home_screen/home_screen.dart';
import 'package:english_academy_mobile/presentation/launching_screen/launching_screen.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/init_screen.dart';
import 'package:english_academy_mobile/presentation/intro_one_screen/intro_one_screen.dart';
import 'package:english_academy_mobile/presentation/intro_three_screen/intro_three_screen.dart';
import 'package:english_academy_mobile/presentation/intro_two_screen/intro_two_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../widgets/custom_elevated_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _totalPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              IntroOneScreen(),
              IntroTwoScreen(),
              IntroThreeScreen(),
            ],
          ),
          Align(
            alignment: Alignment(1.0, -0.9),
            child: Padding(
              padding: EdgeInsets.only(top: 16, right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  "Skip",
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildPagination(context),
    );
  }

  /// Section Widget
  Widget _buildPagination(BuildContext context) {
    if (_currentPage < _totalPages - 1) {
      return Padding(
        padding: EdgeInsets.only(
          left: 34.h,
          right: 34.h,
          bottom: 66.v,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 10.v,
              margin: EdgeInsets.symmetric(vertical: 25.v),
              child: AnimatedSmoothIndicator(
                activeIndex: _currentPage,
                count: 3,
                effect: ScrollingDotsEffect(
                  spacing: 15,
                  activeDotColor: theme.colorScheme.primary,
                  dotColor: appTheme.teal5001,
                  dotHeight: 10.v,
                  dotWidth: 10.h,
                ),
              ),
            ),
            CustomIconButton(
              height: 60.adaptSize,
              width: 60.adaptSize,
              padding: EdgeInsets.all(10.h),
              decoration: IconButtonStyleHelper.fillIndigo,
                child: IconButton(
                  onPressed: () {
                    if (_currentPage < 3) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InitScreen()),
                      );
                    }
                  },
                  icon: CustomImageView(
                    imagePath: ImageConstant.imgArrowLeft,
                  ),
                ),
              ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
          left: 34.h,
          right: 34.h,
          bottom: 66.v,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 10.v,
              margin: EdgeInsets.symmetric(vertical: 25.v),
              child: AnimatedSmoothIndicator(
                activeIndex: _currentPage,
                count: 3,
                effect: ScrollingDotsEffect(
                  spacing: 15,
                  activeDotColor: theme.colorScheme.primary,
                  dotColor: appTheme.teal5001,
                  dotHeight: 10.v,
                  dotWidth: 10.h,
                ),
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              buttonStyle: CustomButtonStyles.fillIndigo,
              buttonTextStyle: CustomTextStyles.titleMediumPrimary,
              width: 200.h,
              text: "Get Started",
            ),
          ],
        ),
      );
    }
  }
}
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/presentation/intro_scren/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class LaunchingScreen extends StatelessWidget {
  const LaunchingScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeUtils.height,
        width: double.maxFinite,
        child: AnimatedSplashScreen(
          splash: Column(
            children: [
              Center(
                child: LottieBuilder.asset("assets/lottie/education.json"),
              )
            ],),
          nextScreen: const IntroScreen(),
          splashIconSize: 250,
          backgroundColor: appTheme.blue50,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
        ),
      )
    );
  }
}

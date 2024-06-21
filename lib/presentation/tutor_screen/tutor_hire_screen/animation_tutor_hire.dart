import 'package:english_academy_mobile/data/model/TurtorModel.dart';
import 'package:english_academy_mobile/presentation/tutor_screen/tutor_hire_screen/tutor_hire_screen.dart';
import 'package:flutter/material.dart';

class AnimationTutorHire extends StatelessWidget {
  final TutorModel tutor;

  const AnimationTutorHire({Key? key, required this.tutor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 1100),
              builder: (context, value, child) {
                return ShaderMask(
                  blendMode: BlendMode.modulate,
                  shaderCallback: (rect) {
                    return RadialGradient(
                      radius: value * 5,
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.transparent,
                        Colors.transparent
                      ],
                      stops: [0.0, 0.55, 0.6, 1.0],
                      center: FractionalOffset(0.95, 0.95),
                    ).createShader(rect);
                  },
                  child: TutorHireScreen(tutor: tutor),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

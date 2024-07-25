import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/data/model/EntranceTestModel.dart';
import 'package:english_academy_mobile/init_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/answer_detail_screen/answer_detail_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/widgets/data_course_suggest_item_widget.dart';
import 'package:english_academy_mobile/service/EntranceTestService.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../theme/theme_helper.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_outlined_button.dart';

class LearningPathsToeicScreen extends StatelessWidget {
  final String code;

  const LearningPathsToeicScreen({Key? key, required this.code})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: EntranceTestService.fetchLearningPaths(code),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final learningPath = snapshot.data!;
            final type = learningPath.type;
            final courseSuggest = learningPath.courseOnlineList;

            if (type == 1) {
              return buildNotFoundWidget(context);
            }

            final correctReading = learningPath.correctReading;
            final correctListening = learningPath.correctListening;

            final totalQuestionReading = learningPath.totalQuestionReading;
            final totalQuestionListening = learningPath.totalQuestionListening;

            final totalCorrect = correctReading + correctListening;
            final totalQuestion = totalQuestionReading + totalQuestionListening;

            return Scaffold(
              backgroundColor: theme.colorScheme.primary,
              appBar: _buildAppBar(context),
              body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 15.v,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 14.v),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.h,
                          vertical: 20.v,
                        ),
                        decoration: AppDecoration.fillOnErrorContainer.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder16,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 14.v),
                            Container(
                              width: 206.h,
                              margin: EdgeInsets.symmetric(horizontal: 28.h),
                              child: Text(
                                "Learning Paths Toeic",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0),
                              ),
                            ),
                            SizedBox(height: 23.v),
                            SizedBox(
                              height: 166.adaptSize,
                              width: 166.adaptSize,
                              child: buildPieChart(
                                correctReading.toDouble(),
                                correctListening.toDouble(),
                              ),
                            ),
                            SizedBox(height: 34.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 12.adaptSize,
                                      width: 12.adaptSize,
                                      margin: EdgeInsets.symmetric(vertical: 2.v),
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.primaryContainer,
                                        borderRadius: BorderRadius.circular(
                                          6.h,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Text(
                                        "Result",
                                        style: CustomTextStyles
                                            .titleSmallGray60001Medium,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${totalCorrect}/${totalQuestion}',
                                  style:
                                      CustomTextStyles.titleSmallGray60001Medium,
                                ),
                              ],
                            ),
                            SizedBox(height: 11.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 1.v),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 12.adaptSize,
                                        width: 12.adaptSize,
                                        margin: EdgeInsets.only(
                                          top: 1.v,
                                          bottom: 3.v,
                                        ),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          borderRadius: BorderRadius.circular(
                                            6.h,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.h),
                                        child: Text(
                                          "Time complete",
                                          style: CustomTextStyles
                                              .titleSmallGray60001Medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${formatMinute(Duration(seconds: learningPath.time))}',
                                  style:
                                      CustomTextStyles.titleSmallGray60001Medium,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1.v),
                                  child: Text(
                                    "Band score",
                                    style:
                                        CustomTextStyles.titleSmallBluegray80001,
                                  ),
                                ),
                                Text(
                                  "${learningPath.score}",
                                  style: CustomTextStyles.titleSmallBluegray80001,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  // Container 1
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.h,
                                      vertical: 11.v,
                                    ),
                                    decoration: (learningPath.score >= 0 && learningPath.score <= 299)
                                        ? AppDecoration.fillIndigo.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    )
                                        : AppDecoration.fillGray100.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 2.h,
                                            top: 2.v,
                                            bottom: 1.v,
                                          ),
                                          child: Text(
                                            "5 - 300",
                                            style: (learningPath.score >= 0 && learningPath.score <= 299)
                                                ? CustomTextStyles.titleMediumPrimary
                                                : CustomTextStyles.titleMediumGray60001,
                                          ),
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "Basic",
                                          style: (learningPath.score >= 0 && learningPath.score <= 299)
                                              ? CustomTextStyles.labelLargePrimary_1
                                              : CustomTextStyles.labelLargeGray60001_1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.h),
                                Expanded(
                                  // Container 2
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.h,
                                      vertical: 11.v,
                                    ),
                                    decoration: (learningPath.score >= 300 && learningPath.score <= 599)
                                        ? AppDecoration.fillIndigo.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    )
                                        : AppDecoration.fillGray100.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 2.h,
                                            top: 2.v,
                                            bottom: 1.v,
                                          ),
                                          child: Text(
                                            "300 - 600",
                                            style: (learningPath.score >= 300 && learningPath.score <= 599)
                                                ? CustomTextStyles.titleMediumPrimary
                                                : CustomTextStyles.titleMediumGray60001,
                                          ),
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "Intermediate",
                                          style: (learningPath.score >= 300 && learningPath.score <= 599)
                                              ? CustomTextStyles.labelLargePrimary_1
                                              : CustomTextStyles.labelLargeGray60001_1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  // Container 1
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.h,
                                      vertical: 11.v,
                                    ),
                                    decoration: (learningPath.score >= 600 && learningPath.score <= 799)
                                        ? AppDecoration.fillIndigo.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    )
                                        : AppDecoration.fillGray100.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 2.h,
                                            top: 2.v,
                                            bottom: 1.v,
                                          ),
                                          child: Text(
                                            "600 - 800",
                                            style: (learningPath.score >= 600 && learningPath.score <= 799)
                                                ? CustomTextStyles.titleMediumPrimary
                                                : CustomTextStyles.titleMediumGray60001,
                                          ),
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "Advanced",
                                          style: (learningPath.score >= 600 && learningPath.score <= 799)
                                              ? CustomTextStyles.labelLargePrimary_1
                                              : CustomTextStyles.labelLargeGray60001_1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.h),
                                Expanded(
                                  // Container 2
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.h,
                                      vertical: 11.v,
                                    ),
                                    decoration: (learningPath.score >= 800 && learningPath.score <= 990)
                                        ? AppDecoration.fillIndigo.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    )
                                        : AppDecoration.fillGray100.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 2.h,
                                            top: 2.v,
                                            bottom: 1.v,
                                          ),
                                          child: Text(
                                            "800 - 990",
                                            style: (learningPath.score >= 800 && learningPath.score <= 990)
                                                ? CustomTextStyles.titleMediumPrimary
                                                : CustomTextStyles.titleMediumGray60001,
                                          ),
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "Expert",
                                          style: (learningPath.score >= 800 && learningPath.score <= 990)
                                              ? CustomTextStyles.labelLargePrimary_1
                                              : CustomTextStyles.labelLargeGray60001_1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.v),
                      CustomOutlinedButton(
                        text: "View Answer",
                        buttonStyle: CustomButtonStyles.outlineOnErrorContainer,
                        buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainer_1,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => AnswerDetailScreen(code: code)),
                          );
                        },
                      ),
                      SizedBox(height: 30.v),
                      _buildCourseSuggest(courseSuggest),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarTrailingImage(
        imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
        margin: EdgeInsets.symmetric(horizontal: 10),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgShareTwoOnerrorcontainer,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        ),
      ],
    );
  }

  String formatMinute(Duration second) {
    final minutes = second.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = second.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

PieChart buildPieChart(double correctReading, double correctListening) {
  List<PieChartSectionData> pieChartSections = [
    PieChartSectionData(
      color: Colors.blue,
      value: correctReading,
      title: 'Reading',
      radius: 80,
      titleStyle: TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    PieChartSectionData(
      color: Colors.green,
      value: correctListening,
      title: 'Listening',
      radius: 80,
      titleStyle: TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  ];

  return PieChart(
    PieChartData(
      sections: pieChartSections,
      borderData: FlBorderData(show: false),
      centerSpaceRadius: 0,
      sectionsSpace: 0,
    ),
  );
}

Widget buildNotFoundWidget(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/docs-notfound.json", width: 300),
          SizedBox(height: 20.0),
          Text(
            "The test does not exist!",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: theme.colorScheme.primary
            ),
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => InitScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: theme.colorScheme.primary,
            ),
            child: Text(
              'Go to Home',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildCourseSuggest(List<CourseSuggest> courses) {
  return DataCourseSuggestItemWidget(courses: courses);
}

onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
}
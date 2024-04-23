import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/init_screen.dart';
import 'package:english_academy_mobile/service/TestOnlineService.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_outlined_button.dart';

class ResultTestOnline extends StatelessWidget {
  final String testCode;

  const ResultTestOnline({Key? key, required this.testCode})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TestOnlineService.fetchResultTestOnline(testCode),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final resultTest = snapshot.data!;

            final correctReading = resultTest.correctReading;
            final correctListening = resultTest.correctListening;
            final correctVocabulary = resultTest.correctVocabulary;
            final correctGrammar = resultTest.correctGrammar;

            final totalQuestionReading = resultTest.totalQuestionReading;
            final totalQuestionListening = resultTest.totalQuestionListening;
            final totalQuestionVocabulary = resultTest.totalQuestionVocabulary;
            final totalQuestionGrammar = resultTest.totalQuestionGrammar;

            final totalCorrect = correctReading + correctListening + correctVocabulary + correctGrammar;

            final totalQuestion = totalQuestionReading + totalQuestionListening + totalQuestionVocabulary + totalQuestionGrammar;

            return Scaffold(
              backgroundColor: theme.colorScheme.primary,
              appBar: _buildAppBar(context),
              body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 15.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            margin: EdgeInsets.symmetric(horizontal: 0.h),
                            child: Text(
                              "Result Test - ${resultTest.code}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0),
                            ),
                          ),
                          SizedBox(height: 8.v),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 0.h),
                            child: Text(
                              "Congratulations on completing the test!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0,
                                  color: appTheme.gray60001
                              ),
                            ),
                          ),
                          SizedBox(height: 23.v),
                          SizedBox(
                            height: 166.adaptSize,
                            width: 166.adaptSize,
                            child: buildPieChart(
                              correctReading.toDouble(),
                              correctListening.toDouble(),
                              correctVocabulary.toDouble(),
                              correctGrammar.toDouble(),
                            ),
                          ),
                          SizedBox(height: 34.v),
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
                                        "Status",
                                        style: CustomTextStyles
                                            .titleSmallGray60001Medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${resultTest.status == false ? "Not Pass" : "Passed"}',
                                // style:
                                // CustomTextStyles.titleSmallGray60001Medium,
                                style: TextStyle(
                                  color: resultTest.status == false ? Colors.red : Colors.green,
                                )
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
                                        color: theme.colorScheme.primaryContainer,
                                        borderRadius: BorderRadius.circular(
                                          6.h,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Text(
                                        "The test duration",
                                        style: CustomTextStyles
                                            .titleSmallGray60001Medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${formatMinute(Duration(seconds: resultTest.time))}',
                                style:
                                CustomTextStyles.titleSmallGray60001Medium,
                              ),
                            ],
                          ),

                          SizedBox(height: 26.v),
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
                                "${resultTest.score}",
                                style: CustomTextStyles.titleSmallBluegray80001,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 56.v),
                    CustomElevatedButton(
                        text: "Try Again",
                      buttonStyle: CustomButtonStyles.fillPrimary,
                    ),
                    SizedBox(height: 12.v),
                    CustomOutlinedButton(
                      text: "Go to Home",
                      buttonStyle: CustomButtonStyles.outlineOnErrorContainer,
                      buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainer_1,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => InitScreen()),
                        );
                      },
                    ),
                  ],
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InitScreen()),
          );
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

PieChart buildPieChart(double correctReading, double correctListening,
    double correctVocabulary, double correctGrammar) {
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
    PieChartSectionData(
      color: Colors.orange,
      value: correctVocabulary,
      title: 'Vocabulary',
      radius: 80,
      titleStyle: TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    PieChartSectionData(
      color: Colors.red,
      value: correctGrammar,
      title: 'Grammar',
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

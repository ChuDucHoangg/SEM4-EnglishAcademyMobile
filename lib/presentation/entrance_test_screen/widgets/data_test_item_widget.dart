import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/EntranceTestModel.dart';
import '../../../service/EntranceTestService.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_icon_button.dart';

class DataTestItemWidget extends StatelessWidget {
  const DataTestItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String truncateText(String text) {
      if (text.length > 18) {
        return text.substring(0, 18) + '...';
      } else {
        return text;
      }
    }

    return FutureBuilder<List<TestInputModel>>(
      future: EntranceTestService.fetchEntranceTest(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<TestInputModel> tests = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: tests.length,
            itemBuilder: (context, index) {
              final test = tests[index];
              if (test != null) {
                return GestureDetector(
                  onTap: () {
                    _navigateToDetailScreen(context, test.slug, test.type ?? -1);
                  },

                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.h),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(149, 157, 165, 0.2),
                            blurRadius: 24,
                            spreadRadius: 0,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration:
                                IconButtonStyleHelper.fillBlueAccentTL100,
                            child: IconButton(
                              icon: CustomImageView(
                                imagePath: ImageConstant.imageQuiz2,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(width: 10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                truncateText(test.title) ?? '',
                                style: CustomTextStyles.titleENT,
                              ),

                              CustomElevatedButton(
                                height: 24.v,
                                width: 72.h,
                                text: test.type == 0 ? "TOEIC" : "IELTS",
                                margin: EdgeInsets.symmetric(vertical: 5.v),
                                buttonStyle: CustomButtonStyles.outlineGrayTL41,
                                buttonTextStyle: CustomTextStyles.labelMediumPrimary,
                                onPressed: () {},
                              ),

                              SizedBox(height: 4.v),
                              Row(
                                children: [
                                  Text(
                                    'Total question: ${test.totalQuestion}',
                                    style:
                                        CustomTextStyles.labelLargeBluegray300,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.v),
                              Text(
                                "Description: " + truncateText(test.description) ?? '',
                                style: CustomTextStyles.labelLargeBluegray300,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _navigateToDetailScreen(BuildContext context, String slug, int type) {
    if (type == 0) {
      Navigator.pushNamed(context, AppRoutes.entranceTestToeicScreen, arguments: slug);
    } else if (type == 1) {
      Navigator.pushNamed(context, AppRoutes.entranceTestIeltsScreen, arguments: slug);
    } else {
      print('Invalid test type');
    }
  }
}

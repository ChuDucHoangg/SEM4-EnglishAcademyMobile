import 'package:english_academy_mobile/init_screen.dart';
import 'package:english_academy_mobile/service/EntranceTestService.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import '../../../data/model/EntranceTestModel.dart';
import '../../../widgets/app_bar/appbar_subtitle_two.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import 'widgets/data_answers_item_widget.dart';

class AnswerDetailScreen extends StatefulWidget {
  const AnswerDetailScreen({Key? key}) : super(key: key);

  @override
  _AnswerDetailScreenState createState() => _AnswerDetailScreenState();
}

class _AnswerDetailScreenState extends State<AnswerDetailScreen> {
  late Future<List<AnswersDetailModel>> _answerDetailFuture;

  @override
  void initState() {
    super.initState();
    _answerDetailFuture = EntranceTestService.fetchAnswerDetail();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnswersDetailModel>>(
      future: _answerDetailFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (snapshot.hasData) {
          List<AnswersDetailModel> answerDetailList = snapshot.data!;

          return Scaffold(
            backgroundColor: theme.colorScheme.primary,
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: 20, bottom: 50),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 20.v,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: AppDecoration.fillOnErrorContainer
                    .copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder16,
                ),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: answerDetailList.length,
                      itemBuilder: (context, index) {
                        AnswersDetailModel answerDetail = answerDetailList[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 2.v),
                              Text(
                                "Question ${index + 1}: ${answerDetail.title}",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 14.v),
                              _buildAnswers(context, answerDetailList[index]),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text('No data available'),
            ),
          );
        }
      },
    );
  }

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
      centerTitle: true,
      title: AppbarSubtitleTwo(
        text: "Answer Detail",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotificationOnerrorcontainer,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        ),
      ],
    );
  }

  Widget _buildAnswers(BuildContext context, AnswersDetailModel answerDetail) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        String optionText = '';
        bool isCorrect = false;

        switch (index) {
          case 0:
            optionText = answerDetail.option1;
            isCorrect = optionText == answerDetail.answerCorrect;
            break;
          case 1:
            optionText = answerDetail.option2;
            isCorrect = optionText == answerDetail.answerCorrect;
            break;
          case 2:
            optionText = answerDetail.option3;
            isCorrect = optionText == answerDetail.answerCorrect;
            break;
          case 3:
            optionText = answerDetail.option4;
            isCorrect = optionText == answerDetail.answerCorrect;
            break;
          default:
            break;
        }

        return DataAnswersItemWidget(
          optionText: optionText,
          isCorrect: isCorrect,
        );
      },
    );
  }
}


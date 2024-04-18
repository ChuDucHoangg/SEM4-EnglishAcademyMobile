import 'dart:async';
import 'dart:convert';

import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/presentation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../../core/utils/image_constant.dart';
import '../../../data/model/EntranceTestModel.dart';
import '../../../service/EntranceTestService.dart';
import '../../../service/api_constants.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import 'package:audioplayers/audioplayers.dart';

import '../entrance_test_finish/entrance_test_finish.dart';

class EntranceTestToeicScreen extends StatefulWidget {
  final String slug;

  const EntranceTestToeicScreen({Key? key, required this.slug})
      : super(key: key);

  @override
  _EntranceTestToeicScreenState createState() =>
      _EntranceTestToeicScreenState();
}

class _EntranceTestToeicScreenState extends State<EntranceTestToeicScreen> {
  late Future<TestInputDetailModel> _testInputDetail;
  late int countdownTime = 0;
  late DateTime startTime;
  late AudioPlayer audioPlayer = AudioPlayer();
  late Map<String, int?> selectedAnswers = {};
  late List<TestInputSession> sessionDetails = [];

  @override
  void initState() {
    super.initState();
    _testInputDetail = EntranceTestService.fetchEntranceTestDetail(widget.slug);

    _testInputDetail.then((testDetail) {
      setState(() {
        countdownTime = testDetail.time;
        sessionDetails = testDetail.testInputSessionDetails;
      });
      startCountdown();
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio(String url) async {
    await audioPlayer.play(UrlSource(url));
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  void startCountdown() {
    startTime = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownTime > 0) {
        setState(() {
          countdownTime--;
        });
      } else {
        submitTestAnswers();
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TestInputDetailModel>(
      future: _testInputDetail,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (snapshot.hasData) {
          TestInputDetailModel test = snapshot.data!;
          return Scaffold(
            backgroundColor: theme.colorScheme.primary,
            appBar: _buildAppBar(context, test),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildQuestionList(context, test.testInputSessionDetails),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildSubmitButton(context),
                ],
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

  PreferredSizeWidget _buildAppBar(BuildContext context, TestInputDetailModel test) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarTrailingImage(
        imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
        margin: EdgeInsets.symmetric(horizontal: 10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Entrance Test TOEIC",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(width: 10),
          Text(
            formatHouse(Duration(seconds: countdownTime)),
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotificationOnerrorcontainer,
          margin: EdgeInsets.symmetric(horizontal: 10),
        ),
      ],
    );
  }

  List<Widget> _buildQuestionList(BuildContext context, List<TestInputSession> sessions) {
    List<List<Widget>> sessionWidgets = sessions.map((session) {
      List<Widget> sessionQuestionWidgets = [];

      sessionQuestionWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Text(
              session.sessionName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );

      sessionQuestionWidgets.addAll(session.questionTestInputs.map((question) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${session.questionTestInputs.indexOf(question) + 1}: ${question.title}',
                style: TextStyle(height: 1.5, fontSize: 17, letterSpacing: 0),
              ),
              SizedBox(height: 5),
              if (question.image != null && question.image.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    question.image,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 10),
              if (question.audiomp3 != null && question.audiomp3.isNotEmpty)
                ElevatedButton(
                  onPressed: () {
                    if (audioPlayer.state == PlayerState.playing) {
                      pauseAudio();
                    } else {
                      playAudio(question.audiomp3);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                          (states) => theme.colorScheme.primary,
                    ),
                    shape: MaterialStateProperty.all<CircleBorder>(
                      CircleBorder(),
                    ),
                  ),
                  child: Icon(
                    audioPlayer.state == PlayerState.playing
                        ? Icons.pause
                        : Icons.play_arrow_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              SizedBox(height: 10),
              _buildAnswers(context, session, question),
            ],
          ),
        );
      }));

      return sessionQuestionWidgets;
    }).toList();

    return sessionWidgets.expand((widgetList) => widgetList).toList();
  }

  Widget _buildAnswers(BuildContext context, TestInputSession session,
      QuestionTestInput question) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        String optionText = '';
        switch (index) {
          case 0:
            optionText = question.option1;
            break;
          case 1:
            optionText = question.option2;
            break;
          case 2:
            optionText = question.option3;
            break;
          case 3:
            optionText = question.option4;
            break;
          default:
            break;
        }
        Color containerColor =
        selectedAnswers[question.id.toString()] == index
            ? appTheme.indigo100
            : Colors.white;
        Color borderColor =
        selectedAnswers[question.id.toString()] == index
            ? theme.colorScheme.primary
            : appTheme.blueGray400.withOpacity(0.3);
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedAnswers[question.id.toString()] = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 17.v,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
                width: 0.8,
              ),
              borderRadius: BorderRadiusStyle.roundedBorder12,
              color: containerColor,
            ),
            child: Row(
              children: [
                Radio(
                  value: index,
                  groupValue: selectedAnswers[question.id.toString()],
                  onChanged: (value) {
                    setState(() {
                      selectedAnswers[question.id.toString()] = value;
                    });
                  },
                  fillColor: MaterialStateColor.resolveWith(
                          (states) => theme.colorScheme.primary),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SizedBox(width: 5),
                Text(optionText),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          submitTestAnswers();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
                  (states) => theme.colorScheme.primary),
          minimumSize:
          MaterialStateProperty.all(Size(double.infinity, 75)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.stop_circle_outlined, color: Colors.white),
            SizedBox(width: 5),
            Text(
              "FINISH TEST",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatHouse(Duration duration) {
    final houses = duration.inHours.remainder(60).toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$houses:$minutes:$seconds';
  }

  void submitTestAnswers() async {
    try {
      List<Map<String, dynamic>> answers = [];
      sessionDetails.forEach((session) {
        session.questionTestInputs.forEach((question) {
          final selectedOption = selectedAnswers[question.id.toString()];
          if (selectedOption != null) {
            // Sinh viên đã chọn câu trả lời
            String selectedOptionContent = '';
            switch (selectedOption) {
              case 0:
                selectedOptionContent = question.option1;
                break;
              case 1:
                selectedOptionContent = question.option2;
                break;
              case 2:
                selectedOptionContent = question.option3;
                break;
              case 3:
                selectedOptionContent = question.option4;
                break;
            }
            answers.add({
              'content': selectedOptionContent,
              'questionId': question.id,
            });
          } else {
            // Sinh viên chưa chọn câu trả lời
            answers.add({
              'content': ' ',
              'questionId': question.id,
            });
          }
        });
      });

      // Tạo body của request
      Map<String, dynamic> requestBody = {
        'time': DateTime.now().difference(startTime).inSeconds,
        'createAnswerStudentList': answers,
      };

      print(requestBody);

      try {
        var response = await Dio().post('${ApiConstants.baseUrl}${ApiConstants.entranceTestDetail}/${widget.slug}/1',

          data: json.encode(requestBody),
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
        );

        // Kiểm tra kết quả của request
        if (response.statusCode == 200) {
          print('Submit answers successfully!');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => EntranceTestFinish()),
          );
        } else {
          print('Failed to submit answers: ${response.statusCode}');
        }
      } catch (e) {
        print('Error sending request: $e');
      }
    } catch (e) {
      print('Error submitting answers: $e');
    }
  }
}

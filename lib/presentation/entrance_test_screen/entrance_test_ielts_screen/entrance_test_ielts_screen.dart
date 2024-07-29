import 'dart:async';
import 'dart:convert';

import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/learning_paths_ielts_screen/learning_paths_ielts_screen.dart';
import 'package:english_academy_mobile/service/AuthService.dart';
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

class EntranceTestIeltsScreen extends StatefulWidget {
  final String slug;

  const EntranceTestIeltsScreen({Key? key, required this.slug})
      : super(key: key);

  @override
  _EntranceTestIeltsScreenState createState() =>
      _EntranceTestIeltsScreenState();
}

class _EntranceTestIeltsScreenState extends State<EntranceTestIeltsScreen> {
  late Future<TestInputDetailModel> _testInputDetail;
  late int countdownTime = 0;
  late DateTime startTime;
  late AudioPlayer audioPlayer = AudioPlayer();
  late Map<String, int?> selectedAnswers = {};
  late List<TestInputSession> sessionDetails = [];
  late List<AudioPlayer> audioPlayers = [];
  List<int> currentQuestionIndices = [];
  int currentSessionIndex = 0;
  bool canGoBack = false;
  bool canGoForward = true;
  Color disabledColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _testInputDetail = EntranceTestService.fetchEntranceTestDetail(widget.slug);

    _testInputDetail.then((testDetail) {
      setState(() {
        countdownTime = testDetail.time;
        sessionDetails = testDetail.testInputSessionDetails;
        audioPlayers = List.generate(sessionDetails.length, (index) => AudioPlayer());
        currentQuestionIndices = List.filled(sessionDetails.length, 0);
        canGoBack = false;
        canGoForward = sessionDetails.length > 1;
      });
      startCountdown();
    });
  }

  @override
  void dispose() {
    audioPlayers.forEach((player) {
      player.dispose();
    });
    super.dispose();
  }

  Future<void> playAudio(int questionIndex, String url) async {
    for (int i = 0; i < audioPlayers.length; i++) {
      if (i != questionIndex) {
        await audioPlayers[i].stop();
      }
    }
    await audioPlayers[questionIndex].play(UrlSource(url));
  }

  Future<void> pauseAudio(int questionIndex) async {
    // await audioPlayer.pause();
    await audioPlayers[questionIndex].pause();
  }

  void seekToBeginning(int questionIndex) {
    audioPlayers[questionIndex].seek(Duration.zero);
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
                      children: _buildSessionList(context, test.testInputSessionDetails),
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
            Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Entrance Test IELTS",
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

  List<Widget> _buildSessionList(BuildContext context, List<TestInputSession> sessions) {
    List<Widget> sessionWidgets = [];
    sessionWidgets.add(_buildSession(context, sessions[currentSessionIndex]));

    sessionWidgets.add(
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildPrevButton(context),
          _buildNextButton(context),
        ],
      ),
    );
    return sessionWidgets;
  }

  Widget _buildSession(BuildContext context, TestInputSession session) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            session.sessionName,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        for (int j = 0; j < session.questionTestInputs.length; j++)
          _buildQuestion(context, session, session.questionTestInputs[j]),
      ],
    );
  }

  Widget _buildQuestion(BuildContext context, TestInputSession session, QuestionTestInput question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            // question.title,
            'Question ${session.questionTestInputs.indexOf(question) + 1}: ${question.title}',
            style: TextStyle(
              height: 1.5,
              fontSize: 17,
              letterSpacing: 0,
            ),
          ),
        ),
        SizedBox(height: 5),
        if (question.image != null && question.image.trim().isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              question.image.trim(),
              fit: BoxFit.cover,
            ),
          ),
        SizedBox(height: 10),
        if (question.audiomp3 != null && question.audiomp3.trim().isNotEmpty)
          InkWell(
            onTap: () {
              if (audioPlayers[session.questionTestInputs.indexOf(question)].state == PlayerState.playing) {
                pauseAudio(session.questionTestInputs.indexOf(question));
              } else {
                playAudio(session.questionTestInputs.indexOf(question), question.audiomp3);
                seekToBeginning(session.questionTestInputs.indexOf(question));
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primary,
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  audioPlayers[session.questionTestInputs.indexOf(question)].state == PlayerState.playing
                      ? Icons.pause
                      : Icons.play_arrow_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        SizedBox(height: 10),
        _buildAnswers(context, session, question),
      ],
    );
  }



  Widget _buildNextButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: canGoForward ? theme.colorScheme.primary : disabledColor,
      ),
      child: IconButton(
        onPressed: canGoForward ? () {
          if (currentSessionIndex < sessionDetails.length - 1) {
            setState(() {
              currentSessionIndex++;
              canGoBack = true;
              canGoForward = currentSessionIndex < sessionDetails.length - 1;
            });
          }
        } : null,
        icon: Icon(Icons.arrow_forward, color: Colors.white),
        padding: EdgeInsets.zero,
        iconSize: 20,
        splashRadius: 20,
      ),
    );
  }

  Widget _buildPrevButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: canGoBack ? theme.colorScheme.primary : disabledColor,
      ),
      child: IconButton(
        onPressed: canGoBack ? () {
          if (currentSessionIndex > 0) {
            setState(() {
              currentSessionIndex--;
              canGoForward = true;
              canGoBack = currentSessionIndex > 0;
            });
          }
        } : null,
        icon: Icon(Icons.arrow_back, color: Colors.white),
        padding: EdgeInsets.zero,
        iconSize: 20,
        splashRadius: 20,
      ),
    );
  }


  Widget _buildAnswers(BuildContext context, TestInputSession session, QuestionTestInput question) {
    String truncateText(String text) {
      if (text.length > 35) {
        return text.substring(0, 35) + '...';
      } else {
        return text;
      }
    }

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
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                Text(truncateText(optionText)),
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
      final String token = await AuthService.getToken();
      print(requestBody);

      try {
        var response = await Dio().post('${ApiConstants.baseUrl}${ApiConstants.entranceTestSubmit}/${widget.slug}',
          data: json.encode(requestBody),
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $token'
            },
          ),
        );

        // Kiểm tra kết quả của request
        if (response.statusCode == 200) {
          String code = response.data['data'];
          print('Submit answers successfully! Code: $code');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LearningPathsIeltsScreen(code: code)),
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

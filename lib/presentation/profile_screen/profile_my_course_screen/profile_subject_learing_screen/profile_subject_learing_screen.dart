import 'dart:async';
import 'dart:convert';
import 'package:english_academy_mobile/data/model/ItemOfflineModel.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_embeds.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';
import 'package:intl/intl.dart';

import '../../../../service/AuthService.dart';
import '../../../../service/CourseOfflineService.dart';
import '../../../../widgets/app_bar/appbar_subtitle_two.dart';
import '../../../../widgets/app_bar/custom_app_bar_home_screen.dart';
import '../../../../widgets/custom_text_form_field.dart';

class ProfileSubjectLearningScreen extends StatefulWidget {
  final String slug;

  const ProfileSubjectLearningScreen({Key? key, required this.slug})
      : super(
          key: key,
        );

  @override
  ProfileSubjectLearningScreenState createState() =>
      ProfileSubjectLearningScreenState();
}

class ProfileSubjectLearningScreenState
    extends State<ProfileSubjectLearningScreen> with TickerProviderStateMixin {
  late Stream<ItemOfflineModel> _itemStream;
  late Stream<ListScoreModel> _scoreStream;
  late Timer _timer;
  bool isExpired = false;
  bool isLastMinute = false;
  late QuillController _controller;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  bool isInputValid = true;
  String? _errorMessage;
  String studentIdFromToken = '';
  OverlayEntry? fontSizeOverlayEntry;
  GlobalKey fontSizeKey = GlobalKey();

  bool _isValidUrl(String url) {
    final urlPattern =
        r'^(http(s)?:\/\/)?([a-zA-Z0-9\-_]+\.[a-zA-Z0-9\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?$';
    final regex = RegExp(urlPattern);
    return regex.hasMatch(url);
  }

  @override
  void initState() {
    super.initState();
    _itemStream =
        CourseOfflineService.fetchItemSlotOfflineDetailStream(widget.slug)
            .asBroadcastStream();
    _itemStream.listen((item) {
      if (mounted) {
        setState(() {
          _scoreStream =
              CourseOfflineService.fetchListScoreStudentStream(item.slug)
                  .asBroadcastStream();
        });
      }
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    _controller = QuillController.basic();
    _getStudentInfo();
  }

  void _getStudentInfo() async {
    try {
      final String token = await AuthService.getToken();
      final Map<String, dynamic> tokenData = json.decode(
          ascii.decode(base64.decode(base64.normalize(token.split(".")[1]))));

      setState(() {
        studentIdFromToken = tokenData['Id'].toString();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void _voteScoreStudent(int answerStudentItemSlotId, int star) async {
    try {
      await CourseOfflineService.voteScoreStudent(
          answerStudentItemSlotId, star);
      if (fontSizeOverlayEntry != null) {
        fontSizeOverlayEntry!.remove();
        fontSizeOverlayEntry = null;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Center(
                child: Text(
                  "Vote successfully!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      );
    } catch (e) {
      if (fontSizeOverlayEntry != null) {
        fontSizeOverlayEntry!.remove();
        fontSizeOverlayEntry = null;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
              decoration: AppDecoration.fillRedA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Text(
                "You have already voted for this person!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
      );
    }
  }

  void showFontSize(BuildContext context, Offset offset, ListScoreModel score,
      int answerStudentItemSlotId) {
    if (fontSizeOverlayEntry != null) {
      fontSizeOverlayEntry!.remove();
      fontSizeOverlayEntry = null;
    } else {
      OverlayState overlayState = Overlay.of(context);
      fontSizeOverlayEntry = OverlayEntry(
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return GestureDetector(
                onTap: () {
                  if (fontSizeOverlayEntry != null) {
                    fontSizeOverlayEntry!.remove();
                    fontSizeOverlayEntry = null;
                  }
                },
                child: Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                        left: offset.dx - 168,
                        top: offset.dy - 68,
                        child: Container(
                            width: 160,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 4.v,
                            ),
                            decoration: AppDecoration.fillYellow.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder12,
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () => _voteScoreStudent(
                                        answerStudentItemSlotId, 1),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.v),
                                      decoration:
                                          AppDecoration.outlineBluegray502,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgSignal,
                                                height: 15.adaptSize,
                                                width: 15.adaptSize,
                                                color: appTheme.amberA200,
                                              ),
                                              Text(
                                                " = 1",
                                                style: CustomTextStyles
                                                    .bodySmallGray900
                                                    .copyWith(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Remain ${score.star1Count}",
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(
                                              color: appTheme.gray60001,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _voteScoreStudent(
                                        answerStudentItemSlotId, 2),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.v),
                                      decoration:
                                          AppDecoration.outlineBluegray502,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgSignal,
                                                height: 15.adaptSize,
                                                width: 15.adaptSize,
                                                color: appTheme.amberA200,
                                              ),
                                              Text(
                                                " = 2",
                                                style: CustomTextStyles
                                                    .bodySmallGray900
                                                    .copyWith(
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Remain ${score.star2Count}",
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(
                                              color: appTheme.gray60001,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _voteScoreStudent(
                                        answerStudentItemSlotId, 3),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.v),
                                      decoration:
                                          AppDecoration.outlineBluegray502,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgSignal,
                                                height: 15.adaptSize,
                                                width: 15.adaptSize,
                                                color: appTheme.amberA200,
                                              ),
                                              Text(
                                                " = 3",
                                                style: CustomTextStyles
                                                    .bodySmallGray900
                                                    .copyWith(
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Remain ${score.star3Count}",
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(
                                              color: appTheme.gray60001,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );

      overlayState.insert(fontSizeOverlayEntry!);
    }
  }

  void _submitAnswer(
      BuildContext context, int itemSlotId, String content) async {
    try {
      final ItemOfflineModel item =
          await CourseOfflineService.fetchItemSlotOfflineDetailStream(
                  widget.slug)
              .first;
      final int itemSlotId = item.id;

      await CourseOfflineService.createAnswerItemSlotStudent(
          itemSlotId, content);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Center(
                child: Text(
                  "Your answer has been submitted!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
              decoration: AppDecoration.fillRedA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Text(
                "You have already answered this question!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
      );
      // throw Exception("Failed to send answer data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ItemOfflineModel>(
        stream: _itemStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final ItemOfflineModel item = snapshot.data!;
            Duration remainingTime = item.endDate.difference(DateTime.now());
            String remainingTimeString = '';
            if (remainingTime.inSeconds <= 60) {
              isLastMinute = true;
            } else {
              isLastMinute = false;
            }
            if (isLastMinute) {
              remainingTimeString = '${remainingTime.inSeconds} seconds';
            } else {
              if (remainingTime.inHours > 0) {
                remainingTimeString += '${remainingTime.inHours} hours ';
              }
              remainingTimeString +=
                  '${remainingTime.inMinutes.remainder(60)} minutes ${remainingTime.inSeconds.remainder(60)} seconds';
            }

            if (remainingTime.isNegative) {
              remainingTimeString = 'Expired';
              isExpired = true;
            } else {
              isExpired = false;
            }

            return Scaffold(
              appBar: _buildAppBar(context, item),
              body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                  child: Stack(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 20.h),
                      child: Column(
                        children: [
                          if (item.itemType != 0)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 6.h, bottom: 15.h),
                                child: Text(
                                  "*Time remaining: $remainingTimeString",
                                  style: isExpired
                                      ? CustomTextStyles.labelLargeRedA200
                                          .copyWith(fontSize: 15.h)
                                      : CustomTextStyles.labelLargePrimary
                                          .copyWith(fontSize: 15.h),
                                ),
                              ),
                            ),
                          _buildContent(context, item.content),
                          if (!isExpired) _buildAnswer(context, item),
                          if (item.itemType != 0 && item.itemType != 2)
                            StreamBuilder<ListScoreModel>(
                              stream: _scoreStream,
                              builder: (context, scoreSnapshot) {
                                if (scoreSnapshot.connectionState ==
                                    ConnectionState.none) {
                                  return Center(
                                    child: Container(),
                                  );
                                } else if (scoreSnapshot.hasError) {
                                  return _buildDiscuss2(
                                    context,
                                    item.answerStudentItemSlotResponseListList,
                                  );
                                } else if (scoreSnapshot.hasData) {
                                  final ListScoreModel score =
                                      scoreSnapshot.data!;
                                  return _buildDiscuss(
                                    context,
                                    item.answerStudentItemSlotResponseListList,
                                    score,
                                  );
                                } else {
                                  return Center(
                                    child: Text('No data available'),
                                  );
                                }
                              },
                            )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            );
          }
        });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(
      BuildContext context, ItemOfflineModel item) {
    return CustomAppBarHomeScreen(
      height: 50.v,
      leadingWidth: 48.h,
      leading: AppbarTrailingImage(
        imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
        margin: EdgeInsets.symmetric(horizontal: 13),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarSubtitleTwo(
        text: item.title,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotificationOnerrorcontainer,
          margin: EdgeInsets.symmetric(
            horizontal: 13,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildContent(BuildContext context, String htmlContent) {
    return Container(
      width: 350.h,
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 13.h),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.v),
          Text(
            "Content",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 12.v),
          Container(
            decoration: AppDecoration.outlineBluegray506,
          ),
          SizedBox(height: 12.v),
          HtmlWidget(
            htmlContent,
          ),
        ],
      ),
    );
  }

  Widget _buildAnswer(BuildContext context, ItemOfflineModel item) {
    return Padding(
      padding: EdgeInsets.only(top: 20.v),
      child: Container(
        width: 350.h,
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 13.h),
        decoration: AppDecoration.outlineBluegray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.v),
            Text(
              "Your Answer",
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 12.v),
            Container(
              decoration: AppDecoration.outlineBluegray506,
            ),
            SizedBox(height: 12.v),
            if (item.itemType == 1) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 13.h),
                decoration: AppDecoration.outlineBluegray506.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Column(
                  children: [
                    QuillToolbar.simple(
                      configurations: QuillSimpleToolbarConfigurations(
                        controller: _controller,
                        sharedConfigurations: const QuillSharedConfigurations(
                          locale: Locale('de'),
                        ),
                        multiRowsDisplay: false,
                        toolbarSize: 30.h,
                        embedButtons: FlutterQuillEmbeds.toolbarButtons(),
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 13.h),
                      decoration: AppDecoration.fillGray100.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      child: Column(
                        children: [
                          QuillEditor.basic(
                            configurations: QuillEditorConfigurations(
                              controller: _controller,
                              autoFocus: true,
                              sharedConfigurations:
                                  const QuillSharedConfigurations(
                                locale: Locale('de'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {
                  String answerContent = QuillDeltaToHtmlConverter(
                          _controller.document.toDelta().toJson())
                      .convert();
                  _submitAnswer(context, item.id, answerContent);
                },
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.v, horizontal: 10.h),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    margin: EdgeInsets.only(left: 209.h),
                    child: Text(
                      "Submit Answer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ] else ...[
              CustomTextFormField(
                hintText: "Submit Link Answer",
                autofocus: false,
                hintStyle: CustomTextStyles.bodyLargeBluegray300,
                contentPadding: EdgeInsets.only(bottom: 25.v, left: 15.v),
                controller: _textController,
                borderDecoration: isInputValid != true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.h),
                        borderSide: BorderSide(
                          color: appTheme.redA200,
                          width: 1,
                        ),
                      )
                    : null,
              ),
              if (!isInputValid)
                Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 3.h),
                  child: Text(
                    _errorMessage.toString(),
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12.h,
                    ),
                  ),
                ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {
                  if (_textController.text.isEmpty) {
                    setState(() {
                      isInputValid = false;
                      _errorMessage = 'Please enter your answer!';
                    });
                  } else if (!_isValidUrl(_textController.text)) {
                    setState(() {
                      isInputValid = false;
                      _errorMessage = 'Please enter a valid link!';
                    });
                  } else {
                    setState(() {
                      isInputValid = true;
                    });
                    _submitAnswer(context, item.id, _textController.text);
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.v, horizontal: 10.h),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  margin: EdgeInsets.only(left: 209.h),
                  child: Text(
                    "Submit Answer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  ///Section Widget
  Widget _buildDiscuss(
      BuildContext context, List<dynamic> answerList, ListScoreModel score) {
    if (answerList.length == 0) return Container();
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 20.v),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3.h),
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineBluegray501.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.v),
              Text(
                "Discuss",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 12.v),
              Container(
                decoration: AppDecoration.outlineBluegray506,
              ),
              SizedBox(height: 12.v),
              Column(
                children: answerList.map((answer) {
                  String answerContent = answer['content'];

                  DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
                  DateTime dateTime = inputFormat.parse(answer['time']);

                  DateFormat outputFormat =
                      DateFormat("MMM d, yyyy 'at' hh:mm a");
                  String formattedTime = outputFormat.format(dateTime);

                  return Column(children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                          vertical: 16.v,
                        ),
                        decoration: AppDecoration.fillGray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            decoration: AppDecoration.outlineBluegray502,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath:
                                      "https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg",
                                  height: 32.adaptSize,
                                  width: 32.adaptSize,
                                  radius: BorderRadius.circular(
                                    16.h,
                                  ),
                                  margin: EdgeInsets.only(bottom: 12.v),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12.h,
                                    bottom: 10.v,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        answer['createdBy'],
                                        style: CustomTextStyles
                                            .labelLargeGray900_1,
                                      ),
                                      SizedBox(height: 3.v),
                                      SizedBox(
                                        width: 182.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 1.v),
                                              child: Text(
                                                formattedTime,
                                                style:
                                                    theme.textTheme.labelMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(),
                                if (!isExpired)
                                  if (answer['studentId'].toString() ==
                                      studentIdFromToken)
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgBarcodeBlueGray300,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      margin: EdgeInsets.only(
                                        top: 6.v,
                                        bottom: 18.v,
                                      ),
                                    )
                                  else
                                    GestureDetector(
                                      key: fontSizeKey,
                                      onTap: () {
                                        RenderBox box = fontSizeKey
                                            .currentContext!
                                            .findRenderObject() as RenderBox;
                                        Offset position =
                                            box.localToGlobal(Offset.zero);
                                        showFontSize(context, position, score,
                                            answer['id']);
                                      },
                                      child: Text(
                                        "Vote",
                                        style: TextStyle(
                                            color: theme.primaryColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                              ],
                            ),
                          ),
                          SizedBox(height: 15.v),
                          HtmlWidget(
                            answerContent,
                          ),
                          SizedBox(height: 15.v),
                          Container(
                            decoration: AppDecoration.outlineBluegray505,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50.h,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6.v,
                                    ),
                                    decoration:
                                        AppDecoration.fillPrimary.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgSignal,
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              color: appTheme.blueGray300,
                                            ),
                                            Text(
                                              " ${answer['star'].toString()}",
                                              style: CustomTextStyles
                                                  .bodySmallBluegray300_1
                                                  .copyWith(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgUserBlueGray300,
                                        height: 18.adaptSize,
                                        width: 18.adaptSize,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 6.h,
                                        ),
                                        child: Text(
                                          "0 Replies",
                                          style: CustomTextStyles
                                              .labelLargeBluegray300,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant
                                            .imgShareTwoBlueGray300,
                                        height: 18.adaptSize,
                                        width: 18.adaptSize,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 6.h,
                                        ),
                                        child: Text(
                                          "Reply",
                                          style: CustomTextStyles
                                              .titleMediumff1d2857,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ])),
                    SizedBox(height: 12.v)
                  ]);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  ///Section Widget
  Widget _buildDiscuss2(BuildContext context, List<dynamic> answerList) {
    if (answerList.length == 0) return Container();
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 20.v),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3.h),
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineBluegray501.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.v),
              Text(
                "Discuss",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 12.v),
              Container(
                decoration: AppDecoration.outlineBluegray506,
              ),
              SizedBox(height: 12.v),
              Column(
                children: answerList.map((answer) {
                  String answerContent = answer['content'];

                  DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
                  DateTime dateTime = inputFormat.parse(answer['time']);

                  DateFormat outputFormat =
                      DateFormat("MMM d, yyyy 'at' hh:mm a");
                  String formattedTime = outputFormat.format(dateTime);

                  return Column(children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                          vertical: 16.v,
                        ),
                        decoration: AppDecoration.fillGray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            decoration: AppDecoration.outlineBluegray502,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath:
                                      "https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg",
                                  height: 32.adaptSize,
                                  width: 32.adaptSize,
                                  radius: BorderRadius.circular(
                                    16.h,
                                  ),
                                  margin: EdgeInsets.only(bottom: 12.v),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12.h,
                                    bottom: 10.v,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        answer['createdBy'],
                                        style: CustomTextStyles
                                            .labelLargeGray900_1,
                                      ),
                                      SizedBox(height: 3.v),
                                      SizedBox(
                                        width: 182.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 1.v),
                                              child: Text(
                                                formattedTime,
                                                style:
                                                    theme.textTheme.labelMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.v),
                          HtmlWidget(
                            answerContent,
                          ),
                          SizedBox(height: 15.v),
                          Container(
                            decoration: AppDecoration.outlineBluegray505,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50.h,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6.v,
                                    ),
                                    decoration:
                                        AppDecoration.fillPrimary.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgSignal,
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              color: appTheme.blueGray300,
                                            ),
                                            Text(
                                              " ${answer['star'].toString()}",
                                              style: CustomTextStyles
                                                  .bodySmallBluegray300_1
                                                  .copyWith(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgUserBlueGray300,
                                        height: 18.adaptSize,
                                        width: 18.adaptSize,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 6.h,
                                        ),
                                        child: Text(
                                          "0 Replies",
                                          style: CustomTextStyles
                                              .labelLargeBluegray300,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant
                                            .imgShareTwoBlueGray300,
                                        height: 18.adaptSize,
                                        width: 18.adaptSize,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 6.h,
                                        ),
                                        child: Text(
                                          "Reply",
                                          style: CustomTextStyles
                                              .titleMediumff1d2857,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ])),
                    SizedBox(height: 12.v)
                  ]);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _timer.cancel();
    _textController.dispose();
    super.dispose();
  }
}

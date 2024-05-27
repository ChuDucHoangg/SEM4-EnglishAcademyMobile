import 'dart:async';

import 'package:english_academy_mobile/data/model/ItemOfflineModel.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_embeds.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';
import 'package:intl/intl.dart';

import '../../../../service/CourseOfflineService.dart';
import '../../../../widgets/app_bar/appbar_subtitle_two.dart';
import '../../../../widgets/app_bar/custom_app_bar_home_screen.dart';

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
  late Future<ItemOfflineModel> _itemFuture;
  late Timer _timer;
  bool isExpired = false;
  bool isLastMinute = false;
  late QuillController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _itemFuture = CourseOfflineService.fetchItemSlotOfflineDetail(widget.slug);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    _controller = QuillController.basic();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _submitAnswer(
      BuildContext context, int itemSlotId, String content) async {
    try {
      final ItemOfflineModel item =
          await CourseOfflineService.fetchItemSlotOfflineDetail(widget.slug);
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemOfflineModel>(
        future: _itemFuture,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 6.h, bottom: 15.h),
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
                          _buildDiscuss(context,
                              item.answerStudentItemSlotResponseListList),
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

  /// Section Widget
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 13.h),
                    decoration: AppDecoration.fillGray100.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Column(
                      children: [
                        QuillEditor.basic(
                          configurations: QuillEditorConfigurations(
                            controller: _controller,
                            // readOnly: false,
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
          ],
        ),
      ),
    );
  }

  ///Section Widget
  Widget _buildDiscuss(BuildContext context, List<dynamic> answerList) {
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
                  DateFormat inputFormat =
                      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
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
                                  imagePath: ImageConstant.imgAvatar32x32,
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
}

import 'package:english_academy_mobile/data/model/ItemModel.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_learning_screen/widgets/course_learning_downloaded_item.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_learning_screen/widgets/course_learning_overview_item.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_learning_screen/widgets/course_learning_qa_item.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_learning_screen/widgets/course_learning_resources_item.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/model/TopicModel.dart';
import '../../../service/CourseService.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../button_sheet_item.dart';

class CourseLearningScreen extends StatefulWidget {
  final String slug;

  const CourseLearningScreen({Key? key, required this.slug})
      : super(
          key: key,
        );

  @override
  CourseLearningScreenState createState() => CourseLearningScreenState();
}

class CourseLearningScreenState extends State<CourseLearningScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  late Future<ItemModel> _itemFuture;
  late Future<TopicModel> _topicFuture;
  late Future<ItemModel> _itemFuture2;
  late Map<String, int?> selectedAnswers = {};

  @override
  void initState() {
    super.initState();
    _itemFuture = CourseService.fetchItemDetail(widget.slug);

    _itemFuture2 = _itemFuture.then((item) {
      return item;
    });

    _topicFuture = _itemFuture2.then((itemModel) {
      return CourseService.fetchTopicDetail(itemModel.courseSlug);
    });

    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemModel>(
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
            final ItemModel item = snapshot.data!;
            return Scaffold(
              appBar: _buildAppBar(context),
              body: _buildBody(context, item),
              bottomNavigationBar: _buildBottomBar(context, item),
            );
          }
        });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 8.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotificationGray900,
          margin: EdgeInsets.symmetric(horizontal: 16.h),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context, ItemModel item) {
    if (item.itemType == 1) {
      List<dynamic> questionList = item.questionItemOnlineDTOList;

      return SingleChildScrollView(
          child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(24.h),
        child: Column(
          children: questionList.map((question) {

            void checkAnswer(Map<String, dynamic> question) {
              int? selectedAnswerIndex = selectedAnswers[question['id'].toString()];
              if (selectedAnswerIndex != null) {
                String selectedAnswer = question['answer${selectedAnswerIndex + 1}'];
                String correctAnswer = question['answerCorrect'];

                bool isCorrect = selectedAnswer == correctAnswer;

                String message;
                if (isCorrect) {
                  message = "The answer is correct!";
                } else {
                  message = "The answer is not correct!";
                }


                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
                    decoration: isCorrect
                        ? AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    )
                        : AppDecoration.fillRedA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ));

                Future.delayed(Duration(seconds: 1), () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                });
              }
            }

            return Column(children: [
              SizedBox(height: 15.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 28.v,
                ),
                decoration: AppDecoration.fillGray10001.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.v),
                    Text(
                      "Question 1 of 2",
                      style: CustomTextStyles.labelLargeBluegray300,
                    ),
                    SizedBox(height: 14.v),
                    Container(
                      width: 259.h,
                      margin: EdgeInsets.only(right: 19.h),
                      child: Text(
                        question['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleLarge!.copyWith(
                          height: 1.35,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final answer = question['answer${index + 1}'];
                        Color containerColor =
                            selectedAnswers[question['id'].toString()] == index
                                ? appTheme.indigo100
                                : Colors.white;
                        Color borderColor =
                            selectedAnswers[question['id'].toString()] == index
                                ? theme.colorScheme.primary
                                : appTheme.blueGray400.withOpacity(0.3);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswers[question['id'].toString()] =
                                  index;
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
                                  groupValue: selectedAnswers[
                                      question['id'].toString()],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAnswers[
                                          question['id'].toString()] = value;
                                    });
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => theme.colorScheme.primary),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                SizedBox(width: 5),
                                Text(answer),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    if (selectedAnswers[question['id'].toString()] != null)
                      Column(children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 13.v, horizontal: 12.h),
                          decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                          margin: EdgeInsets.only(left: 152.h, top: 15.h),
                          child: GestureDetector(
                            onTap: () {
                              checkAnswer(question);
                            },
                            child: Text(
                              "Check Answer",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],)
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ));
    } else {
      return SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 24.v),
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContent(context, item),
                  _buildTabBarView(context, item),
                ],
              ),
            ),
          ]),
        ),
      );
    }
  }

  /// Section Widget
  Widget _buildContent(BuildContext context, ItemModel item) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId:
                    YoutubePlayer.convertUrlToId(item.pathUrl) ?? '',
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              progressColors: ProgressBarColors(
                playedColor: Colors.blue,
                handleColor: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox(height: 16.v),
          Container(
            width: 297.h,
            margin: EdgeInsets.only(right: 54.h),
            child: Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge!.copyWith(
                height: 1.35,
              ),
            ),
          ),
          SizedBox(height: 13.v),
          Container(
            height: 28.v,
            margin: EdgeInsets.only(right: 30.h),
            child: TabBar(
              controller: tabviewController,
              isScrollable: true,
              labelColor: theme.colorScheme.onErrorContainer.withOpacity(1),
              labelStyle: TextStyle(
                fontSize: 12.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelColor: appTheme.blueGray300,
              unselectedLabelStyle: TextStyle(
                fontSize: 12.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  6.h,
                ),
              ),
              tabs: [
                Tab(
                  child: Text(
                    "Overview",
                  ),
                ),
                // Tab(
                //   child: Text(
                //     "Lessons",
                //   ),
                // ),
                Tab(
                  child: Text(
                    "Resources",
                  ),
                ),
                Tab(
                  child: Text(
                    "Q&A",
                  ),
                ),
                Tab(
                  child: Text(
                    "Downloaded",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabBarView(BuildContext context, ItemModel item) {
    return Container(
      margin: EdgeInsets.only(top: 10.v),
      height: 330.v,
      child: TabBarView(
        controller: tabviewController,
        children: [
          CourseLearningOverviewItem(item: item),
          CourseLearningResourcesItem(),
          CourseLearningQAItem(),
          CourseLearningDownloadedItem()
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context, ItemModel item) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.outlineGray9004,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 1.v,
              bottom: 23.v,
            ),
            child: CustomIconButton(
              height: 54.adaptSize,
              width: 54.adaptSize,
              padding: EdgeInsets.all(14.h),
              decoration: IconButtonStyleHelper.outlineBlueGrayTL12,
              child: CustomImageView(
                imagePath: ImageConstant.imgForward,
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return FutureBuilder<TopicModel>(
                        future: _topicFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else {
                            final TopicModel topic = snapshot.data!;
                            return ButtonSheetItem(course: topic);
                          }
                        },
                      );
                    });
              },
            ),
          ),
          CustomElevatedButton(
            width: 261.h,
            text: "Complete Lesson  ",
            margin: EdgeInsets.only(bottom: 22.v),
            buttonStyle: CustomButtonStyles.fillPrimary,
            rightIcon: Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              onCompleteLessonPressed();
              onTapArrowLeft(context);
            },
          ),
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  onCompleteLessonPressed() {
    CourseService.markLessonAsComplete(widget.slug)
        .then((_) {})
        .catchError((error) {
      print('Error: $error');
    });
  }
}

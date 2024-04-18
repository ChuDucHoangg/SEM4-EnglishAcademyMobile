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
              body: SizedBox(
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
              ),
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
        .then((_) {
    })
        .catchError((error) {
      print('Error: $error');
    });
  }
}

import 'package:english_academy_mobile/data/model/CourseModel.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CourseDetailLessonsItem extends StatefulWidget {
  final CourseModel course;
  final bool isBought;

  const CourseDetailLessonsItem(
      {Key? key, required this.course, required this.isBought})
      : super(
          key: key,
        );

  @override
  CourseDetailLessonsItemState createState() => CourseDetailLessonsItemState();
}

class CourseDetailLessonsItemState extends State<CourseDetailLessonsItem>
    with AutomaticKeepAliveClientMixin<CourseDetailLessonsItem> {
  @override
  bool get wantKeepAlive => true;
  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    if (widget.course.topicOnlineDetailList.isNotEmpty) {
      _isExpandedList =
          List<bool>.filled(widget.course.topicOnlineDetailList.length, false);
      _isExpandedList[0] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollView(context),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    List<Widget> lessonWidgets = [];
    String truncateText(String text) {
      if (text.length > 20) {
        return text.substring(0, 20) + '...';
      } else {
        return text;
      }
    }

    for (int i = 0; i < widget.course.topicOnlineDetailList.length; i++) {
      var topic = widget.course.topicOnlineDetailList[i];
      lessonWidgets.add(Column(children: [
        SizedBox(height: 17.v),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 23.h),
          decoration: AppDecoration.outlineBluegray501.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExpansionTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                title: Text(
                  truncateText(topic['name']),
                  style: theme.textTheme.titleSmall!,
                ),
                children: [
                  Container(
                    decoration: AppDecoration.outlineBluegray506,
                  ),
                  for (var item in topic['itemOnlineDTOList'])
                    Column(children: [
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: item['itemType'] == 0
                                  ? Icon(
                                      Icons.play_circle,
                                      size: 20.adaptSize,
                                    )
                                  : Icon(
                                      Icons.pending_actions_outlined,
                                      size: 20.adaptSize,
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12.h,
                                top: 2.v,
                              ),
                              child: Text(
                                truncateText(item['title']),
                                style:
                                    CustomTextStyles.labelLargeGray900.copyWith(
                                  color: appTheme.gray900,
                                ),
                              ),
                            ),
                            Spacer(),
                            if (widget.isBought)
                              Container(
                                child: item['itemType'] == 0
                                    ? Text(
                                        "03:23",
                                        style: CustomTextStyles
                                            .labelLargeBluegray300
                                            .copyWith(
                                          color: appTheme.blueGray300,
                                        ),
                                      )
                                    : Text(
                                        "Start Quiz",
                                        style: CustomTextStyles
                                            .labelLargeGray900_1,
                                      ),
                              ),
                            if (widget.isBought && item['itemType'] == 0)
                              Padding(
                                padding: EdgeInsets.only(left: 6.h),
                                child: Icon(
                                  (item['status'] ?? false)
                                      ? Icons.done_all_outlined
                                      : Icons.radio_button_off,
                                  color: appTheme.blueGray500,
                                  size: 20.adaptSize,
                                ),
                              ),
                            if (!widget.isBought)
                              Text(
                                "03:23",
                                style: CustomTextStyles.labelLargeBluegray300
                                    .copyWith(
                                  color: appTheme.blueGray300,
                                ),
                              ),
                            if (!widget.isBought)
                              CustomImageView(
                                imagePath: ImageConstant.imgLocationBlueGray300,
                                height: 16.adaptSize,
                                width: 16.adaptSize,
                                margin: EdgeInsets.only(left: 6.h),
                              ),
                          ],
                        ),
                      ),
                    ]),
                  SizedBox(height: 16.v),
                  for (var item in topic['testOnlineDTOList'])
                    Column(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.question_mark,
                                size: 20.adaptSize,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12.h,
                                top: 2.v,
                              ),
                              child: Text(
                                truncateText(item['title']),
                                style:
                                    CustomTextStyles.labelLargeGray900.copyWith(
                                  color: appTheme.gray900,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: CustomImageView(
                                imagePath: ImageConstant.imgLocationBlueGray300,
                                height: 16.adaptSize,
                                width: 16.adaptSize,
                                margin: EdgeInsets.only(left: 6.h),
                              ),
                            ),
                            if (widget.isBought && item['itemType'] == 0)
                              Padding(
                                padding: EdgeInsets.only(left: 6.h),
                                child: Icon(
                                  item['status']
                                      ? Icons.done_all_outlined
                                      : Icons.radio_button_off,
                                  color: appTheme.blueGray500,
                                  size: 20.adaptSize,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ]),
                  SizedBox(height: 16.v),
                ],
              ),
            ],
          ),
        ),
      ]));
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 10.v),
        child: Column(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.h),
                    child: Text(
                      "Lessons in the course",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                Column(children: lessonWidgets),
                SizedBox(height: 120.v),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

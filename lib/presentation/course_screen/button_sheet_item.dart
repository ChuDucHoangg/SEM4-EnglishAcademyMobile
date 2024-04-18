import 'package:english_academy_mobile/data/model/TopicModel.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class ButtonSheetItem extends StatefulWidget {
  final TopicModel course;

  const ButtonSheetItem({Key? key, required this.course}) : super(key: key);

  @override
  ButtonSheetItemState createState() => ButtonSheetItemState();
}


class ButtonSheetItemState extends State<ButtonSheetItem>
    with AutomaticKeepAliveClientMixin<ButtonSheetItem> {
  @override
  bool get wantKeepAlive => true;
  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    if (widget.course.topicOnlineDetailResponseList.isNotEmpty) {
      _isExpandedList =
          List<bool>.filled(widget.course.topicOnlineDetailResponseList.length, false);
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Container(
            height: 6.v,
            width: 52.h,
            decoration: BoxDecoration(
              color: appTheme.blueGray800B2,
              borderRadius: BorderRadius.circular(
                3.h,
              ),
            ),
          ),
          SizedBox(height: 17.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choose Lesson",
                  style: theme.textTheme.titleMedium,
                ),
                Container(
                  child: ElevatedButton(
                    child: Text(
                      "Cancel",
                      style: CustomTextStyles.titleSmallPrimaryMedium,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22.v),
          Divider(
            indent: 24.h,
            endIndent: 24.h,
          ),
          _buildItemTopic(context),
          SizedBox(height: 22.v),
        ],
      ),
    );
  }

  Widget _buildItemTopic(BuildContext context) {
    void _navigateToItemDetail(BuildContext context, String slug) {
      Navigator.pushNamed(context, AppRoutes.courseLearningScreen,
          arguments: slug);
    }

    List<Widget> lessonWidgets = [];
    String truncateText(String text) {
      if (text.length > 20) {
        return text.substring(0, 20) + '...';
      } else {
        return text;
      }
    }

    for (int i = 0;
    i < widget.course.topicOnlineDetailResponseList.length;
    i++) {
      var topic = widget.course.topicOnlineDetailResponseList[i];
      lessonWidgets.add(Column(children: [
        SizedBox(height: 17.v),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.h),
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
                  for (var item in topic['itemOnlineDetailList'])
                    Column(children: [
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: GestureDetector(
                          onTap: () {
                            _navigateToItemDetail(context, item['slug']);
                          },
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
                                  style:
                                  CustomTextStyles.labelLargeGray900_1,
                                ),
                              ),
                              if (item['itemType'] == 0)
                                Padding(
                                  padding: EdgeInsets.only(left: 6.h),
                                  child: Icon(
                                    item['status']
                                        ? Icons.done_all_outlined
                                        : Icons.radio_button_off,
                                    color: appTheme.blueGray500,
                                    size: 20.adaptSize,
                                  ),
                                )
                            ],
                          ),
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

    return Padding(
      padding: EdgeInsets.only(top: 10.v),
      child: Column(children: lessonWidgets),
    );
  }
}

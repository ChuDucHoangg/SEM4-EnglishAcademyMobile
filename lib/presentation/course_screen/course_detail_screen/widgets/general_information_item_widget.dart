import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:readmore/readmore.dart';
import '../../../../data/model/CourseModel.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../../../widgets/custom_outlined_button.dart';

enum ContentState {
  About,
  Curriculum,
}

class GeneralInformationItemWidget extends StatefulWidget {
  final CourseModel course;

  const GeneralInformationItemWidget({Key? key, required this.course})
      : super(key: key);

  @override
  _GeneralInformationItemWidgetState createState() =>
      _GeneralInformationItemWidgetState();
}

class _GeneralInformationItemWidgetState
    extends State<GeneralInformationItemWidget> {
  ContentState _currentContentState = ContentState.About;
  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    if (widget.course.topicOnlineDetailList.isNotEmpty) {
      _isExpandedList = List<bool>.filled(widget.course.topicOnlineDetailList.length, false);
      _isExpandedList[0] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          Container(
            width: 430.v,
            height: 380.h,
            child: Image.network(
              widget.course.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 360.v,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 34.h),
              padding: EdgeInsets.symmetric(vertical: 25.v),
              decoration: AppDecoration.outlineBlack9001.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 30.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 24.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "IELTS",
                          style: CustomTextStyles.labelLargeOrangeA700,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSignalAmberA20001,
                              height: 12.adaptSize,
                              width: 12.adaptSize,
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text(
                                widget.course.star.toString(),
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        widget.course.name,
                        style: CustomTextStyles.titleLarge20,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 24.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgUpload,
                          height: 19.adaptSize,
                          width: 19.adaptSize,
                          margin: EdgeInsets.only(
                            top: 4.v,
                            bottom: 3.v,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8.h,
                            top: 7.v,
                            bottom: 5.v,
                          ),
                          child: Text(
                            "21 Lessons",
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.h,
                            top: 7.v,
                          ),
                          child: Text(
                            "|",
                            style: CustomTextStyles.titleSmallBlack900,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgTime,
                          height: 19.adaptSize,
                          width: 19.adaptSize,
                          margin: EdgeInsets.only(
                              top: 4.v, bottom: 3.v, left: 10.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8.h,
                            top: 8.v,
                            bottom: 4.v,
                          ),
                          child: Text(
                            "12 Hours",
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$${widget.course.price.toString()}',
                          style: CustomTextStyles.titleLargeMulishPrimary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Row(
                    children: [
                      _buildButton("About", ContentState.About),
                      _buildButton("Lesson", ContentState.Curriculum),
                    ],
                  ),
                  SizedBox(height: 17.v),
                  _currentContentState == ContentState.About
                      ? _buildAboutContent()
                      : _buildLessonContent(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 330.v,
              right: 49.h,
            ),
            child: CustomIconButton(
              height: 63.adaptSize,
              width: 63.adaptSize,
              padding: EdgeInsets.all(18.h),
              decoration: IconButtonStyleHelper.outlineBlackTL31,
              alignment: Alignment.topRight,
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///Common Widget
  Widget _buildButton(String text, ContentState state) {
    return _currentContentState == state
        ? CustomElevatedButton(
            height: 52.v,
            width: 180.h,
            text: text,
            buttonStyle: CustomButtonStyles.outlineBlue,
            buttonTextStyle: CustomTextStyles.titleSmallJostBluegray900,
            onPressed: () {
              setState(() {
                _currentContentState = state;
              });
            },
          )
        : CustomOutlinedButton(
            height: 52.v,
            width: 180.h,
            text: text,
            buttonStyle: CustomButtonStyles.outlineBlue,
            buttonTextStyle: CustomTextStyles.titleSmallJostBluegray900,
            onPressed: () {
              setState(() {
                _currentContentState = state;
              });
            },
          );
  }

  ///Session Widget
  Widget _buildAboutContent() {
    return Column(
      children: [
        SizedBox(height: 17.v),
        Container(
          width: 307.h,
          margin: EdgeInsets.only(
            left: 20.h,
            right: 31.h,
          ),
          child: Text(
            "This course has been tested by many experts.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.labelLargeGray500.copyWith(
              height: 1.46,
            ),
          ),
        ),
        SizedBox(height: 17.v),
        SizedBox(
          width: 313.h,
          child: ReadMoreText(
            widget.course.description,
            trimLines: 4,
            colorClickableText: theme.colorScheme.primary,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Read More",
            moreStyle: CustomTextStyles.labelLargeGray500.copyWith(
              height: 1.46,
            ),
            lessStyle: CustomTextStyles.labelLargeGray500.copyWith(
              height: 1.46,
            ),
          ),
        ),
      ],
    );
  }

  ///Session Widget
  Widget _buildLessonContent() {
    List<Widget> lessonWidgets = [];
    String truncateText(String text) {
      if (text.length > 15) {
        return text.substring(0, 15) + '...';
      } else {
        return text;
      }
    }

    for (int i = 0; i < widget.course.topicOnlineDetailList.length; i++) {
      var topic = widget.course.topicOnlineDetailList[i];
      var isExpanded = _isExpandedList[i];
      lessonWidgets.add(
        Column(
          children: [
            SizedBox(height: 17.v),
            SizedBox(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int j = 0; j < _isExpandedList.length; j++) {
                                if (j != i) {
                                  _isExpandedList[j] = false;
                                }
                              }
                              _isExpandedList[i] = !_isExpandedList[i];
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 25.h,
                              right: 29.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Lesson ${(topic['orderTop']).toString()} - ",
                                        style: CustomTextStyles
                                            .titleSmallJostff202244,
                                      ),
                                      TextSpan(
                                        text: truncateText(topic['name']),
                                        style: CustomTextStyles
                                            .titleSmallJostff0961f5,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.v),
                                  child: Icon(
                                    isExpanded ? Icons.remove : Icons.add,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        if (isExpanded)
                          for (var item in topic['itemOnlineDTOList'])
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.h,
                                right: 30.h,
                                top: 15.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 58.adaptSize,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.h,
                                      vertical: 12.v,
                                    ),
                                    decoration:
                                        AppDecoration.outlineBlue.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder22,
                                    ),
                                    child: Center(
                                      child: Text(
                                        (item['orderTop']).toString(),
                                        style: CustomTextStyles
                                            .titleSmallJostBluegray900SemiBold
                                            .copyWith(
                                          color: appTheme.blueGray900,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 6.h,
                                      top: 4.v,
                                      bottom: 2.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          truncateText(item['title']),
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                            color: appTheme.blueGray900,
                                          ),
                                        ),
                                        Text(
                                          "5 Mins",
                                          style: theme.textTheme.labelLarge!
                                              .copyWith(
                                            color: appTheme.gray700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.v),
                                    child: item['itemType'] == 0
                                        ? Icon(
                                            Icons.play_circle_outline,
                                            size: 20.adaptSize,
                                          )
                                        : Icon(
                                            Icons.pending_actions_outlined,
                                            size: 20.adaptSize,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                        SizedBox(height: 20.v),
                        Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Column(children: lessonWidgets);
  }
}

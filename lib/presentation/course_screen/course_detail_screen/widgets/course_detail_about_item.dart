import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:english_academy_mobile/widgets/custom_checkbox_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../../data/model/CourseModel.dart';

class CourseDetailAboutItem extends StatefulWidget {
  final CourseModel course;

  const CourseDetailAboutItem({Key? key, required this.course})
      : super(
          key: key,
        );

  @override
  CourseDetailAboutItemState createState() => CourseDetailAboutItemState();
}

class CourseDetailAboutItemState extends State<CourseDetailAboutItem>
    with AutomaticKeepAliveClientMixin<CourseDetailAboutItem> {
  bool criticalThinking = false;

  bool checkmark = false;

  bool userInterfaceDesign = false;

  bool usabilityTesting = false;

  bool andmanymore = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollView(context),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 10.v),
        child: Column(
          children: [
            Column(
              children: [
                //description
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "Descriptions",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: 8.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 313.h,
                    margin: EdgeInsets.only(
                      left: 4.h,
                      right: 38.h,
                    ),
                    child: Text(
                      "Hi there! 👋 My name is John and welcome to this course. With this course you can join the global community, exchange ideas, and understand the world's diverse cultures. This course aims to improve English skills for international exams.",
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      style:
                          CustomTextStyles.titleSmallGray60001Medium.copyWith(
                        height: 1.60,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 313.h,
                    margin: EdgeInsets.only(
                      left: 4.h,
                      right: 38.h,
                    ),
                    child: Text(
                      widget.course.description,
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      style:
                          CustomTextStyles.titleSmallGray60001Medium.copyWith(
                        height: 1.60,
                      ),
                    ),
                  ),
                ),

                //key points
                SizedBox(height: 16.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "Key points",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: 16.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: CustomCheckboxButton(
                    text: "Critical Thinking",
                    value: criticalThinking,
                    onChange: (value) {
                      criticalThinking = value;
                    },
                  ),
                ),
                SizedBox(height: 8.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: CustomCheckboxButton(
                    text: "User Experience Research",
                    value: checkmark,
                    onChange: (value) {
                      checkmark = value;
                    },
                  ),
                ),
                SizedBox(height: 8.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: CustomCheckboxButton(
                    text: "User Interface Design",
                    value: userInterfaceDesign,
                    onChange: (value) {
                      userInterfaceDesign = value;
                    },
                  ),
                ),
                SizedBox(height: 8.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: CustomCheckboxButton(
                    text: "Usability Testing",
                    value: usabilityTesting,
                    onChange: (value) {
                      usabilityTesting = value;
                    },
                  ),
                ),
                SizedBox(height: 8.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: CustomCheckboxButton(
                    text: "And many more...",
                    value: andmanymore,
                    onChange: (value) {
                      andmanymore = value;
                    },
                  ),
                ),

                //instructor
                SizedBox(height: 16.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "Instructor",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 3.h),
                  padding: EdgeInsets.all(15.h),
                  decoration: AppDecoration.outlineBluegray501.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 48.adaptSize,
                        width: 48.adaptSize,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgAvatar48x48,
                              height: 48.adaptSize,
                              width: 48.adaptSize,
                              radius: BorderRadius.circular(
                                24.h,
                              ),
                              alignment: Alignment.center,
                            ),
                            CustomElevatedButton(
                              height: 16.v,
                              width: 32.h,
                              text: "4.5",
                              buttonStyle: CustomButtonStyles.fillAmberA,
                              buttonTextStyle:
                                  CustomTextStyles.labelSmallOnErrorContainer,
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Charolette Hanlin",
                              style: theme.textTheme.titleSmall,
                            ),
                            SizedBox(height: 6.v),
                            SizedBox(
                              width: 235.h,
                              child: Row(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgTelevision,
                                    height: 14.adaptSize,
                                    width: 14.adaptSize,
                                    margin: EdgeInsets.symmetric(vertical: 2.v),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "585k students",
                                      textAlign: TextAlign.right,
                                      style:
                                          CustomTextStyles.labelLargeGray60001,
                                    ),
                                  ),
                                  Spacer(),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgForward,
                                    height: 14.adaptSize,
                                    width: 14.adaptSize,
                                    margin: EdgeInsets.symmetric(vertical: 2.v),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.h),
                                    child: Text(
                                      "12 courses",
                                      textAlign: TextAlign.right,
                                      style:
                                          CustomTextStyles.labelLargeGray60001,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 20.v),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

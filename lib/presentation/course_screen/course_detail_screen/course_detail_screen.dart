import 'package:english_academy_mobile/presentation/course_screen/button_sheet_item.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_detail_screen/widgets/course_detail_about_item.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_detail_screen/widgets/course_detail_lessons_item.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_detail_screen/widgets/course_detail_reviews_item.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../data/model/CourseModel.dart';
import '../../../data/model/TopicModel.dart';
import '../../../service/CourseService.dart';

class CourseDetailScreen extends StatefulWidget {
  final String slug;

  const CourseDetailScreen({Key? key, required this.slug}) : super(key: key);

  @override
  CourseDetailScreenState createState() => CourseDetailScreenState();
}

class CourseDetailScreenState extends State<CourseDetailScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  late Future<CourseModel> _courseFuture;
  late Future<TopicModel> _topicFuture;
  late bool _isBought;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
    _courseFuture = CourseService.fetchCourseDetail(widget.slug);
    _topicFuture = CourseService.fetchTopicDetail(widget.slug);
    _initCourseData();
  }

  Future<void> _initCourseData() async {
    try {
      final bool isBought = await CourseService.checkCourseStudent(widget.slug);
      setState(() {
        _isBought = isBought;
      });
    } catch (e) {
      print('Error checking course student: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CourseModel>(
        future: _courseFuture,
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
            final CourseModel course = snapshot.data!;
            return Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                child: Padding(
                  padding: EdgeInsets.only(top: 24.v),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildImage(context, course),
                            SizedBox(height: 23.v),
                            _buildCategory(context, course),
                            SizedBox(height: 12.v),
                            Container(
                              width: 297.h,
                              margin: EdgeInsets.only(
                                left: 8.h,
                                right: 38.h,
                              ),
                              child: Text(
                                course.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleLarge!.copyWith(
                                  height: 1.35,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.v),
                            _buildDetail(context, course),
                            SizedBox(height: 13.v),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.h),
                              child: Container(
                                height: 8.v,
                                width: 327.h,
                                decoration: BoxDecoration(
                                  color: appTheme.blueGray50,
                                  borderRadius: BorderRadius.circular(
                                    3.h,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    3.h,
                                  ),
                                  child: LinearProgressIndicator(
                                    value: 0.75,
                                    backgroundColor: appTheme.blueGray50,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.v),
                            Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "30% ",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                    TextSpan(
                                      text: "from 24 sessions",
                                      style: CustomTextStyles.labelLargeMedium,
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 30.v),
                            _buildTabview(context),
                          ],
                        ),
                      ),
                      _buildTabBarView(context, course),
                      _buildBottomBar(context, course, _isBought)
                    ],
                  ),
                ),
              ),
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
        margin: EdgeInsets.only(left: 22.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgShareTwo,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildImage(BuildContext context, CourseModel course) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.only(left: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Container(
        height: 210.v,
        width: 327.h,
        padding: EdgeInsets.symmetric(vertical: 60.v),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.roundedBorder12,
          image: DecorationImage(
            image: NetworkImage(course.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 80.adaptSize,
                width: 80.adaptSize,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onErrorContainer.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(
                    40.h,
                  ),
                  border: Border.all(
                    color: theme.colorScheme.onErrorContainer.withOpacity(0.2),
                    width: 1.h,
                    strokeAlign: strokeAlignOutside,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.gray900.withOpacity(0.08),
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: Offset(
                        0,
                        4,
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomIconButton(
              height: 56.adaptSize,
              width: 56.adaptSize,
              padding: EdgeInsets.all(12.h),
              decoration: IconButtonStyleHelper.outlineOnErrorContainer,
              alignment: Alignment.center,
              child: CustomImageView(
                imagePath: ImageConstant.imgPlay,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context, CourseModel course) {
    var formatLevel;
    if (course.level == 0) {
      formatLevel = "Basic";
    } else if (course.level == 1) {
      formatLevel = "Intermediate";
    } else if (course.level == 2) {
      formatLevel = "Advanced";
    } else if (course.level == 3) {
      formatLevel = "Expert";
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Row(
        children: [
          CustomElevatedButton(
            height: 24.v,
            width: 73.h,
            text: "IELTS",
            buttonStyle: CustomButtonStyles.outlineGrayTL52,
            buttonTextStyle: CustomTextStyles.labelMediumBlueA700,
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgSettingsGray60001,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 3.v,
              bottom: 3.v,
            ),
            child: Text(
              formatLevel,
              style: CustomTextStyles.titleSmallGray60001,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDetail(BuildContext context, CourseModel course) {
    int totalLessons = 0;
    int totalReviews = 0;
    totalLessons += course.topicOnlineDetailList.length;
    totalReviews += course.reviewList.length;
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgSignal,
          height: 16.adaptSize,
          width: 16.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: course.star.toString(),
                  style: theme.textTheme.labelLarge,
                ),
                TextSpan(
                  text: " ($totalReviews)",
                  style: CustomTextStyles.labelLargeMedium,
                )
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          child: Divider(
            color: appTheme.blueGray100,
            indent: 14.h,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgSearch,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(left: 11.h),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "1,765 ",
                  style: theme.textTheme.labelLarge,
                ),
                TextSpan(
                  text: "enrolled",
                  style: CustomTextStyles.labelLargeMedium,
                )
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          child: Divider(
            color: appTheme.blueGray100,
            indent: 14.h,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgUserGray6000116x16,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(left: 11.h),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Text(
            "$totalLessons+ Lessons",
            style: CustomTextStyles.labelLargeGray60001_1,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 40.v,
      width: 327.h,
      margin: EdgeInsets.only(left: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(
          10.h,
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: Theme.of(context).colorScheme.onPrimary,
        labelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelColor: appTheme.blueGray300,
        unselectedLabelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        indicatorPadding: EdgeInsets.all(
          4.0.h,
        ),
        dividerColor: Colors.transparent,
        tabs: [
          Tab(
            child: Text(
              "About",
            ),
          ),
          Tab(
            child: Text(
              "Lessons",
            ),
          ),
          Tab(
            child: Text(
              "Reviews",
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabBarView(BuildContext context, CourseModel course) {
    return Container(
      margin: EdgeInsets.only(top: 480.v),
      child: TabBarView(
        controller: tabviewController,
        children: [
          CourseDetailAboutItem(course: course),
          CourseDetailLessonsItem(course: course, isBought: _isBought),
          CourseDetailReviewsItem(course: course)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(
      BuildContext context, CourseModel course, bool isBought) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 12.v,
        ),
        decoration: AppDecoration.outlineGray9004.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
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
                  imagePath: ImageConstant.imgFavorite,
                ),
              ),
            ),
            isBought
                ? CustomElevatedButton(
                    width: 261.h,
                    text: "Continue Studying",
                    margin: EdgeInsets.only(bottom: 22.v),
                    buttonStyle: CustomButtonStyles.fillPrimary,
                    onPressed: () {
                      _showBottomSheet();
                    },
                  )
                : CustomElevatedButton(
                    width: 261.h,
                    text: "Buy \$${course.price.toString()}",
                    margin: EdgeInsets.only(bottom: 22.v),
                    buttonStyle: CustomButtonStyles.fillPrimary,
                    onPressed: () {
                      _navigateToCheckoutScreen(course.slug);
                    },
                  ),
          ],
        ),
      ),
    );
  }

  void _navigateToCheckoutScreen(String courseSlug) {
    Navigator.pushNamed(
      context,
      AppRoutes.checkoutScreen,
      arguments: courseSlug,
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<TopicModel>(
          future: _topicFuture,
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
              final TopicModel topic = snapshot.data!;
              // print(topic.slug);
              return ButtonSheetItem(course: topic);
            }
          },
        );
      },
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

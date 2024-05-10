import 'package:english_academy_mobile/data/model/CourseOfflineModel.dart';
import 'package:english_academy_mobile/presentation/profile_screen/widgets/profile_achievement_item.dart';
import 'package:english_academy_mobile/presentation/profile_screen/widgets/profile_infomation_item.dart';
import 'package:english_academy_mobile/presentation/profile_screen/widgets/profile_more.dart';
import 'package:english_academy_mobile/presentation/profile_screen/widgets/profile_progess_item.dart';
import 'package:english_academy_mobile/service/CourseOfflineService.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            children: [
              SizedBox(height: 32.v),
              _buildInformation(context),
              SizedBox(height: 16.v),
              _buildAchievement(context),
              SizedBox(height: 15.v),
              _buildProgress(context),
              SizedBox(height: 24.v),
              Divider(
                color: appTheme.blueGray100,
              ),
              SizedBox(height: 23.v),
              _buildCategory(context),
              SizedBox(height: 16.v),
              _buildContent(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 40.h,
      leadingWidth: 46.h,
      title: AppbarSubtitleOne(
        margin: EdgeInsets.only(left: 22.h),
        text: "Profile",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotificationGray900,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
          onTap: () {
            _navigateToProfileMoreScreen(context);
         },
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildInformation(BuildContext context) {
    return ProfileInfomationItem();
  }

  /// Section Widget
  Widget _buildAchievement(BuildContext context) {
    return ProfileAchivementItem();
  }

  /// Section Widget
  Widget _buildProgress(BuildContext context) {
    return ProfileProgessItem();
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    List<Map<String, dynamic>> contentList = [
      {
        "imagePath": ImageConstant.imgAllCourse,
        "text": "All",
        "decoration": AppDecoration.fillPrimary
      },
      {
        "imagePath": ImageConstant.imgMobileCourse,
        "text": "Online",
        "decoration": AppDecoration.fillGray10001
      },
      {
        "imagePath": ImageConstant.imgBookCourse,
        "text": "Offline",
        "decoration": AppDecoration.fillGray10001
      },
    ];

    return Wrap(
      runSpacing: 16.v,
      spacing: 16.h,
      children: contentList.map((content) {
        return Container(
          width: 90.h,
          padding: EdgeInsets.symmetric(
            vertical: 8.v,
          ),
          decoration: content["decoration"].copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: content["imagePath"],
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    color: appTheme.blueGray300,
                  ),
                  Text(
                    " ${content["text"]}",
                    style: CustomTextStyles.bodySmallBluegray300_1.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  /// Section Widget
  Widget _buildContent(BuildContext context) {
    void _navigateToCourseOfflineDetail(BuildContext context, String slug) {
      Navigator.pushNamed(context, AppRoutes.profileMyCourseDetailScreen,
          arguments: slug);
    }
    return FutureBuilder<List<CourseOfflineModel>>(
      future: CourseOfflineService.fetchCoursesOffline(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<CourseOfflineModel> courses = snapshot.data!;
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.v,
              );
            },
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final CourseOfflineModel course = courses[index];
              return GestureDetector(
                onTap: () {
                  _navigateToCourseOfflineDetail(context, course.slug);
                },
                child: Container(
                  padding: EdgeInsets.all(17.h),
                  decoration: AppDecoration.outlineGray100.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 51.h),
                        child: Row(
                          children: [
                            Container(
                              height: 66.adaptSize,
                              width: 66.adaptSize,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.h),
                                child: Image.network(
                                  course.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomElevatedButton(
                                    height: 20.v,
                                    width: 55.h,
                                    text: "UX Design",
                                    buttonTextStyle: theme.textTheme.labelSmall!,
                                  ),
                                  SizedBox(height: 3.v),
                                  SizedBox(
                                    width: 157.h,
                                    child: Text(
                                      course.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.titleSmall!.copyWith(
                                        height: 1.60,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Complete",
                            style: CustomTextStyles.labelLargeGray60001,
                          ),
                          Text(
                            "75%",
                            style: CustomTextStyles.labelLargeGray60001,
                          ),
                        ],
                      ),
                      SizedBox(height: 12.v),
                      Container(
                        height: 8.v,
                        width: 291.h,
                        decoration: BoxDecoration(
                          color: appTheme.gray100,
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
                            backgroundColor: appTheme.gray100,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            // child: Text('Error: ${snapshot.error}'),
            child: Text(''),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
  void _navigateToProfileMoreScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileMoreScreen()),
    );
  }
}

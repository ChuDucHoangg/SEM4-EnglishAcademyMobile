import 'package:english_academy_mobile/data/model/CourseOfflineModel.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_my_booking_screen/profile_my_booking_screen.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_my_course_screen/profile_my_course_list_screen.dart';
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
  int selectedTabIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 32.v),
              _buildInformation(context),
              SizedBox(height: 16.v),
              _buildAchievement(context),
              SizedBox(height: 15.v),
              _buildProgress(context),
              SizedBox(height: 15.v),
              Divider(
                color: appTheme.blueGray100,
              ),
              SizedBox(height: 15.v),
              _buildCategory(context),
              SizedBox(height: 16.v),
              _buildContent(context),
              SizedBox(height: 50.v),
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
        "icon": Icons.storage_outlined,
        "text": "My Course",
        "decoration": selectedTabIndex == 0
            ? AppDecoration.fillPrimary
            : AppDecoration.fillGray10001,
        "textColor":
            selectedTabIndex == 0 ? Colors.white : appTheme.blueGray500,
        "onTap": () {
          setState(() {
            selectedTabIndex = 0;
          });
        }
      },
      {
        "icon": Icons.people_outline_rounded,
        "text": "Booking",
        "decoration": selectedTabIndex == 1
            ? AppDecoration.fillPrimary
            : AppDecoration.fillGray10001,
        "textColor":
            selectedTabIndex == 1 ? Colors.white : appTheme.blueGray500,
        "onTap": () {
          setState(() {
            selectedTabIndex = 1;
          });
        }
      },
      {
        "icon": Icons.view_timeline_outlined,
        "text": "TimeTable",
        "decoration": selectedTabIndex == 2
            ? AppDecoration.fillPrimary
            : AppDecoration.fillGray10001,
        "textColor":
            selectedTabIndex == 2 ? Colors.white : appTheme.blueGray500,
        "onTap": () {
          setState(() {
            selectedTabIndex = 2;
          });
        }
      },
    ];

    return Wrap(
      runSpacing: 16.v,
      spacing: 16.h,
      children: contentList.map((content) {
        return GestureDetector(
          onTap: content["onTap"],
          child: Container(
            width: 95.h,
            padding: EdgeInsets.symmetric(
              vertical: 8.v,
            ),
            decoration: content["decoration"].copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Column(
              children: [
                Icon(
                  content["icon"],
                  color: content["textColor"],
                  size: 22.adaptSize,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  " ${content["text"]}",
                  style: CustomTextStyles.bodySmallBluegray300_1.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: content["textColor"],
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  /// Section Widget
  Widget _buildContent(BuildContext context) {
    switch (selectedTabIndex) {
      case 0:
        return ProfileMyCourseListScreen();
      case 1:
        return ProfileMyBookingListScreen();
      case 2:
        return Text("Tab TimeTable");
      default:
        return SizedBox.shrink();
    }
  }
}

import 'package:english_academy_mobile/data/model/CourseOfflineModel.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../service/CourseOfflineService.dart';

class ProfileMyCourseDetailScreen extends StatefulWidget {
  final String slug;

  const ProfileMyCourseDetailScreen({Key? key, required this.slug})
      : super(
          key: key,
        );

  @override
  ProfileMyCourseDetailScreenState createState() =>
      ProfileMyCourseDetailScreenState();
}

class ProfileMyCourseDetailScreenState
    extends State<ProfileMyCourseDetailScreen>
    with AutomaticKeepAliveClientMixin<ProfileMyCourseDetailScreen> {
  @override
  bool get wantKeepAlive => true;
  TextEditingController searchController = TextEditingController();
  late Future<CourseOfflineModel> _courseFuture;

  @override
  void initState() {
    super.initState();
    _courseFuture = CourseOfflineService.fetchCourseOfflineDetail(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CourseOfflineModel>(
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
            final CourseOfflineModel course = snapshot.data!;
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: _buildAppBar(context),
              body: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 4.v),
                  child: Column(
                    children: [
                      _buildSearchSubject(context, course),
                      SizedBox(height: 27.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text(
                            "Subjects in the course",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.v),
                      _buildContent(context, course),
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
      height: 50.v,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 16.v,
          bottom: 16.v,
        ),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarSubtitle(
        text: "My Course",
        margin: EdgeInsets.only(left: 10.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgGridGray90024x24,
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 16.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSearchSubject(BuildContext context, CourseOfflineModel course) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 32.v,
      ),
      decoration: AppDecoration.fillPrimary,
      child: Column(
        children: [
          SizedBox(height: 5.v),
          Text(
            course.name,
            style: CustomTextStyles.headlineMediumOnErrorContainer,
          ),
          SizedBox(height: 23.v),
          CustomSearchView(
            controller: searchController,
            hintText: "Search Subject",
            hintStyle: CustomTextStyles.bodyMediumBluegray300,
            contentPadding: EdgeInsets.only(
              top: 19.v,
              right: 30.h,
              bottom: 19.v,
            ),
            borderDecoration: SearchViewStyleHelper.fillOnErrorContainer,
            fillColor: theme.colorScheme.onErrorContainer.withOpacity(0.1),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContent(BuildContext context, CourseOfflineModel course) {
    void _navigateToSubjectSlot(BuildContext context, String slug) {
      Navigator.pushNamed(context, AppRoutes.profileSubjectSlotScreen,
          arguments: slug);
    }

    return Column(
      children: course.subjectList.map((subject) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 179.v,
              crossAxisCount: 1,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.h,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _navigateToSubjectSlot(context, subject['slug']);
                },
                child: Container(
                  padding: EdgeInsets.all(15.h),
                  decoration: AppDecoration.outlineBluegray501.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subject['name'],
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 10.v),
                      Container(
                        width: 500.h,
                        decoration: AppDecoration.outlineBluegray50,
                      ),
                      SizedBox(height: 15.v),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgBookCourse,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            color: Colors.grey[600],
                          ),
                          Text(
                            " Slot: ${subject['totalSlot']}",
                            style: CustomTextStyles.labelLargeGray60001,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.v),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgDateCourse,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            color: Colors.grey[600],
                          ),
                          Text(
                            " 20/04/2024 - 20/05/2024",
                            style: CustomTextStyles.labelLargeGray60001,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.v),
                      Container(
                        width: 500.h,
                        decoration: AppDecoration.outlineBluegray50,
                      ),
                      SizedBox(height: 10.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.people_outline_sharp,
                                color: Colors.grey[600],
                              ),
                              Text(
                                " 4 Students",
                                style: CustomTextStyles.labelLargeGray60001,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Learn More",
                                style: CustomTextStyles.labelLargeGray60001_1,
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.grey[600],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

import 'package:english_academy_mobile/data/model/CourseOfflineModel.dart';
import 'package:english_academy_mobile/service/CourseOfflineService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../widgets/custom_elevated_button.dart';

class ProfileMyCourseListScreen extends StatefulWidget {
  const ProfileMyCourseListScreen({Key? key})
      : super(
    key: key,
  );

  @override
  ProfileMyCourseListScreenState createState() => ProfileMyCourseListScreenState();
}

class ProfileMyCourseListScreenState extends State<ProfileMyCourseListScreen>
    with AutomaticKeepAliveClientMixin<ProfileMyCourseListScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
}

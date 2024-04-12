import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../data/model/CourseModel.dart';
import '../../../service/CourseService.dart';

class DataCourseItemWidget extends StatelessWidget {
  const DataCourseItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    void _navigateToCourseDetail(BuildContext context, String slug) {
      Navigator.pushNamed(context, AppRoutes.courseDetailScreen,
          arguments: slug);
    }

    return FutureBuilder<List<CourseModel>>(
      future: CourseService.fetchCourses(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<CourseModel> courses = snapshot.data!;
          return Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 208.v,
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.h,
              ),
              physics: BouncingScrollPhysics(),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final CourseModel course = courses[index];
                return Container(
                  padding: EdgeInsets.all(7.h),
                  decoration: AppDecoration.outlineGray100.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 96.v,
                        width: 139.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(6.h),
                            right: Radius.circular(6.h),
                          ),
                          child: Image.network(
                            course.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.v),
                      CustomElevatedButton(
                        height: 20.v,
                        width: 55.h,
                        text: "IELTS",
                        buttonTextStyle: theme.textTheme.labelSmall!,
                      ),
                      SizedBox(height: 9.v),
                      Container(
                        width: 127.h,
                        margin: EdgeInsets.only(left: 4.h),
                        child: Text(
                          course.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelLargeGray900_1.copyWith(
                            height: 1.60,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.v),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "\$${course.price.toString()}",
                              style: CustomTextStyles.labelLargeBlueA200,
                            ),
                            Container(
                              width: 36.h,
                              margin: EdgeInsets.only(left: 50.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgSignal,
                                    height: 12.adaptSize,
                                    width: 12.adaptSize,
                                    margin: EdgeInsets.symmetric(vertical: 1.v),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "${course.totalReview}",
                                      style: CustomTextStyles
                                          .labelLargeGray60001_1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.v),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

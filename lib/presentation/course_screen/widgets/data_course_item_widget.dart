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
    return FutureBuilder<List<CourseModel>>(
      future: CourseService.fetchCourses(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<CourseModel> courses = snapshot.data!;
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: 20.v,
              );
            },
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final CourseModel course = courses[index];
              return SizedBox(
                height: 142.v,
                width: 360.h,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8.v),
                        decoration: AppDecoration.outlineBlack9001.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder15,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 134.v,
                              width: 130.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(16.h),
                                ),
                                child: Image.network(
                                  course.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 14.h,
                                top: 15.v,
                                bottom: 18.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "IELTS",
                                    style: CustomTextStyles.labelLargeOrangeA700,
                                  ),
                                  SizedBox(height: 5.v),
                                  Text(
                                    course.name,
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 5.v),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgSignalAmberA20001,
                                        height: 12.adaptSize,
                                        width: 12.adaptSize,
                                        margin: EdgeInsets.only(top: 3.v),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.h,
                                          top: 3.v,
                                        ),
                                        child: Text(
                                          course.star.toString(),
                                          style: theme.textTheme.labelMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: Text(
                                          "|",
                                          style: CustomTextStyles.titleSmallBlack900,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 16.h,
                                          top: 3.v,
                                        ),
                                        child: Text(
                                          "${course.totalReview} Reviewer",
                                          style: theme.textTheme.labelMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14.v),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Price: ${course.price.toString()}",
                                      style: CustomTextStyles.labelLargeTeal700.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkGreen500,
                      height: 28.adaptSize,
                      width: 28.adaptSize,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 24.h),
                    ),
                  ],
                ),
              );
            },
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

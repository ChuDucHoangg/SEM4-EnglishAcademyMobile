import 'package:english_academy_mobile/presentation/course_screen/course_detail_screen/widgets/general_information_item_widget.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_detail_screen/widgets/more_information_item_widget.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:readmore/readmore.dart';

import '../../../data/model/CourseModel.dart';
import '../../../service/CourseService.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_outlined_button.dart';

class CourseDetailScreen extends StatefulWidget {
  final String slug;

  const CourseDetailScreen({Key? key, required this.slug}) : super(key: key);

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  late Future<CourseModel> _courseFuture;

  @override
  void initState() {
    super.initState();
    _courseFuture = CourseService.fetchCourseDetail(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CourseModel>(
        future: _courseFuture,
        builder: (context, snapshot)
    {
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
          body: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 107.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 745.v,
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 201.h,
                                vertical: 160.v,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.pinkAccent],
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: 50,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "IELTS",
                                          style:
                                          CustomTextStyles.labelLargeOrangeA700,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgSignalAmberA20001,
                                              height: 12.adaptSize,
                                              width: 12.adaptSize,
                                              margin: EdgeInsets.only(bottom: 2.v),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 3.h),
                                              child: Text(
                                                course.star.toString(),
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
                                        course.name,
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
                                            "21 Class",
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
                                            style:
                                            CustomTextStyles.titleSmallBlack900,
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
                                          '\$${course.price.toString()}',
                                          style: CustomTextStyles
                                              .titleLargeMulishPrimary,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 7.v),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomElevatedButton(
                                        height: 52.v,
                                        width: 180.h,
                                        text: "About",
                                        buttonStyle: CustomButtonStyles.outlineBlue,
                                        buttonTextStyle: CustomTextStyles
                                            .titleSmallJostBluegray900,
                                      ),
                                      CustomOutlinedButton(
                                        height: 52.v,
                                        width: 180.h,
                                        text: "Curriculcum",
                                        buttonStyle: CustomButtonStyles.outlineBlue,
                                        buttonTextStyle: CustomTextStyles
                                            .titleSmallJostBluegray900,
                                      ),
                                    ],
                                  ),
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
                                      style: CustomTextStyles.labelLargeGray500
                                          .copyWith(
                                        height: 1.46,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 17.v),
                                  SizedBox(
                                    width: 313.h,
                                    child: ReadMoreText(
                                      course.description,
                                      trimLines: 4,
                                      colorClickableText: theme.colorScheme.primary,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: "Read More",
                                      moreStyle: CustomTextStyles.labelLargeGray500
                                          .copyWith(
                                        height: 1.46,
                                      ),
                                      lessStyle: CustomTextStyles.labelLargeGray500
                                          .copyWith(
                                        height: 1.46,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 321.v,
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
                    ),
                    SizedBox(height: 25.v),
                    _buildMoreInformation(context),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: _buildFloatingActionButton(context),
        );
      }
    }
    );
  }

  /// Section Widget
  Widget _buildMoreInformation(BuildContext context) {
    return MoreInformationItemWidget();
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 23.5.h),
      child: Container(
        height: 60.v,
        width: 350.h,
        child: Stack(
          children: [
            Align(
              child: Container(
                height: 60.v,
                width: 350.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(
                    30.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black900.withOpacity(0.3),
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: Offset(
                        1,
                        2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 9.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Enroll Course - 55",
                      style: CustomTextStyles.titleMediumWhiteA700,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.h),
                      child: CustomIconButton(
                        height: 48.adaptSize,
                        width: 48.adaptSize,
                        padding: EdgeInsets.all(13.h),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgFill1Primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

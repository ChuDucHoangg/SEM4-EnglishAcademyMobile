import 'package:english_academy_mobile/presentation/course_screen/course_detail_screen/widgets/general_information_item_widget.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_detail_screen/widgets/more_information_item_widget.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../data/model/CourseModel.dart';
import '../../../service/CourseService.dart';

class CourseDetailScreen extends StatefulWidget {
  final String slug;

  const CourseDetailScreen({Key? key, required this.slug}) : super(key: key);

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  late Future<CourseModel> _courseFuture;
  bool _isFabVisible = true;
  double _fabTranslateY = 0.0;
  final double _fabHeight = 60.0;
  final double _fabHiddenOffset = 80.0;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _courseFuture = CourseService.fetchCourseDetail(widget.slug);

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isFabVisible) {
          setState(() {
            _isFabVisible = false;
            _fabTranslateY = _fabHeight + _fabHiddenOffset;
          });
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isFabVisible) {
          setState(() {
            _isFabVisible = true;
            _fabTranslateY = 0.0;
          });
        }
      }
    });
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
            appBar: AppBar(
              title: Text(course.name),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              toolbarHeight: 50,
            ),
            body: SizedBox(
              width: SizeUtils.width,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 107.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildGeneralInformation(context, course),
                      SizedBox(height: 25.v),
                      _buildMoreInformation(context, course),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              transform: Matrix4.translationValues(0.0, _fabTranslateY, 0.0),
              child: _isFabVisible ? _buildFloatingActionButton(context, course) : null,
            ),
          );
        }
      },
    );
  }

  /// Section Widget
  Widget _buildGeneralInformation(BuildContext context, CourseModel course) {
    return GeneralInformationItemWidget(course: course);
  }

  /// Section Widget
  Widget _buildMoreInformation(BuildContext context, CourseModel course) {
    return MoreInformationItemWidget(course: course);
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context, CourseModel course) {
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
                      "Enroll Course - \$${course.price.toString()}",
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

import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import '../../data/model/CourseModel.dart';
import '../../service/CourseService.dart';
import '../../widgets/custom_search_view.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> dropdownItemList = [];
  List<String> levelDropdownList = [
    "Basic",
    "Intermediate",
    "Advanced",
    "Expert"
  ];
  List<String> ratingDropdownList = [
    "No Star",
    "1 Star",
    "2 Star",
    "3 Star",
    "4 Star",
    "5 Star"
  ];
  String? selectedCategory;
  String? selectedLevel;
  String? selectedRating;
  String searchQuery = '';
  Future<List<CourseModel>>? futureCourses;

  @override
  void initState() {
    super.initState();
    futureCourses = CourseService.fetchCourses();
    futureCourses?.then((courses) {
      setState(() {
        dropdownItemList =
            courses.map((course) => course.categoryName).toSet().toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              child: Align(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 65.v),
                      CustomSearchView(
                        controller: searchController,
                        hintText: "Search",
                        hintStyle:
                            CustomTextStyles.bodyMediumBluegray300.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        autofocus: false,
                        borderDecoration:
                            SearchViewStyleHelper.outlineBlueGrayTL12,
                        filled: false,
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),
                      SizedBox(height: 10.v),
                      _buildTab(context),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            if (selectedCategory != null)
                              _buildChip(context, selectedCategory!, () {
                                setState(() {
                                  selectedCategory = null;
                                });
                              }),
                            SizedBox(
                              width: 8,
                            ),
                            if (selectedLevel != null)
                              _buildChip(context, selectedLevel!, () {
                                setState(() {
                                  selectedLevel = null;
                                });
                              }),
                            SizedBox(
                              width: 8,
                            ),
                            if (selectedRating != null)
                              _buildChip(context, selectedRating!, () {
                                setState(() {
                                  selectedRating = null;
                                });
                              }),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.v),
                      _buildTitle(context),
                      SizedBox(height: 12.v),
                      _buildData(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTab(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildDropdownButton(
            context,
            "Categories",
            dropdownItemList,
            selectedCategory,
            (newValue) {
              setState(() {
                selectedCategory = newValue;
              });
            },
          ),
          SizedBox(width: 8),
          _buildDropdownButton(
            context,
            "Levels",
            levelDropdownList,
            selectedLevel,
            (newValue) {
              setState(() {
                selectedLevel = newValue;
              });
            },
          ),
          SizedBox(width: 8),
          _buildDropdownButton(
            context,
            "Ratings",
            ratingDropdownList,
            selectedRating,
            (newValue) {
              setState(() {
                selectedRating = newValue;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(BuildContext context, String hintText,
      List<String> items, String? selectedValue, Function(String?) onChanged) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(13),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsets.only(left: 8.h, right: 2.h),
          hint: DefaultTextStyle(
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            child: Text(hintText),
          ),
          value: selectedValue,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChip(BuildContext context, String label, Function() onClose) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        decoration: AppDecoration.fillGray10001.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder16,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 13),
            ),
            SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                size: 17,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Popular courses",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgGridPrimary,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgMegaphone,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(left: 4.h),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildData(BuildContext context) {
    void _navigateToCourseDetail(BuildContext context, String slug) {
      Navigator.pushNamed(context, AppRoutes.courseDetailScreen,
          arguments: slug);
    }

    return Expanded(
      child: FutureBuilder<List<CourseModel>>(
          future: futureCourses,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<CourseModel> courses = snapshot.data!
                  .where((course) => course.name
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()))
                  .toList();

              final filteredCourses = courses.where((course) {
                bool matchesCategory = selectedCategory == null ||
                    course.categoryName == selectedCategory;
                bool matchesLevel = selectedLevel == null ||
                    _getLevelString(course.level) == selectedLevel;
                bool matchesRating = selectedRating == null ||
                    _getRatingString(course.star) == selectedRating;
                return matchesCategory && matchesLevel && matchesRating;
              }).toList();

              if (filteredCourses.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgAnxiety1,
                        height: 140.adaptSize,
                        width: 140.adaptSize,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'No courses match !!!',
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }

              return GridView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 208.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.h,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final CourseModel course = filteredCourses[index];
                  return GestureDetector(
                    onTap: () {
                      _navigateToCourseDetail(context, course.slug);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineGray90010.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                        color: Theme.of(context).colorScheme.primaryContainer,
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
                              child: CustomImageView(
                                imagePath: course.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 20),
                            decoration:
                                AppDecoration.outlinePrimaryContainer.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder5,
                            ),
                            child: Text(
                              course.categoryName,
                              style: CustomTextStyles.labelMediumPrimary,
                            ),
                          ),
                          SizedBox(height: 9.v),
                          Container(
                            width: 127.h,
                            margin: EdgeInsets.only(left: 4.h),
                            child: Text(
                              course.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  CustomTextStyles.labelLargeGray900_1.copyWith(
                                height: 1.60,
                                color: Theme.of(context).colorScheme.onPrimary,
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
                                        margin:
                                            EdgeInsets.symmetric(vertical: 1.v),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.h),
                                        child: Text(
                                          "${course.star.toString()}",
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
          }),
    );
  }

  String _getLevelString(int level) {
    switch (level) {
      case 1:
        return "Basic";
      case 2:
        return "Intermediate";
      case 3:
        return "Advanced";
      case 4:
        return "Expert";
      default:
        return "Unknown";
    }
  }

  String _getRatingString(double rating) {
    if (rating == 0) {
      return "No Star";
    } else if (rating == 1) {
      return "1 Star";
    } else if (rating == 2) {
      return "2 Star";
    } else if (rating == 3) {
      return "3 Star";
    } else if (rating == 4) {
      return "4 Star";
    } else if (rating == 5) {
      return "5 Star";
    }
    return "";
  }
}

import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_icon_button.dart';
import '../../entrance_test_screen/entrance_test_screen.dart';

class CategoryHomeScreen extends StatelessWidget {
  const CategoryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _categoryOption = [
      {
        "title": "Courses",
        "image": ImageConstant.imgBannerOnline,
      },
      {
        "title": "Learning",
        "image": ImageConstant.imgBannerLearning,
      },
      {
        "title": "Assessment",
        "image": ImageConstant.imgBannerAssessment,
      },
      {
        "title": "Tutoring",
        "image": ImageConstant.imgBannerTutoring,
      },
    ];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(bottom: 3.v),
                  child: Text(
                    "See more",
                    style: CustomTextStyles.titleSmallPrimaryMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.v),
        SizedBox(
          height: 105,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 27.h, right: 30.h),
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 25.h,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: _categoryOption.length,
            itemBuilder: (context, index) {
              final category = _categoryOption[index];
              return GestureDetector(
                onTap: () {
                  if (category['title'] == "Assessment") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EntranceTestScreen(),
                      ),
                    );
                  }
                },
                child: SizedBox(
                  child: Column(
                    children: [
                      CustomIconButton(
                        width: 56.adaptSize,
                        height: 56.adaptSize,
                        padding: EdgeInsets.all(11.h),
                        decoration: IconButtonStyleHelper.outlineBlueGray,
                        child: CustomImageView(
                          imagePath: category['image']!,
                        ),
                      ),
                      SizedBox(
                        height: 10.v,
                      ),
                      Text(
                        category['title']!,
                        style: CustomTextStyles.titleSmallGray60001Medium,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../tutor_screen/tutor_screen.dart';

class OutstandingTutorHomeScreen extends StatelessWidget {
  const OutstandingTutorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "OUTSTANDING TUTOR",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TutorScreen(),
                    ),
                  );
                },
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
        SizedBox(height: 10.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 81.v,
              crossAxisCount: 1,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.h,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(11.h),
                decoration: AppDecoration.outlineGray90010.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.h),
                      child: CustomImageView(
                        imagePath:
                        "https://images.pexels.com/photos/3830483/pexels-photo-3830483.jpeg",
                        height: 50.adaptSize,
                        width: 50.adaptSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(children: [
                      Container(
                        width: 207.h,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 5.v,
                            bottom: 8.v,
                          ),
                          child: Text(
                            "Nguyễn Phương Thảo",
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 207.h,
                        margin: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.h,
                                vertical: 4.v,
                              ),
                              decoration: AppDecoration.outlinePrimaryContainer
                                  .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder5,
                              ),
                              child: Center(
                                child: Text(
                                  "Basic",
                                  style: CustomTextStyles.labelMediumPrimary,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.h,
                                vertical: 4.v,
                              ),
                              decoration:
                              AppDecoration.outlineBlueGray.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder5,
                              ),
                              child: Center(
                                child: Text(
                                  "IELTS TEACHER",
                                  style: CustomTextStyles.labelMediumPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

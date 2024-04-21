import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/data/model/CourseModel.dart';

import '../../../theme/app_decoration.dart';

class CheckoutCourseOrderItem extends StatelessWidget {
  final CourseModel course;

  const CheckoutCourseOrderItem({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Text(
              "Order details",
              style: theme.textTheme.titleMedium,
            ),
          ),
        ),
        SizedBox(height: 15.v),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.h),
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 17.v,
          ),
          decoration: AppDecoration.outlineBluegray503.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Row(
            children: [
              Container(
                height: 56.v,
                width: 63.h,
                padding: EdgeInsets.symmetric(vertical: 6.v),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                  image: DecorationImage(
                    image: NetworkImage(course.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 204.h,
                        child: Text(
                          course.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelLargeGray900_1.copyWith(
                            height: 1.60,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        "Price: \$${course.price.toString()}",
                        style: CustomTextStyles.labelLargePrimary_1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

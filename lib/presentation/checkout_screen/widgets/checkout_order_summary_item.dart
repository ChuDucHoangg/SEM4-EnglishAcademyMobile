import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/data/model/CourseModel.dart';

import '../../../theme/app_decoration.dart';

class CheckoutOrderSummaryItem extends StatelessWidget {
  final CourseModel course;

  const CheckoutOrderSummaryItem({Key? key, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order summary",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 16.v),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillGray5002.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildItem(
                          context,
                          label: "Original price",
                          price: '\$${course.price.toString()}',
                        ),
                        _buildItem(
                          context,
                          label: "Payment fee",
                          price: "0.00",
                        ),
                        SizedBox(height: 16.v),
                        _buildItem(
                          context,
                          label: "Total buy",
                          price: '\$${course.price.toString()}',
                        ),
                        SizedBox(height: 12.v)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildItem(
    BuildContext context, {
    required String label,
    required String price,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.v),
      decoration: AppDecoration.outlineBluegray502,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              label,
              style: theme.textTheme.bodySmall!.copyWith(
                color: appTheme.gray60001,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              price,
              style: CustomTextStyles.bodySmallGray900.copyWith(
                color: appTheme.gray900,
              ),
            ),
          )
        ],
      ),
    );
  }
}

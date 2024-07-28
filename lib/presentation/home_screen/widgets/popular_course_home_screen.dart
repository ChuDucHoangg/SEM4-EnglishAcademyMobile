import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

class PopularCourseHomeScreen extends StatelessWidget {
  const PopularCourseHomeScreen({super.key});

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
                "Popular Course",
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
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 24.h, bottom: 5.h, top: 5.h),
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(11.h),
                    decoration: AppDecoration.outlineGray90010.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath:
                              "https://storage.googleapis.com/materials-elements/course/cover/UJl3gmScJYoAnX3PlC2uiC94ZB5tfKmu8yWAydcF.jpg",
                          height: 128.v,
                          width: 216.h,
                          radius: BorderRadius.circular(
                            8.h,
                          ),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 12.v),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.h,
                            vertical: 4.v,
                          ),
                          decoration: AppDecoration.outlineGray9009.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder5,
                          ),
                          child: Center(
                            child: Text(
                              "IELTS",
                              style: CustomTextStyles.labelMediumRedA200,
                            ),
                          ),
                        ),
                        SizedBox(height: 14.v),
                        Container(
                          width: 181.h,
                          margin: EdgeInsets.only(left: 4.h),
                          child: Text(
                            "Nền Tảng Toeic 300",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall!.copyWith(
                              height: 1.60,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        SizedBox(height: 11.v),
                        Container(
                          width: 207.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Row(
                            children: [
                              Text(
                                "30.00",
                                style: CustomTextStyles.titleSmallBlueA700,
                              ),
                              Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgSignal,
                                height: 13.adaptSize,
                                width: 13.adaptSize,
                                margin: EdgeInsets.only(top: 2.v),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "5.0 ",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                      TextSpan(
                                        text: "(1,0)",
                                        style:
                                            CustomTextStyles.bodySmallff6b7280,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.v),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.h),
                    padding: EdgeInsets.all(
                      12.h,
                    ),
                    decoration: AppDecoration.outlineGray90010.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath:
                              "https://storage.googleapis.com/materials-elements/course/cover/evRt4WBIIqV6svjGH7DraiY1wRpQRPjFBm2SzyKZ.jpg",
                          height: 128.v,
                          width: 216.h,
                          radius: BorderRadius.circular(
                            8.h,
                          ),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 12.v),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.h,
                            vertical: 4.v,
                          ),
                          decoration: AppDecoration.outlineGray9009.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder5,
                          ),
                          child: Center(
                            child: Text(
                              "TOEIC",
                              style: CustomTextStyles.labelMediumRedA200,
                            ),
                          ),
                        ),
                        SizedBox(height: 13.v),
                        Container(
                          width: 208.h,
                          margin: EdgeInsets.only(left: 4.h),
                          child: Text(
                            "Nền Tảng IELTS",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall!.copyWith(
                              height: 1.60,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        Container(
                          width: 208.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Row(
                            children: [
                              Text(
                                "45.00",
                                style: CustomTextStyles.titleSmallBlueA700,
                              ),
                              Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgSignal,
                                height: 13.adaptSize,
                                width: 13.adaptSize,
                                margin: EdgeInsets.symmetric(vertical: 3.v),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "0.0 ",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                      TextSpan(
                                        text: "(0,0)",
                                        style:
                                            CustomTextStyles.bodySmallff6b7280,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.v),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

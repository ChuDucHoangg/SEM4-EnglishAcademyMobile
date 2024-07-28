import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

class OurAppHomeScreen extends StatelessWidget {
  const OurAppHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 333.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our App",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(height: 17.v),
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
                          imagePath: ImageConstant.imgApp,
                          height: 140.v,
                          width: 303.h,
                          radius: BorderRadius.circular(
                            8.h,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        Row(
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
                                  "AppStore",
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
                              decoration: AppDecoration.outlinePrimaryContainer
                                  .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder5,
                              ),
                              child: Center(
                                child: Text(
                                  "Google Play",
                                  style: CustomTextStyles.labelMediumPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.v),
                        Container(
                          width: 295.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Text(
                            "Learn From Anywhere",
                            maxLines: null,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium!.copyWith(
                              height: 1.50,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Row(
                            children: [
                              Text(
                                "",
                                textAlign: TextAlign.right,
                                style: CustomTextStyles.titleMediumBlueA700,
                              ),
                              Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgSignal,
                                height: 13.adaptSize,
                                width: 13.adaptSize,
                                margin: EdgeInsets.symmetric(vertical: 6.v),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 4.h,
                                  top: 3.v,
                                  bottom: 3.v,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Visit Website",
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      )
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Container(
          //     height: 74.v,
          //     width: double.maxFinite,
          //     margin: EdgeInsets.only(top: 16.v),
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment(0.5, 0.09),
          //         end: Alignment(0.5, 0.92),
          //         colors: [
          //           theme.colorScheme.onErrorContainer.withOpacity(0),
          //           theme.colorScheme.onErrorContainer.withOpacity(0.7),
          //           theme.colorScheme.onErrorContainer.withOpacity(1)
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

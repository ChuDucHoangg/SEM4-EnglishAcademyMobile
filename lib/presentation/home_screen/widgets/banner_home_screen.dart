import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_search_view.dart';

class BannerHomeScreen extends StatelessWidget {
  const BannerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return SizedBox(
      height: 300.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 230.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Opacity(
            opacity: 0.4,
            child: CustomImageView(
              imagePath: ImageConstant.imgPattern,
              height: 153.v,
              width: 128.h,
              alignment: Alignment.topRight,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 30.v),
              child: CustomSearchView(
                width: 327.h,
                autofocus: false,
                controller: searchController,
                hintText: "What do you want to learn?",
                alignment: Alignment.topCenter,
                contentPadding: EdgeInsets.only(
                  right: 30.h,
                  bottom: 19.v,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Continue Learning",
                    style: CustomTextStyles.titleMediumOnErrorContainer_1,
                  ),
                  SizedBox(height: 16.v),
                  Container(
                    padding: EdgeInsets.all(18.h),
                    decoration: AppDecoration.outlineGray90010.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath:
                                  "https://storage.googleapis.com/materials-elements/course/cover/UJl3gmScJYoAnX3PlC2uiC94ZB5tfKmu8yWAydcF.jpg",
                              height: 66.adaptSize,
                              width: 66.adaptSize,
                              fit: BoxFit.cover,
                              radius: BorderRadius.circular(
                                8.h,
                              ),
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.h,
                                        vertical: 4.v,
                                      ),
                                      decoration: AppDecoration
                                          .outlinePrimaryContainer
                                          .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder5,
                                      ),
                                      child: Text(
                                        "IELTS",
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                    ),
                                    SizedBox(height: 3.v),
                                    SizedBox(
                                      width: 209.h,
                                      child: Text(
                                        "Nền Tảng Toiec 300",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.titleSmall!
                                            .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          height: 1.60,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Text("23 of 33 lessons",
                                  style: CustomTextStyles.labelLargeGray60001),
                            ),
                            Text(
                              "76% completed",
                              style: CustomTextStyles.labelLargeGray60001
                                  .copyWith(),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.v),
                        Container(
                          height: 8.v,
                          width: 291.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray100,
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                            child: LinearProgressIndicator(
                              value: 0.75,
                              backgroundColor: appTheme.gray100,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                theme.colorScheme.primary,
                              ),
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class MyLearningQuizResultsScreen extends StatelessWidget {
  const MyLearningQuizResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 50.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 14.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.h,
                  vertical: 20.v,
                ),
                decoration: AppDecoration.fillOnErrorContainer.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 14.v),
                    Text(
                      "Lesson Complete",
                      style: CustomTextStyles.labelLargeBluegray300,
                    ),
                    Container(
                      width: 206.h,
                      margin: EdgeInsets.symmetric(horizontal: 28.h),
                      child: Text(
                        "Congratulations! You Passed!",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge!.copyWith(
                          height: 1.35,
                        ),
                      ),
                    ),
                    SizedBox(height: 23.v),
                    SizedBox(
                      height: 166.adaptSize,
                      width: 166.adaptSize,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 166.adaptSize,
                            width: 166.adaptSize,
                            child: CircularProgressIndicator(
                              value: 1.0, // Sửa giá trị value thành 1.0
                              backgroundColor: theme.colorScheme.onErrorContainer.withOpacity(1),
                              color: theme.colorScheme.onErrorContainer.withOpacity(1),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 61.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "75%",
                                  style: theme.textTheme.titleLarge,
                                ),
                                SizedBox(height: 2.v),
                                Text(
                                  "Grades",
                                  style: CustomTextStyles.bodySmallBluegray300_1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.v),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 12.adaptSize,
                                width: 12.adaptSize,
                                margin: EdgeInsets.only(
                                  top: 1.v,
                                  bottom: 3.v,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(
                                    6.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text(
                                  "Right Answer",
                                  style: CustomTextStyles
                                      .titleSmallGray60001Medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "8",
                          style: CustomTextStyles.titleSmallGray60001Medium,
                        ),
                      ],
                    ),
                    SizedBox(height: 11.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 12.adaptSize,
                              width: 12.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 2.v),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(
                                  6.h,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text(
                                "Mistakes",
                                style:
                                CustomTextStyles.titleSmallGray60001Medium,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "2",
                          style: CustomTextStyles.titleSmallGray60001Medium,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text(
                            "Point earned",
                            style: CustomTextStyles.titleSmallBluegray80001,
                          ),
                        ),
                        Text(
                          "120 points",
                          style: CustomTextStyles.titleSmallBluegray80001,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 56.v),
              CustomElevatedButton(
                text: "Try Again",
                buttonStyle: CustomButtonStyles.fillPrimary,
              ),
              SizedBox(height: 12.v),
              CustomOutlinedButton(
                text: "View Details",
                buttonStyle: CustomButtonStyles.outlineOnErrorContainer,
                buttonTextStyle:
                CustomTextStyles.titleMediumOnErrorContainer_1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
        margin: EdgeInsets.only(left: 22.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgShareTwoOnerrorcontainer,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        ),
      ],
    );
  }
}

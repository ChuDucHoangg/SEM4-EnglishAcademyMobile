import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_image.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar_home_screen.dart';
import 'package:english_academy_mobile/theme/theme_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  _buildWebsite(context),
                  SizedBox(height: 19.v),
                  _buildTitle(context),
                  SizedBox(height: 12.v),
                  _buildFinance(context),
                  SizedBox(height: 19.v),
                  _buildTitle(context),
                  SizedBox(height: 19.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 61.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.h,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(11.h),
                          decoration: AppDecoration.outlineGray100.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 36.adaptSize,
                                width: 36.adaptSize,
                                padding: EdgeInsets.all(6.h),
                                decoration: AppDecoration.fillIndigo.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                ),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgImage5,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16.h,
                                  top: 10.v,
                                  bottom: 8.v,
                                ),
                                child: Text(
                                  "Design",
                                  style: theme.textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 19.v),
                  _buildTitle(context),
                  SizedBox(height: 19.v),
                  _buildFinance(context),
                  SizedBox(height: 19.v),
                  _buildUXDesign(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBarHomeScreen(
      height: 50.v,
      title: Padding(
        padding: EdgeInsets.only(left: 24.h),
        child: Column(
          children: [
            AppbarSubtitleTwo(
              text: "Welcome, Jason 👋",
              margin: EdgeInsets.only(right: 63.h),
            ),
            SizedBox(height: 9.v),
            AppbarSubtitleFive(
              text: "Upgrade your skill for better futures!",
            ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(24.h, 5.v, 24.h, 6.v),
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 4.v,
          ),
          decoration: AppDecoration.outlineBluegray30002.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppbarImage(
                imagePath: ImageConstant.imgContrast,
              ),
              AppbarImage(
                imagePath: ImageConstant.imgNotification,
                margin: EdgeInsets.only(left: 16.h),
              ),
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 1.v,
              //     right: 1.h,
              //     bottom: 13.v,
              //   ),
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 3.h,
              //     vertical: 2.v,
              //   ),
              //   decoration: AppDecoration.outlineBluegray80001.copyWith(
              //     borderRadius: BorderRadiusStyle.circleBorder5,
              //   ),
              //   child: Column(
              //     children: [
              //       SizedBox(height: 1.v),
              //       AppbarImage(
              //         imagePath: ImageConstant.imgDescription,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildWebsite(BuildContext context) {
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
                    decoration: AppDecoration.outlineGray.copyWith(
                      // color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgImage,
                              height: 66.adaptSize,
                              width: 66.adaptSize,
                              radius: BorderRadius.circular(
                                8.h,
                              ),
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomElevatedButton(
                                      height: 20.v,
                                      width: 46.h,
                                      text: "Website",
                                      buttonStyle:
                                          CustomButtonStyles.outlineGrayTL4,
                                      buttonTextStyle:
                                          CustomTextStyles.labelSmallAmberA200,
                                    ),
                                    SizedBox(height: 3.v),
                                    SizedBox(
                                      width: 209.h,
                                      child: Text(
                                        "Fundamentals of HTML & CSS From Scratch",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.titleSmall!
                                            .copyWith(
                                          // color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                              child: Text(
                                "23 of 33 lessons",
                                style: CustomTextStyles.labelLargeGray60001.copyWith(
                                    // color: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                            Text(
                              "75% completed",
                              style: CustomTextStyles.labelLargeGray60001.copyWith(
                                // color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
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

  /// Section Widget
  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recently added",
            style: theme.textTheme.titleMedium,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3.v),
            child: Text(
              "See more",
              style: CustomTextStyles.titleSmallPrimaryMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFinance(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 24.h),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(11.h),
                decoration: AppDecoration.outlineGray100.copyWith(// Thay đổi màu nền ở đây
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage128x216,
                      height: 128.v,
                      width: 216.h,
                      radius: BorderRadius.circular(
                        8.h,
                      ),
                    ),
                    SizedBox(height: 12.v),
                    CustomElevatedButton(
                      height: 24.v,
                      width: 60.h,
                      text: "Finance",
                      buttonStyle: CustomButtonStyles.outlineGrayTL5,
                      buttonTextStyle: CustomTextStyles.labelMediumRedA200,
                    ),
                    SizedBox(height: 14.v),
                    Container(
                      width: 181.h,
                      margin: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "The Complete Investment Banking Course 2023",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall!.copyWith(
                          height: 1.60,
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
                            "120.00",
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
                                    text: "4.8 ",
                                    style: theme.textTheme.labelLarge,
                                  ),
                                  TextSpan(
                                    text: "(31,882)",
                                    style: CustomTextStyles.bodySmallff6b7280,
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
                padding: EdgeInsets.all(12.h),
                decoration: AppDecoration.outlineGray900.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage1,
                      height: 128.v,
                      width: 216.h,
                      radius: BorderRadius.circular(
                        8.h,
                      ),
                    ),
                    SizedBox(height: 12.v),
                    CustomElevatedButton(
                      height: 24.v,
                      width: 60.h,
                      text: "Finance",
                      buttonStyle: CustomButtonStyles.outlineGrayTL5,
                      buttonTextStyle: CustomTextStyles.labelMediumRedA200,
                    ),
                    SizedBox(height: 13.v),
                    Container(
                      width: 208.h,
                      margin: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "Guide to Integrate API in Back End Development",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall!.copyWith(
                          height: 1.60,
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
                            "96.00",
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
                                    text: "4.8 ",
                                    style: theme.textTheme.labelLarge,
                                  ),
                                  TextSpan(
                                    text: "(31,882)",
                                    style: CustomTextStyles.bodySmallff6b7280,
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
    );
  }

  /// Section Widget
  Widget _buildUXDesign(BuildContext context) {
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
                    "Featured course",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 17.v),
                  Container(
                    padding: EdgeInsets.all(11.h),
                    decoration: AppDecoration.outlineGray100.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage140x303,
                          height: 140.v,
                          width: 303.h,
                          radius: BorderRadius.circular(
                            8.h,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        CustomElevatedButton(
                          height: 24.v,
                          width: 73.h,
                          text: "UX Design",
                          buttonTextStyle:
                          CustomTextStyles.labelMediumGreenA400,
                        ),
                        SizedBox(height: 12.v),
                        Container(
                          width: 295.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Text(
                            "Complete Web Design: From Figma to Webflow",
                            maxLines: null,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium!.copyWith(
                              height: 1.50,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Row(
                            children: [
                              Text(
                                "98.00",
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
                                        text: "4.",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                      TextSpan(
                                        text: "7",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                      TextSpan(
                                        text: " ",
                                      ),
                                      TextSpan(
                                        text: "(12,657)",
                                        style:
                                        CustomTextStyles.bodySmallff6b7280,
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
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 74.v,
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 16.v),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.5, 0.09),
                  end: Alignment(0.5, 0.92),
                  colors: [
                    theme.colorScheme.onErrorContainer.withOpacity(0),
                    theme.colorScheme.onErrorContainer.withOpacity(0.7),
                    theme.colorScheme.onErrorContainer.withOpacity(1)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

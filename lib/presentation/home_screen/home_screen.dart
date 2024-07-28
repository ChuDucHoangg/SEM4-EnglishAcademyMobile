import 'dart:convert';

import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_image.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/widgets.dart';
import '../../data/model/profileModel.dart';
import '../../service/AuthService.dart';
import '../../service/profileService.dart';
import '../../widgets/app_bar/custom_app_bar_home_screen.dart';
import 'package:english_academy_mobile/theme/theme_helper.dart';

import '../tutor_screen/tutor_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String studentNameFromToken = '';

  @override
  void initState() {
    super.initState();
    _getStudentInfo();
  }

  void _getStudentInfo() async {
    try {
      final String token = await AuthService.getToken();
      final List<String> parts = token.split(".");
      final String normalizedToken = base64Url.normalize(parts[1]);
      final String decodedToken =
          utf8.decode(base64Url.decode(normalizedToken));

      final Map<String, dynamic> tokenData = json.decode(decodedToken);

      setState(() {
        studentNameFromToken = tokenData['Fullname'].toString();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  TextEditingController searchController = TextEditingController();

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Column(
            children: [
              Column(
                children: [
                  _buildWebsite(context),
                  SizedBox(height: 19.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Course Category",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => TutorScreen(),
                            //   ),
                            // );
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
                        return SizedBox(
                          child: Column(
                            children: [
                              CustomIconButton(
                                width: 56.adaptSize,
                                height: 56.adaptSize,
                                padding: EdgeInsets.all(11.h),
                                decoration:
                                    IconButtonStyleHelper.outlineBlueGray,
                                child: CustomImageView(
                                  imagePath: category['image']!,
                                ),
                              ),
                              SizedBox(
                                height: 10.v,
                              ),
                              Text(
                                category['title']!,
                                style:
                                    CustomTextStyles.titleSmallGray60001Medium,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12.v),
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
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => TutorScreen(),
                            //   ),
                            // );
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
                  _buildFinance(context),
                  SizedBox(height: 19.v),
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
                  SizedBox(height: 19.v),
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
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
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
                                      style:
                                          theme.textTheme.titleSmall?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 207.h,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.h,
                                          vertical: 4.v,
                                        ),
                                        decoration: AppDecoration
                                            .outlinePrimaryContainer
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder5,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Basic",
                                            style: CustomTextStyles
                                                .labelMediumPrimary,
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
                                        decoration: AppDecoration
                                            .outlineBlueGray
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder5,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "English 1",
                                            style: CustomTextStyles
                                                .labelMediumPrimary,
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
            Text(
              "Welcome, ${studentNameFromToken} 👋",
              style: CustomTextStyles.titleMediumOnErrorContainer_1.copyWith(
                color: theme.colorScheme.onErrorContainer.withOpacity(1),
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 9.v),
            Text(
              "Upgrade your skill for better futures !      ",
              style: CustomTextStyles.bodySmallBluegray30002.copyWith(
                color: appTheme.blueGray30002,
              ),
              textAlign: TextAlign.start,
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
              // AppbarImage(
              //   imagePath: ImageConstant.imgContrast,
              // ),
              AppbarImage(
                imagePath: ImageConstant.imgNotification,
                // margin: EdgeInsets.only(left: 16.h),
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
                              "75% completed",
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

  /// Section Widget
  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recently added",
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
    );
  }

  /// Section Widget
  Widget _buildFinance(BuildContext context) {
    return Align(
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

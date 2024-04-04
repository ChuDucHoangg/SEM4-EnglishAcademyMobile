import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class IndoxScreen extends StatelessWidget {
  const IndoxScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 2.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.h),
                  child: Container(
                    decoration: AppDecoration.fillGray,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            height: 48.v,
                            text: "Chat",
                            margin: EdgeInsets.only(right: 10.h),
                            buttonStyle: CustomButtonStyles.fillTeal,
                            buttonTextStyle:
                                CustomTextStyles.titleSmallWhiteA700ExtraBold,
                          ),
                        ),
                        Expanded(
                          child: CustomElevatedButton(
                            height: 48.v,
                            text: "Calls",
                            margin: EdgeInsets.only(left: 10.h),
                            buttonStyle: CustomButtonStyles.fillBlue,
                            buttonTextStyle: CustomTextStyles
                                .titleSmallBluegray900ExtraBold15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.v),
                SizedBox(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 34.h),
                          padding: EdgeInsets.symmetric(vertical: 7.v),
                          decoration: AppDecoration.outlineBlack9001.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 20.v),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,                                  children: [
                                    Container(
                                      height: 50.adaptSize,
                                      width: 50.adaptSize,
                                      margin: EdgeInsets.only(bottom: 21.v),
                                      decoration: BoxDecoration(
                                        color: appTheme.black900,
                                        borderRadius: BorderRadius.circular(
                                          25.h,
                                        ),
                                        border: Border.all(
                                          color: appTheme.blue50,
                                          width: 2.h,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.h,
                                        top: 7.v,
                                        bottom: 24.v,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Virginia M. Patterson",
                                            style: theme.textTheme.titleMedium,
                                          ),
                                          Text(
                                            "Hi, Good Evening Bro.!",
                                            style: theme.textTheme.labelLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: 2.h,
                                        bottom: 28.v,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 24.adaptSize,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5.h,
                                              vertical: 4.v,
                                            ),
                                            decoration: AppDecoration.outlineBlue501.copyWith(
                                              borderRadius: BorderRadiusStyle.roundedBorder12,
                                            ),
                                            child: Text(
                                              "03",
                                              style: CustomTextStyles.labelMediumWhiteA700,
                                            ),
                                          ),
                                          SizedBox(height: 5.v),
                                          Text(
                                            "14:59",
                                            style: CustomTextStyles.labelMediumGray700,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 20.v),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,                                  children: [
                                  Container(
                                    height: 50.adaptSize,
                                    width: 50.adaptSize,
                                    margin: EdgeInsets.only(bottom: 21.v),
                                    decoration: BoxDecoration(
                                      color: appTheme.black900,
                                      borderRadius: BorderRadius.circular(
                                        25.h,
                                      ),
                                      border: Border.all(
                                        color: appTheme.blue50,
                                        width: 2.h,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8.h,
                                      top: 7.v,
                                      bottom: 24.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Virginia M. Patterson",
                                          style: theme.textTheme.titleMedium,
                                        ),
                                        Text(
                                          "Hi, Good Evening Bro.!",
                                          style: theme.textTheme.labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 2.h,
                                      bottom: 28.v,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 24.adaptSize,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5.h,
                                            vertical: 4.v,
                                          ),
                                          decoration: AppDecoration.outlineBlue501.copyWith(
                                            borderRadius: BorderRadiusStyle.roundedBorder12,
                                          ),
                                          child: Text(
                                            "03",
                                            style: CustomTextStyles.labelMediumWhiteA700,
                                          ),
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "14:59",
                                          style: CustomTextStyles.labelMediumGray700,
                                        ),
                                      ],
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
                ),
              ],
            ),
          ),
        ]));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarSubtitle(
        text: "Indox",
        margin: EdgeInsets.only(left: 35.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgQrcodeBlueGray900,
          margin: EdgeInsets.fromLTRB(34.h, 21.v, 34.h, 14.v),
        ),
      ],
    );
  }
}

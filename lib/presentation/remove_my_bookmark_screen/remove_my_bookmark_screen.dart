import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class RemoveMyBookmarkScreen extends StatelessWidget {
  const RemoveMyBookmarkScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.blueGray900.withOpacity(0.88),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 525.v),
              _buildScrollView(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 31.v,
          ),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 43.h),
                child: Text(
                  "Remove From Bookmark?",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 23.v),
              Container(
                decoration: AppDecoration.outlineBlack9001.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder15,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 130.adaptSize,
                      width: 130.adaptSize,
                      decoration: BoxDecoration(
                        color: appTheme.black900,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(16.h),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14.h,
                        top: 15.v,
                        bottom: 18.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Graphic Design",
                            style: CustomTextStyles.labelLargeOrangeA700,
                          ),
                          SizedBox(height: 9.v),
                          Text(
                            "Advertisement Design",
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 2.v),
                          Row(
                            children: [
                              Text(
                                "42",
                                style:
                                CustomTextStyles.titleMediumMulishPrimary,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 5.h,
                                  top: 3.v,
                                ),
                                child: Text(
                                  "61",
                                  style: CustomTextStyles.labelLargeBluegray200
                                      .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.v),
                          Row(
                            children: [
                              Container(
                                width: 32.h,
                                margin: EdgeInsets.only(top: 3.v),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomImageView(
                                      imagePath:
                                      ImageConstant.imgSignalAmberA20001,
                                      height: 12.adaptSize,
                                      width: 12.adaptSize,
                                      margin: EdgeInsets.only(bottom: 2.v),
                                    ),
                                    Text(
                                      "3.9",
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16.h),
                                child: Text(
                                  "|",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16.h,
                                  top: 3.v,
                                ),
                                child: Text(
                                  "12680 Std",
                                  style: theme.textTheme.labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgBookmark,
                      width: 12.h,
                      margin: EdgeInsets.only(
                        left: 23.h,
                        top: 15.v,
                        bottom: 99.v,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOutlinedButton(
                    width: 140.h,
                    text: "Cancel",
                    buttonStyle: CustomButtonStyles.outlineBlueGray,
                  ),
                  CustomElevatedButton(
                    width: 206.h,
                    text: "Yes, Remove",
                  ),
                ],
              ),
              SizedBox(height: 30.v),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../../widgets/custom_outlined_button.dart';

class MoreInformationItemWidget extends StatelessWidget {
  const MoreInformationItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Instructor
          Padding(
            padding: EdgeInsets.only(left: 34.h),
            child: Text(
              "Instructor",
              style: CustomTextStyles.titleMedium18,
            ),
          ),
          SizedBox(height: 12.v),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImageBg,
                    height: 54.adaptSize,
                    width: 54.adaptSize,
                    radius: BorderRadius.circular(
                      27.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 7.v,
                      bottom: 4.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Nguyen",
                          style: CustomTextStyles.titleMedium17,
                        ),
                        Text(
                          "IELTS",
                          style: theme.textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgNavIndox,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    margin: EdgeInsets.only(
                      top: 19.v,
                      bottom: 15.v,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 21.v),

          //What you get
          Align(
            alignment: Alignment.center,
            child: Divider(
              indent: 34.h,
              endIndent: 34.h,
            ),
          ),
          SizedBox(height: 20.v),
          Padding(
            padding: EdgeInsets.only(left: 38.h),
            child: Text(
              "What You’ll Get",
              style: CustomTextStyles.titleMedium18,
            ),
          ),
          SizedBox(height: 20.v),
          Padding(
            padding: EdgeInsets.only(left: 38.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgReply,
                  width: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 2.v,
                  ),
                  child: Text(
                    "21 Lessons",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.v),
          Padding(
            padding: EdgeInsets.only(left: 34.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIcon,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                    top: 3.v,
                  ),
                  child: Text(
                    "3.0 Ielts Level",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.v),
          Padding(
            padding: EdgeInsets.only(left: 34.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIconGray90001,
                  height: 13.v,
                  margin: EdgeInsets.symmetric(vertical: 2.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    "Audio Book",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 27.v),
          Padding(
            padding: EdgeInsets.only(left: 34.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgUserGray90001,
                  width: 19.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.h,
                    top: 4.v,
                    bottom: 2.v,
                  ),
                  child: Text(
                    "Access All Content",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 31.v),
          Padding(
            padding: EdgeInsets.only(left: 34.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIconGray9000121x22,
                  height: 21.v,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 11.h,
                    top: 3.v,
                  ),
                  child: Text(
                    "10 Quizzes",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.v),
          Padding(
            padding: EdgeInsets.only(left: 38.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgReply,
                  width: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 3.v,
                  ),
                  child: Text(
                    "Certificate of Completion",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 29.v),

          //Reviews
          Align(
            alignment: Alignment.center,
            child: Divider(
              indent: 34.h,
              endIndent: 34.h,
            ),
          ),
          SizedBox(height: 25.v),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews",
                    style: CustomTextStyles.titleMedium18,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 6.v,
                      bottom: 4.v,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "See All".toUpperCase(),
                          style: CustomTextStyles.labelLargePrimary,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgArrowRightPrimary,
                          width: 5.h,
                          margin: EdgeInsets.only(
                            left: 10.h,
                            top: 2.v,
                            bottom: 3.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 19.v),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImageBg46x46,
                    height: 46.adaptSize,
                    width: 46.adaptSize,
                    radius: BorderRadius.circular(
                      23.h,
                    ),
                    margin: EdgeInsets.only(
                      top: 3.v,
                      bottom: 65.v,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 1.v),
                                child: Text(
                                  "William S. Cunningham",
                                  style: CustomTextStyles.titleMedium17,
                                ),
                              ),
                              CustomOutlinedButton(
                                height: 26.v,
                                width: 60.h,
                                text: "4.5",
                                leftIcon: Container(
                                  margin: EdgeInsets.only(right: 2.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgSignalAmber700,
                                    height: 12.adaptSize,
                                    width: 12.adaptSize,
                                  ),
                                ),
                                buttonTextStyle:
                                CustomTextStyles.labelLargeJostBluegray900,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.v),
                          Container(
                            width: 295.h,
                            margin: EdgeInsets.only(right: 5.h),
                            child: Text(
                              "The Course is Very Good dolor sit amet, consect tur adipiscing elit. Naturales divitias dixit parab les esse, quod parvo",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.labelLarge!.copyWith(
                                height: 1.38,
                              ),
                            ),
                          ),
                          SizedBox(height: 7.v),
                          Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgFavorite,
                                height: 16.v,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text(
                                  "578",
                                  style: CustomTextStyles.labelLargeBluegray900
                                      .copyWith(
                                    color: appTheme.blueGray900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 22.h),
                                child: Text(
                                  "2 Weeks Agos",
                                  style: CustomTextStyles.labelLargeBluegray900
                                      .copyWith(
                                    color: appTheme.blueGray900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 22.v),
          Align(
            alignment: Alignment.center,
            child: Divider(
              indent: 34.h,
              endIndent: 34.h,
            ),
          ),
        ],
      );
  }
  }
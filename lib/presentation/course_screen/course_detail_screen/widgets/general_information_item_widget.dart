import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:readmore/readmore.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../../../widgets/custom_outlined_button.dart';

class GeneralInformationItemWidget extends StatelessWidget {
  const GeneralInformationItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 745.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 201.h,
                vertical: 160.v,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.pinkAccent],
                ),
              ),
              child: Icon(
                Icons.arrow_back,
                size: 50,
                color: Colors.blue,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 34.h),
              padding: EdgeInsets.symmetric(vertical: 25.v),
              decoration: AppDecoration.outlineBlack9001.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 30.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 24.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "IELTS",
                          style: CustomTextStyles.labelLargeOrangeA700,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSignalAmberA20001,
                              height: 12.adaptSize,
                              width: 12.adaptSize,
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text(
                                "Star",
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        "Name Course",
                        style: CustomTextStyles.titleLarge20,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 24.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgUpload,
                          height: 19.adaptSize,
                          width: 19.adaptSize,
                          margin: EdgeInsets.only(
                            top: 4.v,
                            bottom: 3.v,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8.h,
                            top: 7.v,
                            bottom: 5.v,
                          ),
                          child: Text(
                            "21 Class",
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.h,
                            top: 7.v,
                          ),
                          child: Text(
                            "|",
                            style: CustomTextStyles.titleSmallBlack900,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgTime,
                          height: 19.adaptSize,
                          width: 19.adaptSize,
                          margin: EdgeInsets.only(
                              top: 4.v, bottom: 3.v, left: 10.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8.h,
                            top: 8.v,
                            bottom: 4.v,
                          ),
                          child: Text(
                            "42 Hours",
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Price: ",
                          style: CustomTextStyles.titleLargeMulishPrimary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButton(
                        height: 52.v,
                        width: 180.h,
                        text: "About",
                        buttonStyle: CustomButtonStyles.outlineBlue,
                        buttonTextStyle:
                            CustomTextStyles.titleSmallJostBluegray900,
                      ),
                      CustomOutlinedButton(
                        height: 52.v,
                        width: 180.h,
                        text: "Curriculcum",
                        buttonStyle: CustomButtonStyles.outlineBlue,
                        buttonTextStyle:
                            CustomTextStyles.titleSmallJostBluegray900,
                      ),
                    ],
                  ),
                  SizedBox(height: 17.v),
                  Container(
                    width: 307.h,
                    margin: EdgeInsets.only(
                      left: 20.h,
                      right: 31.h,
                    ),
                    child: Text(
                      "This course has been tested by many experts.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelLargeGray500.copyWith(
                        height: 1.46,
                      ),
                    ),
                  ),
                  SizedBox(height: 17.v),
                  SizedBox(
                    width: 313.h,
                    child: ReadMoreText(
                      "Description",
                      trimLines: 4,
                      colorClickableText: theme.colorScheme.primary,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "Read More",
                      moreStyle: CustomTextStyles.labelLargeGray500.copyWith(
                        height: 1.46,
                      ),
                      lessStyle: CustomTextStyles.labelLargeGray500.copyWith(
                        height: 1.46,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 321.v,
              right: 49.h,
            ),
            child: CustomIconButton(
              height: 63.adaptSize,
              width: 63.adaptSize,
              padding: EdgeInsets.all(18.h),
              decoration: IconButtonStyleHelper.outlineBlackTL31,
              alignment: Alignment.topRight,
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

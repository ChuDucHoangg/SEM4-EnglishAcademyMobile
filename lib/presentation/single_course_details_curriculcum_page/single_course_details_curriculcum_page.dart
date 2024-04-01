import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SingleCourseDetailsCurriculcumPage extends StatefulWidget {
  const SingleCourseDetailsCurriculcumPage({Key? key})
      : super(
    key: key,
  );

  @override
  SingleCourseDetailsCurriculcumPageState createState() =>
      SingleCourseDetailsCurriculcumPageState();
}

class SingleCourseDetailsCurriculcumPageState
    extends State<SingleCourseDetailsCurriculcumPage>
    with AutomaticKeepAliveClientMixin<SingleCourseDetailsCurriculcumPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: _buildScrollView(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 17.v),
          SizedBox(
            height: 263.v,
            width: 360.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25.h,
                          right: 29.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Section 01 - ",
                                    style:
                                    CustomTextStyles.titleSmallJostff202244,
                                  ),
                                  TextSpan(
                                    text: "Introducation",
                                    style:
                                    CustomTextStyles.titleSmallJostff0961f5,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.v),
                              child: Text(
                                "25 Mins",
                                style: CustomTextStyles.labelLargePrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 21.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25.h,
                          right: 30.h,
                        ),
                        child: _buildCircle(
                          context,
                          circle: "01",
                          setupYourGraphic: "Why Using Graphic De..",
                          time: "15 Mins",
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Divider(),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25.h,
                          right: 30.h,
                        ),
                        child: _buildCircle(
                          context,
                          circle: "02",
                          setupYourGraphic: "Setup Your Graphic De..",
                          time: "10 Mins",
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Divider(),
                      SizedBox(height: 26.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25.h,
                          right: 30.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Section 02 - ",
                                    style:
                                    CustomTextStyles.titleSmallJostff202244,
                                  ),
                                  TextSpan(
                                    text: "Graphic Design",
                                    style:
                                    CustomTextStyles.titleSmallJostff0961f5,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 3.v),
                              child: Text(
                                "55 Mins",
                                style: CustomTextStyles.labelLargePrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  width: 350.h,
                  text: "Enroll Course - 55",
                  rightIcon: Container(
                    padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
                    margin: EdgeInsets.only(left: 30.h),
                    decoration: BoxDecoration(
                      color: appTheme.whiteA700,
                      borderRadius: BorderRadius.circular(
                        24.h,
                      ),
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgFill1Primary,
                      height: 17.v,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildCircle(
      BuildContext context, {
        required String circle,
        required String setupYourGraphic,
        required String time,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 46.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder22,
          ),
          child: Text(
            circle,
            style: CustomTextStyles.titleSmallJostBluegray900SemiBold.copyWith(
              color: appTheme.blueGray900,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 6.h,
            top: 4.v,
            bottom: 2.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                setupYourGraphic,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: appTheme.blueGray900,
                ),
              ),
              Text(
                time,
                style: theme.textTheme.labelLarge!.copyWith(
                  color: appTheme.gray700,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.v),
          child: CustomIconButton(
            height: 18.adaptSize,
            width: 18.adaptSize,
            child: CustomImageView(),
          ),
        ),
      ],
    );
  }
}

import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';

class ProfileAchivementItem extends StatefulWidget {
  const ProfileAchivementItem({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileAchivementItemState createState() => ProfileAchivementItemState();
}

class ProfileAchivementItemState extends State<ProfileAchivementItem>
    with AutomaticKeepAliveClientMixin<ProfileAchivementItem> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.fillGreen.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMusic,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.h,
                      top: 2.v,
                      bottom: 1.v,
                    ),
                    child: Text(
                      "1",
                      style: CustomTextStyles.titleMediumGreenA400,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.v),
              Text(
                "Course Completed",
                style: CustomTextStyles.labelLargeGray60001_1,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 40.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.fillYellow.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgUserAmberA200,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.h,
                      top: 2.v,
                      bottom: 1.v,
                    ),
                    child: Text(
                      "4",
                      style: CustomTextStyles.titleMediumAmberA200,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.v),
              Text(
                "Days Streak",
                style: CustomTextStyles.labelLargeGray60001_1,
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';

class ProfileInfomationItem extends StatefulWidget {
  const ProfileInfomationItem({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileInfomationItemState createState() => ProfileInfomationItemState();
}

class ProfileInfomationItemState extends State<ProfileInfomationItem>
    with AutomaticKeepAliveClientMixin<ProfileInfomationItem> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillGray5002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAvatar9,
            height: 48.adaptSize,
            width: 48.adaptSize,
            radius: BorderRadius.circular(
              24.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 9.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              top: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jason Mark",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 9.v),
                Text(
                  "jasonmark@mail.com",
                  style: CustomTextStyles.bodySmallBluegray300_1,
                ),
                SizedBox(height: 7.v),
                Text(
                  "UI/UX, Development, Finance",
                  style: CustomTextStyles.labelLargeBluegray500,
                )
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgSearchBlueGray300,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 21.v),
          )
        ],
      ),
    );
  }
}

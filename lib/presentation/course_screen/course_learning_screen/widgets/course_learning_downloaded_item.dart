import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CourseLearningDownloadedItem extends StatefulWidget {
  const CourseLearningDownloadedItem({Key? key})
      : super(
          key: key,
        );

  @override
  CourseLearningDownloadedItemState createState() =>
      CourseLearningDownloadedItemState();
}

class CourseLearningDownloadedItemState
    extends State<CourseLearningDownloadedItem>
    with AutomaticKeepAliveClientMixin<CourseLearningDownloadedItem> {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollView(context),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              bottom: 12.v,
            ),
            child: Column(
              children: [
                Text(
                  "IELTS",
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: appTheme.gray900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 17.v,
            ),
            decoration: AppDecoration.outlineBluegray501.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  padding: EdgeInsets.all(4.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgOverflowMenu,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 2.v,
                  ),
                  child: Text(
                    "Wrong Rules",
                    style: CustomTextStyles.titleSmallMedium,
                  ),
                ),
                Spacer(),
                Text(
                  "03:47",
                  style: CustomTextStyles.titleSmallBluegray300,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgThumbsUpPrimary,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(left: 12.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

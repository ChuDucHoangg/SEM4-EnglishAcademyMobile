import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'widgets/grid_item_widget.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 33.h,
            vertical: 25.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today",
                style: CustomTextStyles.titleMediumBold,
              ),
              SizedBox(height: 18.v),
              _buildGrid(context),
              SizedBox(height: 30.v),
              _buildYesterday(context),
              SizedBox(height: 30.v),
              Text(
                "Nov 20, 2022",
                style: CustomTextStyles.titleMediumBold,
              ),
              SizedBox(height: 18.v),
              _buildOne(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 35.h,
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Notifications",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildGrid(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
          context,
          index,
          ) {
        return SizedBox(
          height: 12.v,
        );
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return GridItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildYesterday(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Yesterday",
          style: CustomTextStyles.titleMediumBold,
        ),
        SizedBox(height: 18.v),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 15.v,
          ),
          decoration: AppDecoration.outlineBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder18,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.v),
                child: CustomIconButton(
                  height: 52.adaptSize,
                  width: 52.adaptSize,
                  padding: EdgeInsets.all(14.h),
                  decoration: IconButtonStyleHelper.outlineBlackTL26,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavTransaction,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  bottom: 12.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Credit Card Connected.!",
                      style: CustomTextStyles.titleLarge20,
                    ),
                    SizedBox(height: 5.v),
                    Text(
                      "Credit Card has been Linked.!",
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder18,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.v),
            child: CustomIconButton(
              height: 52.adaptSize,
              width: 52.adaptSize,
              padding: EdgeInsets.all(16.h),
              decoration: IconButtonStyleHelper.outlineBlackTL26,
              child: CustomImageView(
                imagePath: ImageConstant.imgLockPrimarycontainer,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 7.h,
                bottom: 10.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Setup Successful.!",
                    style: CustomTextStyles.titleLarge20,
                  ),
                  SizedBox(height: 3.v),
                  Text(
                    "Your Account has been Created.",
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

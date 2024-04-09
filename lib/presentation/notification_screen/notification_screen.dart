import 'widgets/menu1_item_widget.dart';
import 'widgets/list5_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray5002,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            _buildFortySix(context),
            SizedBox(height: 20.v),
            _buildList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFrameSeventyThree(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notifications",
            style: theme.textTheme.titleMedium,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgNotificationGray900,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFortySix(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.v),
      decoration: AppDecoration.fillOnErrorContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40.v),
          _buildFrameSeventyThree(context),
          SizedBox(height: 32.v),
          SizedBox(
            height: 77.v,
            child: ListView.separated(
              padding: EdgeInsets.only(
                left: 25.h,
                right: 34.h,
              ),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 28.h,
                );
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return Menu1ItemWidget();
              },
            ),
          ),
          SizedBox(height: 4.v)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return List5ItemWidget();
          },
        ),
      ),
    );
  }
}

import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/paid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore_for_file: must_be_immutable
class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 17.v),
            child: Container(
              height: 832.v,
              width: 360.h,
              margin: EdgeInsets.symmetric(horizontal: 34.h),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: AppDecoration.fillGray,
                      child: _buildPaid(context),
                    ),
                  ),
                  _buildSix(context),
                ],
              ),
            ),
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
        text: "Transactions",
        margin: EdgeInsets.only(left: 12.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgQrcodeBlueGray900,
          margin: EdgeInsets.fromLTRB(34.h, 20.v, 34.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildPaid(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
          context,
          index,
          ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.5.v),
          child: SizedBox(
            width: 360.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.blue50,
            ),
          ),
        );
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return PaidItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildSix(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Row(
              children: [
                Container(
                  height: 92.adaptSize,
                  width: 92.adaptSize,
                  decoration: BoxDecoration(
                    color: appTheme.black900,
                    borderRadius: BorderRadius.circular(
                      18.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                    top: 5.v,
                    bottom: 3.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Exporting Assets",
                        style: CustomTextStyles.titleMedium18,
                      ),
                      SizedBox(height: 4.v),
                      Text(
                        "SEO & Marketing",
                        style: theme.textTheme.labelLarge,
                      ),
                      SizedBox(height: 12.v),
                      Container(
                        width: 60.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 17.h,
                          vertical: 2.v,
                        ),
                        decoration: AppDecoration.outlineTeal700.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder4,
                        ),
                        child: Text(
                          "Paid",
                          style: CustomTextStyles.labelLargeWhiteA70012,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.v),
          Divider(),
        ],
      ),
    );
  }
}

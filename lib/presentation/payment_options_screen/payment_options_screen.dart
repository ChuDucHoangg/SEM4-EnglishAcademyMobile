import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class PaymentOptionsScreen extends StatelessWidget {
  PaymentOptionsScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController oneController = TextEditingController();

  TextEditingController twoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 16.v,
          ),
          child: Column(
            children: [
              CustomTextFormField(
                controller: oneController,
                hintText: "Connected",
                hintStyle: CustomTextStyles.titleSmallTeal700,
                borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
              ),
              SizedBox(height: 20.v),
              CustomTextFormField(
                controller: twoController,
                hintText: "Connected",
                hintStyle: CustomTextStyles.titleSmallTeal700,
                textInputAction: TextInputAction.done,
                borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
              ),
              SizedBox(height: 20.v),
              _buildThree(context),
              SizedBox(height: 20.v),
              _buildFour(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildAddNewCard(context),
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
          top: 17.v,
          bottom: 18.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Payment Option",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildThree(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Text(
        "Connected",
        style: CustomTextStyles.titleSmallTeal700,
      ),
    );
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 50.h),
            child: Text(
              "**** ****  **76  3054",
              style: CustomTextStyles.titleSmallBluegray900ExtraBold,
            ),
          ),
          Text(
            "Connected",
            style: CustomTextStyles.titleSmallTeal700,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAddNewCard(BuildContext context) {
    return CustomElevatedButton(
      text: "Add New Card",
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 42.v,
      ),
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
    );
  }
}

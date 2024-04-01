import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class AddNewCardScreen extends StatelessWidget {
  AddNewCardScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController belindaCCullenController = TextEditingController();

  TextEditingController group115Controller = TextEditingController();

  TextEditingController languageController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 34.h,
                  vertical: 17.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCARD(context),
                    SizedBox(height: 30.v),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        "Card Name*",
                        style: CustomTextStyles.titleSmallBluegray900ExtraBold,
                      ),
                    ),
                    SizedBox(height: 8.v),
                    _buildBelindaCCullen(context),
                    SizedBox(height: 19.v),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        "Card Number*",
                        style: CustomTextStyles.titleSmallBluegray900ExtraBold,
                      ),
                    ),
                    SizedBox(height: 8.v),
                    _buildGroup115(context),
                    SizedBox(height: 19.v),
                    _buildLanguage1(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
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
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Add New Card",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildCARD(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 15.v,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgCard,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 11.v),
          CustomImageView(
            imagePath: ImageConstant.imgGridWhiteA700,
            height: 22.v,
            margin: EdgeInsets.only(left: 2.h),
          ),
          SizedBox(height: 37.v),
          Text(
            "1234  5678  8765  0876",
            style: CustomTextStyles.titleMediumMulishWhiteA700,
          ),
          SizedBox(height: 7.v),
          Row(
            children: [
              SizedBox(
                width: 25.h,
                child: Text(
                  "Valid\nThru".toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelSmallWhiteA700,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: Text(
                  "12/28",
                  style: CustomTextStyles.titleSmallWhiteA700,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.v),
          Text(
            "Timmy C. Hernandez".toUpperCase(),
            style: CustomTextStyles.titleSmallWhiteA700ExtraBold_1,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBelindaCCullen(BuildContext context) {
    return CustomTextFormField(
      controller: belindaCCullenController,
      hintText: "Belinda C. Cullen",
    );
  }

  /// Section Widget
  Widget _buildGroup115(BuildContext context) {
    return CustomTextFormField(
      controller: group115Controller,
      hintText: "****  **65  8765  3456",
      hintStyle: CustomTextStyles.titleSmallBlack900ExtraBold,
    );
  }

  /// Section Widget
  Widget _buildLanguage(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      controller: languageController,
      hintText: "***",
      hintStyle: CustomTextStyles.titleSmallBlack900ExtraBold,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildLanguage1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "Expiry Date*",
                  style: CustomTextStyles.titleSmallBluegray900ExtraBold,
                ),
              ),
              SizedBox(height: 6.v),
              Container(
                width: 180.h,
                padding: EdgeInsets.all(20.h),
                decoration: AppDecoration.outlineBlack900.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Text(
                  "12/28",
                  style: CustomTextStyles.titleSmallBlack900ExtraBold,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "CVV*",
                style: CustomTextStyles.titleSmallBluegray900ExtraBold,
              ),
            ),
            SizedBox(height: 8.v),
            _buildLanguage(context),
          ],
        ),
      ],
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

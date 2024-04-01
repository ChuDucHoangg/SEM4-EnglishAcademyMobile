import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
import 'package:english_academy_mobile/widgets/custom_phone_number.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:english_academy_mobile/widgets/custom_drop_down.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class EditProfilesScreen extends StatelessWidget {
  EditProfilesScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('91');

  TextEditingController phoneNumberController = TextEditingController();

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 13.v),
            child: Container(
              margin: EdgeInsets.only(
                left: 34.h,
                right: 34.h,
                bottom: 5.v,
              ),
              decoration: AppDecoration.fillGray,
              child: Column(
                children: [
                  SizedBox(
                    height: 91.v,
                    width: 90.h,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 90.adaptSize,
                            width: 90.adaptSize,
                            decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadius.circular(
                                45.h,
                              ),
                              border: Border.all(
                                color: appTheme.teal700,
                                width: 3.h,
                                strokeAlign: strokeAlignOutside,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.h),
                          child: CustomIconButton(
                            height: 32.adaptSize,
                            width: 32.adaptSize,
                            padding: EdgeInsets.all(7.h),
                            decoration: IconButtonStyleHelper.outlineTealTL8,
                            alignment: Alignment.bottomRight,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgFill1Teal70036x36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.v),
                  _buildFullName(context),
                  SizedBox(height: 18.v),
                  _buildName(context),
                  SizedBox(height: 18.v),
                  _buildDateOfBirth(context),
                  SizedBox(height: 18.v),
                  _buildEmail(context),
                  SizedBox(height: 18.v),
                  Expanded(
                    child: _buildPhoneNumber(context),
                  ),
                  SizedBox(height: 18.v),
                  CustomDropDown(
                    hintText: "Gender",
                    items: dropdownItemList,
                  ),
                  SizedBox(height: 18.v),
                  _buildSeven(context),
                  SizedBox(height: 40.v),
                  _buildUpdate(context),
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
        text: "Edit Profile",
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return CustomTextFormField(
      controller: fullNameController,
      hintText: "Full Name",
      hintStyle: CustomTextStyles.titleSmallGray800,
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "Nick Name",
      hintStyle: CustomTextStyles.titleSmallGray800,
    );
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return CustomTextFormField(
      controller: dateOfBirthController,
      hintText: "Date of Birth",
      hintStyle: CustomTextStyles.titleSmallGray800,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(21.h, 20.v, 8.h, 20.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgCalendar,
          width: 18.h,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 60.v,
      ),
      contentPadding: EdgeInsets.only(
        top: 21.v,
        right: 30.h,
        bottom: 21.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Email",
      hintStyle: CustomTextStyles.titleSmallGray800,
      textInputType: TextInputType.emailAddress,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(20.h, 23.v, 7.h, 22.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgLock,
          height: 15.v,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 60.v,
      ),
      contentPadding: EdgeInsets.only(
        top: 21.v,
        right: 30.h,
        bottom: 21.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return CustomPhoneNumber(
      country: selectedCountry,
      controller: phoneNumberController,
      onTap: (Country value) {
        selectedCountry = value;
      },
    );
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Text(
        "Student",
        style: CustomTextStyles.titleSmallGray800,
      ),
    );
  }

  /// Section Widget
  Widget _buildUpdate(BuildContext context) {
    return CustomElevatedButton(
      text: "Update",
      margin: EdgeInsets.symmetric(horizontal: 5.h),
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

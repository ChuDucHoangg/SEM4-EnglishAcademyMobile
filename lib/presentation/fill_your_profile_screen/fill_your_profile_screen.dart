import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
import 'package:english_academy_mobile/widgets/custom_phone_number.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:english_academy_mobile/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class FillYourProfileScreen extends StatelessWidget {
  FillYourProfileScreen({Key? key})
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
                  vertical: 29.v,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.adaptSize,
                      width: 100.adaptSize,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 100.adaptSize,
                              width: 100.adaptSize,
                              decoration: BoxDecoration(
                                color: appTheme.blue50,
                                borderRadius: BorderRadius.circular(
                                  50.h,
                                ),
                              ),
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgFill1Gray50,
                            width: 70.h,
                            alignment: Alignment.bottomCenter,
                          ),
                          CustomIconButton(
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            padding: EdgeInsets.all(7.h),
                            alignment: Alignment.bottomRight,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgGroup143,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.v),
                    _buildFullName(context),
                    SizedBox(height: 20.v),
                    _buildName(context),
                    SizedBox(height: 20.v),
                    _buildDateOfBirth(context),
                    SizedBox(height: 20.v),
                    _buildEmail(context),
                    SizedBox(height: 20.v),
                    Expanded(
                      child: _buildPhoneNumber(context),
                    ),
                    SizedBox(height: 20.v),
                    CustomDropDown(
                      hintText: "Gender",
                      items: dropdownItemList,
                    ),
                    SizedBox(height: 50.v),
                    _buildBUTTON(context),
                    SizedBox(height: 5.v),
                  ],
                ),
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
        text: "Fill Your Profile",
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
  Widget _buildBUTTON(BuildContext context) {
    return SizedBox(
      height: 60.v,
      width: 350.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.circleBorder30,
              ),
              child: Container(
                height: 60.v,
                width: 350.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 9.h,
                  vertical: 6.v,
                ),
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder30,
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CustomIconButton(
                      height: 48.adaptSize,
                      width: 48.adaptSize,
                      alignment: Alignment.centerRight,
                      child: CustomImageView(),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgFill1Primary,
                      height: 17.v,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 13.h),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Continue",
              style: CustomTextStyles.titleMediumWhiteA700,
            ),
          ),
        ],
      ),
    );
  }
}

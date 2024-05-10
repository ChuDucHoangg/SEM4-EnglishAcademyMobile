import 'package:english_academy_mobile/core/utils/image_constant.dart';
import 'package:english_academy_mobile/core/utils/size_utils.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/custom_switch.dart';
import 'package:english_academy_mobile/widgets/custom_checkbox_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/theme/theme_helper.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme_notifer.dart';
import '../../../theme/theme_provider.dart';

class ProfileMoreScreen extends StatefulWidget {
  ProfileMoreScreen({Key? key}) : super(key: key);

  @override
  _ProfileMoreScreenState createState() => _ProfileMoreScreenState();
}

class _ProfileMoreScreenState extends State<ProfileMoreScreen> {
  ThemeHelper _themeHelper = ThemeHelper();

  bool isSelectedSwitch = false;
  bool privacy = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 32.v),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Column(
                children: [
                  _buildSetting1(context),
                  SizedBox(height: 15.v),
                  _buildSetting(
                    context,
                    file: ImageConstant.imgGridBlueGray300,
                    label: "Referral Code",
                    profile: ImageConstant.imgCalendarBlueGray300,
                    label1: "Learning Reminder",
                    settings: ImageConstant.imgTelevisionBlueGray30022x22,
                    label2: "Voucher Code",
                  ),
                  SizedBox(height: 15.v),
                  _buildSetting(
                    context,
                    file: ImageConstant.imgFileBlueGray300,
                    label: "Investor Academy",
                    profile: ImageConstant.imgProfileBlueGray300,
                    label1: "FAQS",
                    settings: ImageConstant.imgSettingsBlueGray300,
                    label2: "Help Center",
                  ),
                  SizedBox(height: 15.v),
                  _buildSetting4(context),
                  SizedBox(height: 15.v),
                  _buildSetting5(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 22.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Profile" ,
      ),

    );
  }

  Widget _buildSetting1(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.h),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItem(
            context,
            upload: ImageConstant.imgLockBlueGray300,
            label: "Personal Details",
          ),
          _buildItem(
            context,
            upload: ImageConstant.imgUpload,
            label: "Preference Video",
          ),
          _buildItem(
            context,
            upload: ImageConstant.imgDownloadBlueGray300,
            label: "Your Download",
          ),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMobile,
                height: 22.adaptSize,
                width: 22.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 2.v,
                  bottom: 2.v,
                ),
                child: Text(
                  "Dark Mode",
                  style: CustomTextStyles.titleSmallBluegray800.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              Spacer(),
              CustomSwitch(
                value: isSelectedSwitch,
                onChange: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(context);
                },
              )
            ],
          ),
          SizedBox(height: 16.v),
        ],
      ),
    );
  }

  Widget _buildSetting4(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.h),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItem(
            context,
            upload: ImageConstant.imgGlobe,
            label: "Language",
          ),
          Container(
            padding: EdgeInsets.only(
              top: 16.v,
              bottom: 15.v,
            ),
            decoration: AppDecoration.outlineBluegray502,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCheckboxButton(
                  text: "Privacy",
                  value: privacy,
                  padding: EdgeInsets.symmetric(vertical: 1.v),
                  textStyle: CustomTextStyles.titleSmallBluegray800.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onChange: (value) {
                    setState(() {
                      privacy = value;
                    });
                  },
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowdownBlueGray300,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 3.v),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          _buildItem(
            context,
            upload: ImageConstant.imgNotificationsOutline,
            label: "Notification",
          ),
          SizedBox(height: 16.v),
        ],
      ),
    );
  }

  Widget _buildSetting5(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.h),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: _buildItem(
        context,
        upload: ImageConstant.imgSignalBlueGray300,
        label: "Rate Courser",
      ),
    );
  }

  Widget _buildItem(BuildContext context,
      {required String upload, required String label}) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.v,
        bottom: 15.v,
      ),
      decoration: AppDecoration.outlineBluegray502,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: upload,
            height: 22.adaptSize,
            width: 22.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 2.v,
              bottom: 2.v,
            ),
            child: Text(
              label,
              style: CustomTextStyles.titleSmallBluegray800.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowdownBlueGray300,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 3.v),
          ),
        ],
      ),
    );
  }

  Widget _buildSetting(BuildContext context,
      {required String file,
      required String label,
      required String profile,
      required String label1,
      required String settings,
      required String label2}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.h),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 16.v,
              bottom: 15.v,
            ),
            decoration: AppDecoration.outlineBluegray502,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: file,
                  height: 22.adaptSize,
                  width: 22.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 3.v),
                  child: Text(
                    label,
                    style: CustomTextStyles.titleSmallBluegray800.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: file,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 3.v),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16.v, bottom: 15.v),
            decoration: AppDecoration.outlineBluegray502,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: profile,
                  height: 22.adaptSize,
                  width: 22.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 2.v),
                  child: Text(
                    label1,
                    style: CustomTextStyles.titleSmallBluegray800.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowdownBlueGray300,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 3.v),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: settings,
                height: 22.adaptSize,
                width: 22.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.h, top: 3.v),
                child: Text(
                  label2,
                  style: CustomTextStyles.titleSmallBluegray800.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgArrowdownBlueGray300,
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 3.v),
              ),
            ],
          ),
          SizedBox(height: 16.v),
        ],
      ),
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

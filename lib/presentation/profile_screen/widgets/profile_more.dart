import 'package:english_academy_mobile/core/utils/image_constant.dart';
import 'package:english_academy_mobile/core/utils/size_utils.dart';
import 'package:english_academy_mobile/presentation/personal_data_edit_screen/personal_data_edit_screen.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:english_academy_mobile/widgets/custom_switch.dart';
import 'package:english_academy_mobile/widgets/custom_checkbox_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:provider/provider.dart';
import '../../../service/AuthService.dart';
import '../../../theme/theme_provider.dart';
import '../../auth/change_password_screen/changePassword.dart';
import '../../auth/login_screen/login_screen.dart';

class ProfileMoreScreen extends StatefulWidget {
  ProfileMoreScreen({Key? key}) : super(key: key);

  @override
  _ProfileMoreScreenState createState() => _ProfileMoreScreenState();
}

class _ProfileMoreScreenState extends State<ProfileMoreScreen> {
  bool isSwitched = false;
  bool privacy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.h),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                CustomElevatedButton(
                  onPressed: () {
                    _logout(context);
                  },
                  text: 'Logout',
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  // child: Text('Logout'),
                ),
                SizedBox(height: 15.v),
              ],
            ),
          ),
        ),
      ),
      // ),
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
        text: "Profile",
      ),
    );
  }

  Widget _buildSetting1(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.h),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItem3(
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
                value: isSwitched,
                onChange: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(context);
                  isSwitched = value;
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
      padding: EdgeInsets.symmetric(horizontal: 11.h),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItem2(
            context,
            upload: ImageConstant.imgEye,
            label: "Change Password",
          ),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    try {
      await AuthService.removeTokenFromSharedPreferences();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print('Error logging out: $e');
    }
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

  Widget _buildItem2(BuildContext context,
      {required String upload, required String label}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 16.v,
          bottom: 15.v,
        ),
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
          ],
        ),
      ),
    );
  }

  Widget _buildItem3(BuildContext context,
      {required String upload, required String label}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonalDataEditScreen()),
        );
      },
      child: Container(
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
          ],
        ),
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
        color: Theme.of(context).colorScheme.primaryContainer,
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

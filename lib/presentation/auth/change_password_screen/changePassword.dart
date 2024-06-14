import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/utils/image_constant.dart';
import 'package:english_academy_mobile/core/utils/size_utils.dart';
import 'package:english_academy_mobile/theme/app_decoration.dart';
import 'package:english_academy_mobile/theme/custom_text_style.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/custom_image_view.dart';
import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
import '../../../service/AuthService.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool currentPasswordError = false;
  bool newPasswordError = false;
  bool confirmPasswordError = false;

  Future<void> changePassword() async {
    setState(() {
      currentPasswordError = false;
      newPasswordError = false;
      confirmPasswordError = false;
    });

    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await AuthService.changePassword(
        currentPasswordController.text,
        newPasswordController.text,
        confirmPasswordController.text,
        context,
      );
    } catch (e) {
      setState(() {
        String errorMessage = e.toString();
        currentPasswordError = errorMessage.contains("current password");
        print("currentPasswordError: $currentPasswordError");
        newPasswordError = errorMessage.contains("new password");
        print("newPasswordError: $newPasswordError");
        confirmPasswordError = errorMessage.contains("confirm password");
        print("confirmPasswordError: $confirmPasswordError");
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillOnErrorContainer,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 28.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      children: [
                        _buildAppbar(context),
                        SizedBox(height: 16.v),
                        _buildCurrentPassword(context),
                        SizedBox(height: 16.v),
                        _buildNewPassword(context),
                        SizedBox(height: 16.v),
                        _buildConfirmPassword(context),
                        SizedBox(height: 16.v),
                        _buildChangePasswordButton(context),
                      ],
                    ),
                  ),
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
        text: "Change Password",
      ),
    );
  }

  Widget _buildCurrentPassword(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        controller: currentPasswordController,
        hintText: "Mật khẩu hiện tại",
        hintStyle: CustomTextStyles.bodyLargeBluegray300,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 18.v, 12.h, 18.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgLocation,
              height: 20.adaptSize,
              width: 20.adaptSize,
            )),
        prefixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 18.v, 16.h, 18.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgEye,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        obscureText: true,
        borderDecoration: currentPasswordError
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.redA200,
            width: 1,
          ),
        )
            : null,
        validator: (value) {
          if (!currentPasswordError && (value == null || value.isEmpty)) {
            return 'Vui lòng nhập mật khẩu hiện tại.';
          }
          return null;
        },
      ),
      if (currentPasswordError)
        Padding(
          padding: EdgeInsets.only(right: 175.h, top: 5.v),
          child: Text(
            "Mật khẩu hiện tại không chính xác.",
            style: TextStyle(color: Colors.red, fontSize: 12.adaptSize),
          ),
        ),
    ]);
  }

  Widget _buildNewPassword(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        controller: newPasswordController,
        hintText: "Mật khẩu mới",
        hintStyle: CustomTextStyles.bodyLargeBluegray300,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 18.v, 12.h, 18.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgLocation,
              height: 20.adaptSize,
              width: 20.adaptSize,
            )),
        prefixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 18.v, 16.h, 18.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgEye,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        obscureText: true,
        borderDecoration: newPasswordError
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.redA200,
            width: 1,
          ),
        )
            : null,
        validator: (value) {
          if (!newPasswordError && (value == null || value.isEmpty)) {
            return 'Vui lòng nhập mật khẩu mới.';
          }if (value != null && value.length < 6) {
            return 'Mật khẩu phải có ít nhất 6 ký tự.';
          }
          return null;
        },
      ),
      if (newPasswordError)
        Padding(
          padding: EdgeInsets.only(right: 175.h, top: 5.v),
          child: Text(
            "Mật khẩu mới không hợp lệ.",
            style: TextStyle(color: Colors.red, fontSize: 12.adaptSize),
          ),
        ),
    ]
    );
  }

  Widget _buildConfirmPassword(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        controller: confirmPasswordController,
        hintText: "Nhập lại mật khẩu mới",
        hintStyle: CustomTextStyles.bodyLargeBluegray300,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(16.h, 18.v, 12.h, 18.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgLocation,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 18.v, 16.h, 18.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgEye,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        obscureText: true,
        borderDecoration: confirmPasswordError
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.redA200,
            width: 1,
          ),
        )
            : null,
        validator: (value) {
          if (!confirmPasswordError && (value == null || value.isEmpty)) {
            return 'Vui lòng nhập lại mật khẩu mới.';
          }
          // Kiểm tra sự khớp nhau giữa mật khẩu mới và mật khẩu xác nhận
          if (value != newPasswordController.text) {
            return 'Mật khẩu xác nhận không khớp.';
          }
          return null;
        },
      ),
      if (confirmPasswordError)
        Padding(
          padding: EdgeInsets.only(right: 175.h, top: 5.v),
          child: Text(
            "Mật khẩu nhập lại không hợp lệ.",
            style: TextStyle(color: Colors.red, fontSize: 12.adaptSize),
          ),
        ),
    ]);
  }

  Widget _buildChangePasswordButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => changePassword(),
      text: "Đổi mật khẩu",
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

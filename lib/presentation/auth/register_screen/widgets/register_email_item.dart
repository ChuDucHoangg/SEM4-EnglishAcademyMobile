import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../../service/AuthService.dart';

class RegisterEmailItem extends StatefulWidget {
  const RegisterEmailItem({Key? key})
      : super(
    key: key,
  );

  @override
  RegisterEmailItemState createState() => RegisterEmailItemState();
}

class RegisterEmailItemState extends State<RegisterEmailItem>
    with AutomaticKeepAliveClientMixin<RegisterEmailItem> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> registerWithEmail() async {
    await AuthService.registerWithEmail(
     nameController.text, emailController.text, passwordController.text, context);
  }

  @override
  bool get wantKeepAlive => true;

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
            child: Column(
              children: [
                SizedBox(height: 32.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                    children: [
                      _buildName(context),
                      SizedBox(height: 16.v),
                      _buildEmail(context),
                      SizedBox(height: 16.v),
                      _buildPassword(context),
                      SizedBox(height: 25.v),
                      _buildSignUp(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "Your name",
      hintStyle: CustomTextStyles.bodyLargeBluegray300,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 18.v, 11.h, 18.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgLock,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 56.v,
      ),
      contentPadding: EdgeInsets.only(
        top: 18.v,
        right: 30.h,
        bottom: 18.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Your email",
      hintStyle: CustomTextStyles.bodyLargeBluegray300,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 18.v, 11.h, 18.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgCheckmark,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 56.v,
      ),
      contentPadding: EdgeInsets.only(
        top: 18.v,
        right: 30.h,
        bottom: 18.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Your password",
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
    );
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => registerWithEmail(),
      text: "Sign Up",
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}

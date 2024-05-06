import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import '../../../../service/AuthService.dart';

class LoginEmailItem extends StatefulWidget {
  const LoginEmailItem({Key? key})
      : super(
          key: key,
        );

  @override
  LoginEmailItemState createState() => LoginEmailItemState();
}

class LoginEmailItemState extends State<LoginEmailItem>
    with AutomaticKeepAliveClientMixin<LoginEmailItem> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  bool get wantKeepAlive => true;
  bool hasError = false;

  Future<void> loginWithEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      await AuthService.loginWithEmail(
          emailController.text, passwordController.text, context);
    } catch (e) {
      setState(() {
        hasError = true;
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
                        _buildEmail(context),
                        SizedBox(height: 16.v),
                        _buildPassword(context),
                        SizedBox(height: 16.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Forgot Password?",
                            style: CustomTextStyles.titleMediumPrimary,
                          ),
                        ),
                        SizedBox(height: 16.v),
                        _buildSignIn(context),
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

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        controller: emailController,
        hintText: "Your email",
        hintStyle: CustomTextStyles.bodyLargeBluegray300,
        textInputType: TextInputType.emailAddress,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 18.v, 12.h, 18.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgCheckmark,
              height: 20.adaptSize,
              width: 20.adaptSize,
            )),
        prefixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        contentPadding: EdgeInsets.only(
          top: 18.v,
          right: 30.h,
          bottom: 18.v,
        ),
        borderDecoration: hasError
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(
                  color: appTheme.redA200,
                  width: 1,
                ),
              )
            : null,
        validator: (value) {
          if (!hasError && (value == null || value.isEmpty)) {
            return 'Please enter your email address.';
          }
          return null;
        },
      ),
      if (hasError)
        Padding(
          padding: EdgeInsets.only(right: 175.h, top: 5.v),
          child: Text(
            "Invalid email or password.",
            style: TextStyle(color: Colors.red, fontSize: 12.adaptSize),
          ),
        ),
    ]);
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
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
            ),),
        suffixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        obscureText: true,
        borderDecoration: hasError
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(
                  color: appTheme.redA200,
                  width: 1,
                ),
              )
            : null,
        validator: (value) {
          if (!hasError && (value == null || value.isEmpty)) {
            return 'Please enter your password.';
          }
          return null;
        },
      ),
      if (hasError)
        Padding(
          padding: EdgeInsets.only(right: 175.h, top: 5.v),
          child: Text(
            "Invalid email or password.",
            style: TextStyle(color: Colors.red, fontSize: 12.adaptSize),
          ),
        ),
    ]);
  }

  /// Section Widget
  Widget _buildSignIn(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => loginWithEmail(),
      text: "Sign In",
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}

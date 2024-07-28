import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../../service/AuthService.dart';
import '../../login_screen/login_screen.dart';

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
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> registerWithEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      await AuthService.registerWithEmail(
          nameController.text,
          phoneController.text,
          emailController.text,
          passwordController.text,
          context);
    } catch (e) {
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
  bool hasError = false;

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
                        _buildName(context),
                        SizedBox(height: 16.v),
                        _buildPhone(context),
                        SizedBox(height: 16.v),
                        _buildEmail(context),
                        SizedBox(height: 16.v),
                        _buildPassword(context),
                        SizedBox(height: 25.v),
                        _buildSignUp(context),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      children: [
                        Container(
                          height: 90.h,
                          width: 313.h,
                          margin:
                              EdgeInsets.only(left: 4.h, right: 3.h, top: 30.h),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "By signing up you agree to Overskill's",
                                style: CustomTextStyles.bodyMediumff111827,
                              ),
                              TextSpan(
                                  text: " Terms of Services",
                                  style: CustomTextStyles.titleSmallff111827),
                              TextSpan(
                                  text: " and ",
                                  style: CustomTextStyles.bodyMediumff111827),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: CustomTextStyles.titleSmallff111827)
                            ]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10.v),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account?",
                                style: CustomTextStyles.bodyLargeff111827,
                              ),
                              TextSpan(
                                text: " ",
                              ),
                              TextSpan(
                                  text: "Sign In",
                                  style: CustomTextStyles.titleMediumff1d2857_1,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    }),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name.';
          } else if (value.length < 3) {
            return 'Name must have at least 3 characters.';
          } else if (value.length > 200) {
            return 'Name must be less than 200 characters.';
          }
          return null;
        },
      ),
    ]);
  }

  /// Section Widget
  Widget _buildPhone(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        controller: phoneController,
        hintText: "0987654xxx",
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your phone.';
          } else if (value.length < 6) {
            return 'Phone must have at least 6 characters.';
          } else if (value.length > 20) {
            return 'Phone must be less than 20 characters.';
          }
          return null;
        },
      ),
    ]);
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
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
          if (value == null || value.isEmpty && !hasError) {
            return 'Please enter your email address.';
          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
              .hasMatch(value)) {
            return 'You must enter the correct email address format.';
          }
          return null;
        },
      ),
      if (hasError)
        Padding(
          padding: EdgeInsets.only(right: 125.h, top: 5.v),
          child: Text(
            "This email address already exists.",
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password.';
          } else if (value.length < 8) {
            return 'Password must have at least 8 characters.';
          } else if (value.length > 100) {
            return 'Password must be less than 100 characters.';
          }
          return null;
        },
      ),
    ]);
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

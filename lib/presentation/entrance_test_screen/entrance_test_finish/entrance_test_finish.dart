import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/init_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/learning_paths_ielts_screen/learning_paths_ielts_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/image_constant.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';

class EntranceTestFinish extends StatelessWidget {
  final String code;
  EntranceTestFinish({super.key, required this.code});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: _buildAppBar(context),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.only(right: 15.0, left: 15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "The test has been completed",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Your test has been submitted successfully!",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0),
              ),
              Lottie.asset("assets/lottie/firework.json"),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.all(24.h),
                            decoration:
                                AppDecoration.fillOnErrorContainer.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL24,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.v),
                                Text(
                                  "Please enter your information.",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0),
                                ),
                                Container(
                                  child: Text(
                                    "Please provide your personal information to view results. Your information will be kept confidential and used for this purpose only.",
                                    style: TextStyle(
                                        fontSize: 14, letterSpacing: 0),
                                  ),
                                ),
                                SizedBox(height: 26.v),
                                CustomTextFormField(
                                  controller: fullNameController,
                                  hintText: "Full Name",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  textInputAction: TextInputAction.done,
                                  prefix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        16.h, 18.v, 11.h, 18.v),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgNavProfile,
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
                                ),
                                SizedBox(height: 10.v),
                                CustomTextFormField(
                                  controller: emailController,
                                  hintText: "Email Address",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  textInputAction: TextInputAction.done,
                                  prefix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        16.h, 18.v, 11.h, 18.v),
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
                                ),
                                SizedBox(height: 10.v),
                                CustomTextFormField(
                                  controller: phoneNumberController,
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  textInputAction: TextInputAction.done,
                                  prefix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        16.h, 18.v, 11.h, 18.v),
                                    child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgCallBlueGray300,
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
                                ),
                                SizedBox(height: 15),
                                CustomElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => LearningPathsIeltsScreen(code: code)),
                                    );
                                  },
                                  text: "Continue",
                                  buttonStyle: CustomButtonStyles.fillPrimary,
                                ),
                                SizedBox(height: 26.v),
                              ],
                            ),
                          );
                        });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => theme.colorScheme.primary),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 75)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "VIEW RESULT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.library_books_rounded, color: Colors.white),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 46.h,
    leading: AppbarTrailingImage(
      imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
      margin: EdgeInsets.symmetric(horizontal: 10),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InitScreen()),
        );
      },
    ),
    actions: [
      AppbarTrailingImage(
        imagePath: ImageConstant.imgNotificationOnerrorcontainer,
        margin: EdgeInsets.symmetric(horizontal: 24.h),
      ),
    ],
  );
}
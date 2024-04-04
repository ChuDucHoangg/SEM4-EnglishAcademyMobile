// import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
// import 'package:english_academy_mobile/widgets/custom_checkbox_button.dart';
// import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class RegisterNowScreen extends StatelessWidget {
//   RegisterNowScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   TextEditingController emailController = TextEditingController();
//
//   TextEditingController passwordController = TextEditingController();
//
//   bool checkmark = false;
//
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         backgroundColor: appTheme.whiteA700,
//         resizeToAvoidBottomInset: false,
//         body: Center(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//             child: Form(
//               key: _formKey,
//               child: Container(
//                 width: double.maxFinite,
//                 padding: EdgeInsets.symmetric(horizontal: 34.h),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgTelevision,
//                           height: 70.adaptSize,
//                           width: 70.adaptSize,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 12.h,
//                             top: 5.v,
//                             bottom: 20.v,
//                           ),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "English Academy",
//                                 style: theme.textTheme.headlineLarge,
//                               ),
//                               Text(
//                                 "Learn From Home".toUpperCase(),
//                                 style:
//                                 CustomTextStyles.labelMediumPoppinsBlack900,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 61.v),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Getting Started.!",
//                         style: theme.textTheme.headlineSmall,
//                       ),
//                     ),
//                     SizedBox(height: 9.v),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Create an Account to Continue your allCourses",
//                         style: theme.textTheme.titleSmall,
//                       ),
//                     ),
//                     SizedBox(height: 48.v),
//                     CustomTextFormField(
//                       controller: emailController,
//                       hintText: "Email",
//                       hintStyle: CustomTextStyles.titleSmallGray800,
//                       textInputType: TextInputType.emailAddress,
//                       prefix: Container(
//                         margin: EdgeInsets.fromLTRB(20.h, 22.v, 7.h, 23.v),
//                         child: CustomImageView(
//                           imagePath: ImageConstant.imgLock,
//                           height: 15.v,
//                         ),
//                       ),
//                       prefixConstraints: BoxConstraints(
//                         maxHeight: 60.v,
//                       ),
//                       contentPadding: EdgeInsets.only(
//                         top: 21.v,
//                         right: 30.h,
//                         bottom: 21.v,
//                       ),
//                     ),
//                     SizedBox(height: 20.v),
//                     CustomTextFormField(
//                       controller: passwordController,
//                       hintText: "Password",
//                       hintStyle: CustomTextStyles.titleSmallGray800,
//                       textInputAction: TextInputAction.done,
//                       textInputType: TextInputType.visiblePassword,
//                       prefix: Container(
//                         margin: EdgeInsets.fromLTRB(22.h, 20.v, 9.h, 20.v),
//                         child: CustomImageView(
//                           imagePath: ImageConstant.imgLocation,
//                           width: 15.h,
//                         ),
//                       ),
//                       prefixConstraints: BoxConstraints(
//                         maxHeight: 60.v,
//                       ),
//                       suffix: Container(
//                         margin: EdgeInsets.fromLTRB(30.h, 21.v, 24.h, 21.v),
//                         child: CustomImageView(
//                           imagePath: ImageConstant.imgThumbsup,
//                           height: 15.adaptSize,
//                           width: 15.adaptSize,
//                         ),
//                       ),
//                       suffixConstraints: BoxConstraints(
//                         maxHeight: 60.v,
//                       ),
//                       obscureText: true,
//                       contentPadding: EdgeInsets.symmetric(vertical: 21.v),
//                     ),
//                     SizedBox(height: 20.v),
//                     _buildCheckmark(context),
//                     SizedBox(height: 35.v),
//                     _buildSignUp(context),
//                     SizedBox(height: 24.v),
//                     Text(
//                       "Or Continue With",
//                       style: CustomTextStyles.titleSmallExtraBold_1,
//                     ),
//                     SizedBox(height: 25.v),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CustomIconButton(
//                           height: 48.adaptSize,
//                           width: 48.adaptSize,
//                           padding: EdgeInsets.all(13.h),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.3),
//                                 spreadRadius: 0.1,
//                                 blurRadius: 10,
//                                 offset: Offset(0, 1),
//                               ),
//                             ],
//                           ),
//                           child: CustomImageView(
//                             imagePath: ImageConstant.imgCircle,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 50.h),
//                           child: CustomIconButton(
//                             height: 48.adaptSize,
//                             width: 48.adaptSize,
//                             padding: EdgeInsets.all(14.h),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.3),
//                                   spreadRadius: 0.1,
//                                   blurRadius: 10,
//                                   offset: Offset(0, 1),
//                                 ),
//                               ],
//                             ),
//                             child: CustomImageView(
//                               imagePath: ImageConstant.imgGroup3,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 52.v),
//                     SizedBox(
//                       height: 18.v,
//                       width: 232.h,
//                       child: Stack(
//                         alignment: Alignment.bottomRight,
//                         children: [
//                           Align(
//                             alignment: Alignment.center,
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "Already have an Account? ",
//                                     style: CustomTextStyles.titleSmallff545454,
//                                   ),
//                                   TextSpan(
//                                     text: "SIGN IN",
//                                     style: CustomTextStyles.titleSmallff0961f5,
//                                   ),
//                                 ],
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.bottomRight,
//                             child: Padding(
//                               padding: EdgeInsets.only(bottom: 1.v),
//                               child: SizedBox(
//                                 width: 52.h,
//                                 child: Divider(
//                                   color: theme.colorScheme.primary,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 3.v),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//     );
//   }
//
//   /// Section Widget
//   Widget _buildCheckmark(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: CustomCheckboxButton(
//         alignment: Alignment.centerLeft,
//         text: "Agree to Terms & Conditions",
//         value: checkmark,
//         padding: EdgeInsets.symmetric(vertical: 1.v),
//         textStyle: CustomTextStyles.labelLargeExtraBold,
//         onChange: (value) {
//           checkmark = value;
//         },
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildSignUp(BuildContext context) {
//     return SizedBox(
//       height: 60.v,
//       width: 350.h,
//       child: Stack(
//         alignment: Alignment.centerRight,
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               height: 60.v,
//               width: 350.h,
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.primary,
//                 borderRadius: BorderRadius.circular(
//                   30.h,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: appTheme.black900.withOpacity(0.3),
//                     spreadRadius: 2.h,
//                     blurRadius: 2.h,
//                     offset: Offset(
//                       1,
//                       2,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: Padding(
//               padding: EdgeInsets.only(right: 9.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 12.v,
//                       bottom: 8.v,
//                     ),
//                     child: Text(
//                       "Sign Up",
//                       style: CustomTextStyles.titleMediumWhiteA700,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 85.h),
//                     child: CustomIconButton(
//                       height: 48.adaptSize,
//                       width: 48.adaptSize,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                       padding: EdgeInsets.all(13.h),
//                       child: CustomImageView(
//                         imagePath: ImageConstant.imgFill1Primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

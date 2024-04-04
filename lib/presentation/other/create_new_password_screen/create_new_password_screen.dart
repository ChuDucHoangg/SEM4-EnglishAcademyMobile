// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
// import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class CreateNewPasswordScreen extends StatelessWidget {
//   CreateNewPasswordScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   TextEditingController newpasswordController = TextEditingController();
//
//   TextEditingController passwordController = TextEditingController();
//
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: appTheme.whiteA700,
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(context),
//         body: SizedBox(
//           width: SizeUtils.width,
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//             child: SizedBox(
//               height: SizeUtils.height,
//               child: Form(
//                 key: _formKey,
//                 child: Container(
//                   width: double.maxFinite,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 34.h,
//                     vertical: 164.v,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Spacer(),
//                       Text(
//                         "Create Your New Password",
//                         style: CustomTextStyles.titleMedium19,
//                       ),
//                       SizedBox(height: 25.v),
//                       CustomTextFormField(
//                         controller: newpasswordController,
//                         hintText: "Password",
//                         hintStyle: CustomTextStyles.titleSmallGray800,
//                         textInputType: TextInputType.visiblePassword,
//                         prefix: Container(
//                           margin: EdgeInsets.fromLTRB(22.h, 20.v, 9.h, 20.v),
//                           child: CustomImageView(
//                             imagePath: ImageConstant.imgLocation,
//                             width: 15.h,
//                           ),
//                         ),
//                         prefixConstraints: BoxConstraints(
//                           maxHeight: 60.v,
//                         ),
//                         suffix: Container(
//                           margin: EdgeInsets.fromLTRB(30.h, 21.v, 24.h, 21.v),
//                           child: CustomImageView(
//                             imagePath: ImageConstant.imgThumbsup,
//                             height: 15.adaptSize,
//                             width: 15.adaptSize,
//                           ),
//                         ),
//                         suffixConstraints: BoxConstraints(
//                           maxHeight: 60.v,
//                         ),
//                         obscureText: true,
//                         contentPadding: EdgeInsets.symmetric(vertical: 21.v),
//                       ),
//                       SizedBox(height: 20.v),
//                       CustomTextFormField(
//                         controller: passwordController,
//                         hintText: "Confirm Password",
//                         hintStyle: CustomTextStyles.titleSmallGray800,
//                         textInputAction: TextInputAction.done,
//                         textInputType: TextInputType.visiblePassword,
//                         prefix: Container(
//                           margin: EdgeInsets.fromLTRB(22.h, 20.v, 9.h, 20.v),
//                           child: CustomImageView(
//                             imagePath: ImageConstant.imgLocation,
//                             width: 15.h,
//                           ),
//                         ),
//                         prefixConstraints: BoxConstraints(
//                           maxHeight: 60.v,
//                         ),
//                         suffix: Container(
//                           margin: EdgeInsets.fromLTRB(30.h, 21.v, 24.h, 21.v),
//                           child: CustomImageView(
//                             imagePath: ImageConstant.imgThumbsup,
//                             height: 15.adaptSize,
//                             width: 15.adaptSize,
//                           ),
//                         ),
//                         suffixConstraints: BoxConstraints(
//                           maxHeight: 60.v,
//                         ),
//                         obscureText: true,
//                         contentPadding: EdgeInsets.symmetric(vertical: 21.v),
//                       ),
//                       SizedBox(height: 50.v),
//                       _buildContinue(context),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//     );
//   }
//
//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       leadingWidth: 61.h,
//       leading: AppbarLeadingImage(
//         imagePath: ImageConstant.imgArrowDown,
//         margin: EdgeInsets.only(
//           left: 35.h,
//           top: 18.v,
//           bottom: 17.v,
//         ),
//       ),
//       title: AppbarSubtitle(
//         text: "Create New Password",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildContinue(BuildContext context) {
//     return Container(
//       height: 60.v,
//       width: 350.h,
//       margin: EdgeInsets.only(left: 5.h),
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
//                     padding: EdgeInsets.symmetric(vertical: 10.v),
//                     child: Text(
//                       "Continue",
//                       style: CustomTextStyles.titleMediumWhiteA700,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 81.h),
//                     child: CustomIconButton(
//                       height: 48.adaptSize,
//                       width: 48.adaptSize,
//                       padding: EdgeInsets.all(13.h),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
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
//
//
// showLoaderDialog(BuildContext context){
//   AlertDialog alert=AlertDialog(
//     content: new Row(
//       children: [
//         CircularProgressIndicator(),
//         Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
//       ],),
//   );
//   showDialog(barrierDismissible: false,
//     context:context,
//     builder:(BuildContext context){
//       return alert;
//     },
//   );
// }
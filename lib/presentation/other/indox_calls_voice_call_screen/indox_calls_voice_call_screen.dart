// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class IndoxCallsVoiceCallScreen extends StatelessWidget {
//   const IndoxCallsVoiceCallScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: _buildAppBar(context),
//         body: Container(
//           width: double.maxFinite,
//           padding: EdgeInsets.symmetric(vertical: 98.v),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               SizedBox(height: 65.v),
//               Container(
//                 height: 220.adaptSize,
//                 width: 220.adaptSize,
//                 decoration: BoxDecoration(
//                   color: appTheme.black900,
//                   borderRadius: BorderRadius.circular(
//                     110.h,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 3.v),
//               Text(
//                 "Scott R. Shoemake",
//                 style: CustomTextStyles.titleLarge22,
//               ),
//               SizedBox(height: 4.v),
//               Text(
//                 "04:50 Minutes",
//                 style: theme.textTheme.labelLarge,
//               ),
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomIconButton(
//                     height: 62.adaptSize,
//                     width: 62.adaptSize,
//                     padding: EdgeInsets.all(18.h),
//                     child: CustomImageView(
//                       imagePath: ImageConstant.imgCloseBlack900,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30.h),
//                     child: CustomIconButton(
//                       height: 62.adaptSize,
//                       width: 62.adaptSize,
//                       padding: EdgeInsets.all(20.h),
//                       decoration: IconButtonStyleHelper.outlineBlackTL311,
//                       child: CustomImageView(
//                         imagePath: ImageConstant.imgCallWhiteA700,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30.h),
//                     child: CustomIconButton(
//                       height: 62.adaptSize,
//                       width: 62.adaptSize,
//                       padding: EdgeInsets.all(19.h),
//                       decoration: IconButtonStyleHelper.outlineBlack,
//                       child: CustomImageView(
//                         imagePath: ImageConstant.imgVideo,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       leadingWidth: double.maxFinite,
//       leading: AppbarLeadingImage(
//         imagePath: ImageConstant.imgFill1BlueGray900,
//         margin: EdgeInsets.fromLTRB(35.h, 18.v, 367.h, 18.v),
//       ),
//     );
//   }
// }

// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
// import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class SetYourFingerprintScreen extends StatelessWidget {
//   const SetYourFingerprintScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appTheme.whiteA700,
//         appBar: _buildAppBar(context),
//         body: Container(
//           width: double.maxFinite,
//           padding: EdgeInsets.symmetric(
//             horizontal: 33.h,
//             vertical: 85.v,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 15.v),
//               Container(
//                 width: 268.h,
//                 margin: EdgeInsets.symmetric(horizontal: 46.h),
//                 child: Text(
//                   "Add a Fingerprint to Make your Account more Secure",
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: theme.textTheme.titleSmall,
//                 ),
//               ),
//               SizedBox(height: 60.v),
//               Container(
//                 height: 236.v,
//                 width: 232.h,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 48.h,
//                   vertical: 43.v,
//                 ),
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: fs.Svg(
//                       ImageConstant.imgGroup37,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: CustomImageView(
//                   imagePath: ImageConstant.imgFill1Primary150x134,
//                   width: 134.h,
//                   alignment: Alignment.center,
//                 ),
//               ),
//               SizedBox(height: 90.v),
//               Container(
//                 width: 273.h,
//                 margin: EdgeInsets.only(
//                   left: 44.h,
//                   right: 43.h,
//                 ),
//                 child: Text(
//                   "Please Put Your Finger on the Fingerprint Scanner to get Started.",
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: theme.textTheme.titleSmall,
//                 ),
//               ),
//               Spacer(),
//               _buildSkip(context),
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
//       leadingWidth: 61.h,
//       leading: AppbarLeadingImage(
//         imagePath: ImageConstant.imgArrowDown,
//         margin: EdgeInsets.only(
//           left: 35.h,
//           top: 17.v,
//           bottom: 18.v,
//         ),
//       ),
//       title: AppbarSubtitle(
//         text: "Set Your Fingerprint",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildSkip(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         CustomOutlinedButton(
//           width: 140.h,
//           text: "Skip",
//           buttonStyle: CustomButtonStyles.outlineBlueGray,
//         ),
//         SizedBox(
//           height: 60.v,
//           width: 200.h,
//           child: Stack(
//             alignment: Alignment.centerRight,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   height: 60.v,
//                   width: 200.h,
//                   decoration: BoxDecoration(
//                     color: theme.colorScheme.primary,
//                     borderRadius: BorderRadius.circular(
//                       30.h,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: appTheme.black900.withOpacity(0.3),
//                         spreadRadius: 2.h,
//                         blurRadius: 2.h,
//                         offset: Offset(
//                           1,
//                           2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Container(
//                   width: 161.h,
//                   margin: EdgeInsets.fromLTRB(30.h, 6.v, 9.h, 6.v),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10.v),
//                         child: Text(
//                           "Continue",
//                           style: CustomTextStyles.titleMediumWhiteA700,
//                         ),
//                       ),
//                       CustomIconButton(
//                         height: 48.adaptSize,
//                         width: 48.adaptSize,
//                         padding: EdgeInsets.all(13.h),
//                         child: CustomImageView(
//                           imagePath: ImageConstant.imgFill1Primary,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

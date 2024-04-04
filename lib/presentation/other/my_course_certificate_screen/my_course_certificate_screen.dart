// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_search_view.dart';
// import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class MyCourseCertificateScreen extends StatelessWidget {
//   MyCourseCertificateScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(context),
//         body: Container(
//           width: double.maxFinite,
//           padding: EdgeInsets.symmetric(
//             horizontal: 34.h,
//             vertical: 2.v,
//           ),
//           child: Column(
//             children: [
//               CustomSearchView(
//                 controller: searchController,
//                 hintText: "3D Design Illustration",
//                 contentPadding: EdgeInsets.only(
//                   left: 21.h,
//                   top: 21.v,
//                   bottom: 21.v,
//                 ),
//               ),
//               SizedBox(height: 20.v),
//               Container(
//                 width: 360.h,
//                 decoration: AppDecoration.outlineBlack9001.copyWith(
//                   borderRadius: BorderRadiusStyle.circleBorder15,
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: SizedBox(
//                         height: 259.v,
//                         width: 332.h,
//                         child: Stack(
//                           alignment: Alignment.topLeft,
//                           children: [
//                             CustomImageView(
//                               imagePath: ImageConstant.imgPath4,
//                               width: 172.h,
//                               alignment: Alignment.topRight,
//                             ),
//                             CustomImageView(
//                               imagePath: ImageConstant.imgTelevision,
//                               width: 54.h,
//                               alignment: Alignment.topLeft,
//                               margin: EdgeInsets.only(
//                                 left: 125.h,
//                                 top: 35.v,
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 34.h,
//                                   top: 110.v,
//                                 ),
//                                 child: Text(
//                                   "Certificate of Completions",
//                                   style: CustomTextStyles.titleLarge20,
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 97.h,
//                                   bottom: 89.v,
//                                 ),
//                                 child: Text(
//                                   "This Certifies that",
//                                   style: theme.textTheme.labelLarge,
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 64.h,
//                                   bottom: 49.v,
//                                 ),
//                                 child: Text(
//                                   "Calvin E. McGinnis",
//                                   style: CustomTextStyles
//                                       .titleLargeMulishIndigo700,
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomLeft,
//                               child: SizedBox(
//                                 width: 305.h,
//                                 child: Text(
//                                   "Has Successfully Completed the Wallace Training Program, Entitled.",
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.center,
//                                   style: theme.textTheme.labelLarge!.copyWith(
//                                     height: 1.38,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 28.v),
//                     Text(
//                       "3D Design Illustration Course",
//                       style: CustomTextStyles.titleMediumMulish,
//                     ),
//                     SizedBox(height: 4.v),
//                     Text(
//                       "Issued on November 24, 2022",
//                       style: theme.textTheme.labelLarge,
//                     ),
//                     SizedBox(height: 15.v),
//                     Text(
//                       "ID: SK24568086",
//                       style: CustomTextStyles.labelLargeGray80001,
//                     ),
//                     SizedBox(height: 25.v),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: SizedBox(
//                         height: 172.v,
//                         width: 277.h,
//                         child: Stack(
//                           alignment: Alignment.topRight,
//                           children: [
//                             CustomImageView(
//                               imagePath: ImageConstant.imgPath5,
//                               width: 114.h,
//                               alignment: Alignment.centerLeft,
//                             ),
//                             Align(
//                               alignment: Alignment.topRight,
//                               child: Text(
//                                 "Calvin E. McGinnis",
//                                 style: CustomTextStyles.headlineSmallMishella,
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomRight,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 89.h,
//                                   right: 5.h,
//                                   bottom: 31.v,
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Text(
//                                       "Virginia M. Patterson",
//                                       style: CustomTextStyles
//                                           .headlineSmallHelenaJohnsmithGray800,
//                                     ),
//                                     Text(
//                                       "Virginia M. Patterson",
//                                       style: theme.textTheme.titleMedium,
//                                     ),
//                                     SizedBox(height: 1.v),
//                                     Text(
//                                       "Issued on November 24, 2022",
//                                       style: theme.textTheme.labelLarge,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 5.v),
//             ],
//           ),
//         ),
//         bottomNavigationBar: _buildDownloadCertificate(context),
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
//         text: "3D Design Illustration",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildDownloadCertificate(BuildContext context) {
//     return CustomElevatedButton(
//       text: "Download Certificate",
//       margin: EdgeInsets.only(
//         left: 39.h,
//         right: 39.h,
//         bottom: 53.v,
//       ),
//       rightIcon: Container(
//         padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
//         margin: EdgeInsets.only(left: 30.h),
//         decoration: BoxDecoration(
//           color: appTheme.whiteA700,
//           borderRadius: BorderRadius.circular(
//             24.h,
//           ),
//         ),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgFill1Primary,
//           height: 17.v,
//         ),
//       ),
//     );
//   }
// }

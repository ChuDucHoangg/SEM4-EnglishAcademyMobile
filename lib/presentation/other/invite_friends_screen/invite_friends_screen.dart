// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class InviteFriendsScreen extends StatelessWidget {
//   const InviteFriendsScreen({Key? key})
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
//           padding: EdgeInsets.symmetric(
//             horizontal: 34.h,
//             vertical: 23.v,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildInvite5(context),
//               SizedBox(height: 15.v),
//               Text(
//                 "Share Invite Via",
//                 style: CustomTextStyles.titleMedium18,
//               ),
//               SizedBox(height: 15.v),
//               Padding(
//                 padding: EdgeInsets.only(right: 162.h),
//                 child: Row(
//                   children: [
//                     CustomImageView(
//                       imagePath: ImageConstant.imgFacebook,
//                       width: 7.h,
//                       margin: EdgeInsets.only(top: 3.v),
//                     ),
//                     Spacer(
//                       flex: 33,
//                     ),
//                     CustomImageView(
//                       imagePath: ImageConstant.imgTrash,
//                       height: 13.v,
//                       margin: EdgeInsets.only(
//                         top: 3.v,
//                         bottom: 2.v,
//                       ),
//                     ),
//                     Spacer(
//                       flex: 33,
//                     ),
//                     CustomImageView(
//                       imagePath: ImageConstant.imgGoogleRed600,
//                       height: 14.v,
//                       margin: EdgeInsets.only(top: 3.v),
//                     ),
//                     Spacer(
//                       flex: 33,
//                     ),
//                     CustomImageView(
//                       imagePath: ImageConstant.imgVolume,
//                       height: 19.adaptSize,
//                       width: 19.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 5.v),
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
//           top: 18.v,
//           bottom: 17.v,
//         ),
//       ),
//       title: AppbarSubtitle(
//         text: "Invite Frineds",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildInvite(BuildContext context) {
//     return CustomElevatedButton(
//       height: 28.v,
//       width: 80.h,
//       text: "Invite",
//       margin: EdgeInsets.only(
//         left: 18.h,
//         top: 14.v,
//         bottom: 8.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillPrimary,
//       buttonTextStyle: CustomTextStyles.labelLargeWhiteA700,
//     );
//   }
//
//   /// Section Widget
//   Widget _buildInvite1(BuildContext context) {
//     return CustomElevatedButton(
//       height: 28.v,
//       width: 80.h,
//       text: "Invite",
//       margin: EdgeInsets.only(
//         left: 27.h,
//         top: 14.v,
//         bottom: 8.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillPrimary,
//       buttonTextStyle: CustomTextStyles.labelLargeWhiteA700,
//     );
//   }
//
//   /// Section Widget
//   Widget _buildInvite2(BuildContext context) {
//     return CustomElevatedButton(
//       height: 28.v,
//       width: 80.h,
//       text: "Invite",
//       margin: EdgeInsets.only(
//         left: 30.h,
//         top: 12.v,
//         bottom: 10.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillBlueTL14,
//       buttonTextStyle: CustomTextStyles.labelLargeBluegray900_1,
//     );
//   }
//
//   /// Section Widget
//   Widget _buildInvite3(BuildContext context) {
//     return CustomElevatedButton(
//       height: 28.v,
//       width: 80.h,
//       text: "Invite",
//       margin: EdgeInsets.only(
//         top: 12.v,
//         bottom: 10.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillPrimary,
//       buttonTextStyle: CustomTextStyles.labelLargeWhiteA700,
//     );
//   }
//
//   /// Section Widget
//   Widget _buildInvite4(BuildContext context) {
//     return CustomElevatedButton(
//       height: 28.v,
//       width: 80.h,
//       text: "Invite",
//       margin: EdgeInsets.only(
//         top: 12.v,
//         bottom: 10.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillBlueTL14,
//       buttonTextStyle: CustomTextStyles.labelLargeBluegray900_1,
//     );
//   }
//
//   /// Section Widget
//   Widget _buildInvite5(BuildContext context) {
//     return SizedBox(
//       height: 461.v,
//       width: 360.h,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 22.v),
//               decoration: AppDecoration.outlineBlack9001.copyWith(
//                 borderRadius: BorderRadiusStyle.circleBorder15,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 25.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 211.h,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 height: 50.adaptSize,
//                                 width: 50.adaptSize,
//                                 decoration: BoxDecoration(
//                                   color: appTheme.black900,
//                                   borderRadius: BorderRadius.circular(
//                                     25.h,
//                                   ),
//                                   border: Border.all(
//                                     color: appTheme.blue50,
//                                     width: 2.h,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 8.h,
//                                   top: 7.v,
//                                   bottom: 2.v,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Virginia M. Patterson",
//                                       style: theme.textTheme.titleMedium,
//                                     ),
//                                     Text(
//                                       "(+1) 702-897-7965",
//                                       style: theme.textTheme.labelLarge,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         _buildInvite(context),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.v),
//                   Divider(),
//                   SizedBox(height: 20.v),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 25.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Container(
//                           height: 50.adaptSize,
//                           width: 50.adaptSize,
//                           decoration: BoxDecoration(
//                             color: appTheme.black900,
//                             borderRadius: BorderRadius.circular(
//                               25.h,
//                             ),
//                             border: Border.all(
//                               color: appTheme.blue50,
//                               width: 2.h,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 8.h,
//                             top: 6.v,
//                             bottom: 2.v,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Dominick S. Jenkins",
//                                 style: theme.textTheme.titleMedium,
//                               ),
//                               Text(
//                                 "(+1) 702-897-7965",
//                                 style: theme.textTheme.labelLarge,
//                               ),
//                             ],
//                           ),
//                         ),
//                         _buildInvite1(context),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.v),
//                   Divider(),
//                   SizedBox(height: 20.v),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 25.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 50.adaptSize,
//                           width: 50.adaptSize,
//                           decoration: BoxDecoration(
//                             color: appTheme.black900,
//                             borderRadius: BorderRadius.circular(
//                               25.h,
//                             ),
//                             border: Border.all(
//                               color: appTheme.blue50,
//                               width: 2.h,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 8.h,
//                             top: 4.v,
//                             bottom: 3.v,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Duncan E. Hoffman",
//                                 style: theme.textTheme.titleMedium,
//                               ),
//                               SizedBox(height: 1.v),
//                               Text(
//                                 "(+1)b727-688-4052",
//                                 style: theme.textTheme.labelLarge,
//                               ),
//                             ],
//                           ),
//                         ),
//                         _buildInvite2(context),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.v),
//                   Divider(),
//                   SizedBox(height: 20.v),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 25.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 50.adaptSize,
//                           width: 50.adaptSize,
//                           decoration: BoxDecoration(
//                             color: appTheme.black900,
//                             borderRadius: BorderRadius.circular(
//                               25.h,
//                             ),
//                             border: Border.all(
//                               color: appTheme.blue50,
//                               width: 2.h,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 8.h,
//                             top: 6.v,
//                             bottom: 2.v,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Roy R. McCraney",
//                                 style: theme.textTheme.titleMedium,
//                               ),
//                               Text(
//                                 "(+1) 601-897-1714",
//                                 style: theme.textTheme.labelLarge,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//                         _buildInvite3(context),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.v),
//                   Divider(),
//                   SizedBox(height: 68.v),
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 50.adaptSize,
//                         width: 50.adaptSize,
//                         decoration: BoxDecoration(
//                           color: appTheme.black900,
//                           borderRadius: BorderRadius.circular(
//                             25.h,
//                           ),
//                           border: Border.all(
//                             color: appTheme.blue50,
//                             width: 2.h,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 5.h,
//                           top: 6.v,
//                           bottom: 5.v,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Janice R. Norris",
//                               style: theme.textTheme.titleMedium,
//                             ),
//                             Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "(+1) 802-312-3206",
//                                 style: theme.textTheme.labelLarge,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       _buildInvite4(context),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20.v),
//                 Divider(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

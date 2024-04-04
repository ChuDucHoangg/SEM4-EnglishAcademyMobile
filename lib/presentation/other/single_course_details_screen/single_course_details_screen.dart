// import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
// import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
// import 'package:readmore/readmore.dart';
// import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
// import 'package:english_academy_mobile/widgets/custom_floating_button.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class SingleCourseDetailsScreen extends StatelessWidget {
//   const SingleCourseDetailsScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           width: SizeUtils.width,
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 107.v),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildAbout1(context),
//                   SizedBox(height: 25.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 34.h),
//                     child: Text(
//                       "Instructor",
//                       style: CustomTextStyles.titleMedium18,
//                     ),
//                   ),
//                   SizedBox(height: 12.v),
//                   _buildWilliamSCunningha(context),
//                   SizedBox(height: 21.v),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Divider(
//                       indent: 34.h,
//                       endIndent: 34.h,
//                     ),
//                   ),
//                   SizedBox(height: 20.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 38.h),
//                     child: Text(
//                       "What You’ll Get",
//                       style: CustomTextStyles.titleMedium18,
//                     ),
//                   ),
//                   SizedBox(height: 20.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 38.h),
//                     child: Row(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgReply,
//                           width: 16.h,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 16.h,
//                             top: 2.v,
//                           ),
//                           child: Text(
//                             "25 Lessons",
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 38.h),
//                     child: Row(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgMinimize,
//                           width: 15.h,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 16.h,
//                             top: 4.v,
//                           ),
//                           child: Text(
//                             "Access Mobile, Desktop & TV",
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 34.h),
//                     child: Row(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgIcon,
//                           height: 20.adaptSize,
//                           width: 20.adaptSize,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 14.h,
//                             top: 3.v,
//                           ),
//                           child: Text(
//                             "Beginner Level",
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 34.h),
//                     child: Row(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgIconGray90001,
//                           height: 13.v,
//                           margin: EdgeInsets.symmetric(vertical: 2.v),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 12.h),
//                           child: Text(
//                             "Audio Book",
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 27.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 34.h),
//                     child: Row(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgUserGray90001,
//                           width: 19.h,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 15.h,
//                             top: 4.v,
//                             bottom: 2.v,
//                           ),
//                           child: Text(
//                             "Lifetime Access",
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 31.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 34.h),
//                     child: Row(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgIconGray9000121x22,
//                           height: 21.v,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 11.h,
//                             top: 3.v,
//                           ),
//                           child: Text(
//                             "100 Quizzes",
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 38.h),
//                     child: Row(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgReply,
//                           width: 16.h,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 10.h,
//                             top: 3.v,
//                           ),
//                           child: Text(
//                             "Certificate of Completion",
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 29.v),
//                   _buildHEADING(context),
//                   SizedBox(height: 19.v),
//                   _buildFortyFive1(context),
//                   SizedBox(height: 22.v),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Divider(
//                       indent: 34.h,
//                       endIndent: 34.h,
//                     ),
//                   ),
//                   SizedBox(height: 25.v),
//                   _buildFortyFive3(context),
//                   SizedBox(height: 22.v),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Divider(
//                       indent: 34.h,
//                       endIndent: 34.h,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         bottomNavigationBar: _buildBUTTON(context),
//         floatingActionButton: _buildFloatingActionButton(context),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildAbout(BuildContext context) {
//     return CustomOutlinedButton(
//       height: 52.v,
//       width: 180.h,
//       text: "About",
//       buttonStyle: CustomButtonStyles.outlineBlue,
//       buttonTextStyle: CustomTextStyles.titleSmallJostBluegray900,
//     );
//   }
//
//   /// Section Widget
//   Widget _buildCurriculcum(BuildContext context) {
//     return CustomElevatedButton(
//       height: 52.v,
//       width: 180.h,
//       text: "Curriculcum",
//       buttonStyle: CustomButtonStyles.fillBlue1,
//       buttonTextStyle: CustomTextStyles.titleSmallJostBluegray900,
//     );
//   }
//
//   /// Section Widget
//   Widget _buildAbout1(BuildContext context) {
//     return SizedBox(
//       height: 745.v,
//       width: double.maxFinite,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 35.h,
//                 vertical: 30.v,
//               ),
//               decoration: AppDecoration.fillBlack,
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgArrowDown,
//                 height: 20.v,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 34.h),
//               padding: EdgeInsets.symmetric(vertical: 25.v),
//               decoration: AppDecoration.outlineBlack9001.copyWith(
//                 borderRadius: BorderRadiusStyle.circleBorder15,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(height: 30.v),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 20.h,
//                       right: 24.h,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Graphic Design",
//                           style: CustomTextStyles.labelLargeOrangeA700,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CustomImageView(
//                               imagePath: ImageConstant.imgSignalAmberA20001,
//                               height: 12.adaptSize,
//                               width: 12.adaptSize,
//                               margin: EdgeInsets.only(bottom: 2.v),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(left: 3.h),
//                               child: Text(
//                                 "4.2",
//                                 style: theme.textTheme.labelMedium,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 6.v),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 20.h),
//                       child: Text(
//                         "Design Principles: Organizing ..",
//                         style: CustomTextStyles.titleLarge20,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 6.v),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 20.h,
//                       right: 24.h,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgUpload,
//                           height: 19.adaptSize,
//                           width: 19.adaptSize,
//                           margin: EdgeInsets.only(
//                             top: 4.v,
//                             bottom: 3.v,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 8.h,
//                             top: 7.v,
//                             bottom: 5.v,
//                           ),
//                           child: Text(
//                             "21 Class",
//                             style: theme.textTheme.labelMedium,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 10.h,
//                             top: 7.v,
//                           ),
//                           child: Text(
//                             "|",
//                             style: CustomTextStyles.titleSmallBlack900,
//                           ),
//                         ),
//                         Container(
//                           height: 16.adaptSize,
//                           width: 16.adaptSize,
//                           margin: EdgeInsets.only(
//                             left: 10.h,
//                             top: 6.v,
//                             bottom: 4.v,
//                           ),
//                           padding: EdgeInsets.all(4.h),
//                           decoration: AppDecoration.fillGray900,
//                           child: CustomImageView(
//                             imagePath: ImageConstant.imgFill3,
//                             width: 4.h,
//                             alignment: Alignment.topRight,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 8.h,
//                             top: 8.v,
//                             bottom: 4.v,
//                           ),
//                           child: Text(
//                             "42 Hours",
//                             style: theme.textTheme.labelMedium,
//                           ),
//                         ),
//                         Spacer(),
//                         Text(
//                           "28",
//                           style: CustomTextStyles.titleLargeMulishPrimary,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 7.v),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildAbout(context),
//                       _buildCurriculcum(context),
//                     ],
//                   ),
//                   SizedBox(height: 17.v),
//                   Container(
//                     width: 307.h,
//                     margin: EdgeInsets.only(
//                       left: 20.h,
//                       right: 31.h,
//                     ),
//                     child: Text(
//                       "Graphic Design now a popular profession graphic design by off your carrer about tantas regiones barbarorum pedibus obiit",
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       style: CustomTextStyles.labelLargeGray500.copyWith(
//                         height: 1.46,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 17.v),
//                   SizedBox(
//                     width: 313.h,
//                     child: ReadMoreText(
//                       "Graphic Design n a popular profession l Cur tantas regiones barbarorum pedibus obiit, maria transmi Et ne nimium beatus est; Addidisti ad extremum etiam ",
//                       trimLines: 4,
//                       colorClickableText: theme.colorScheme.primary,
//                       trimMode: TrimMode.Line,
//                       trimCollapsedText: "Read More",
//                       moreStyle: CustomTextStyles.labelLargeGray500.copyWith(
//                         height: 1.46,
//                       ),
//                       lessStyle: CustomTextStyles.labelLargeGray500.copyWith(
//                         height: 1.46,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 321.v,
//               right: 49.h,
//             ),
//             child: CustomIconButton(
//               height: 63.adaptSize,
//               width: 63.adaptSize,
//               padding: EdgeInsets.all(18.h),
//               decoration: IconButtonStyleHelper.outlineBlackTL31,
//               alignment: Alignment.topRight,
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgGroup6,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildWilliamSCunningha(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 34.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             CustomImageView(
//               imagePath: ImageConstant.imgImageBg,
//               height: 54.adaptSize,
//               width: 54.adaptSize,
//               radius: BorderRadius.circular(
//                 27.h,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 left: 12.h,
//                 top: 7.v,
//                 bottom: 4.v,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "William S. Cunningham",
//                     style: CustomTextStyles.titleMedium17,
//                   ),
//                   Text(
//                     "Graphic Design",
//                     style: theme.textTheme.labelLarge,
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             CustomImageView(
//               imagePath: ImageConstant.imgNavIndox,
//               height: 20.adaptSize,
//               width: 20.adaptSize,
//               margin: EdgeInsets.only(
//                 top: 19.v,
//                 bottom: 15.v,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildHEADING(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 34.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Reviews",
//               style: CustomTextStyles.titleMedium18,
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: 6.v,
//                 bottom: 4.v,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "See All".toUpperCase(),
//                     style: CustomTextStyles.labelLargePrimary,
//                   ),
//                   CustomImageView(
//                     imagePath: ImageConstant.imgArrowRightPrimary,
//                     width: 5.h,
//                     margin: EdgeInsets.only(
//                       left: 10.h,
//                       top: 2.v,
//                       bottom: 3.v,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFortyFive(BuildContext context) {
//     return CustomOutlinedButton(
//       height: 26.v,
//       width: 60.h,
//       text: "4.5",
//       leftIcon: Container(
//         margin: EdgeInsets.only(right: 2.h),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgSignalAmber700,
//           height: 12.adaptSize,
//           width: 12.adaptSize,
//         ),
//       ),
//       buttonTextStyle: CustomTextStyles.labelLargeJostBluegray900,
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFortyFive1(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 34.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomImageView(
//               imagePath: ImageConstant.imgImageBg46x46,
//               height: 46.adaptSize,
//               width: 46.adaptSize,
//               radius: BorderRadius.circular(
//                 23.h,
//               ),
//               margin: EdgeInsets.only(
//                 top: 3.v,
//                 bottom: 65.v,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.only(left: 12.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 1.v),
//                           child: Text(
//                             "William S. Cunningham",
//                             style: CustomTextStyles.titleMedium17,
//                           ),
//                         ),
//                         _buildFortyFive(context),
//                       ],
//                     ),
//                     SizedBox(height: 8.v),
//                     Container(
//                       width: 295.h,
//                       margin: EdgeInsets.only(right: 5.h),
//                       child: Text(
//                         "The Course is Very Good dolor sit amet, consect tur adipiscing elit. Naturales divitias dixit parab les esse, quod parvo",
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: theme.textTheme.labelLarge!.copyWith(
//                           height: 1.38,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7.v),
//                     _buildFavorite(
//                       context,
//                       fiveHundredSeventyEight: "578",
//                       weeksAgos: "2 Weeks Agos",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFortyFive2(BuildContext context) {
//     return CustomOutlinedButton(
//       height: 26.v,
//       width: 60.h,
//       text: "4.5",
//       leftIcon: Container(
//         margin: EdgeInsets.only(right: 2.h),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgSignalAmber700,
//           height: 12.adaptSize,
//           width: 12.adaptSize,
//         ),
//       ),
//       buttonTextStyle: CustomTextStyles.labelLargeJostBluegray900,
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFortyFive3(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 34.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomImageView(
//               imagePath: ImageConstant.imgImageBg1,
//               height: 46.adaptSize,
//               width: 46.adaptSize,
//               radius: BorderRadius.circular(
//                 23.h,
//               ),
//               margin: EdgeInsets.only(
//                 top: 3.v,
//                 bottom: 65.v,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.only(left: 12.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 1.v),
//                           child: Text(
//                             "Martha E. Thompson",
//                             style: CustomTextStyles.titleMedium17,
//                           ),
//                         ),
//                         _buildFortyFive2(context),
//                       ],
//                     ),
//                     SizedBox(height: 8.v),
//                     Container(
//                       width: 295.h,
//                       margin: EdgeInsets.only(right: 5.h),
//                       child: Text(
//                         "The Course is Very Good dolor sit amet, consect tur adipiscing elit. Naturales divitias dixit parab les esse, quod parvo",
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: theme.textTheme.labelLarge!.copyWith(
//                           height: 1.38,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7.v),
//                     _buildFavorite(
//                       context,
//                       fiveHundredSeventyEight: "578",
//                       weeksAgos: "2 Weeks Agos",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildBUTTON(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(
//         left: 107.h,
//         right: 162.h,
//         bottom: 63.v,
//       ),
//       decoration: AppDecoration.outlineBlack.copyWith(
//         borderRadius: BorderRadiusStyle.circleBorder30,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             "Enroll Course - 55",
//             style: CustomTextStyles.titleMediumWhiteA700,
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFloatingActionButton(BuildContext context) {
//     return CustomFloatingButton(
//       height: 48,
//       width: 48,
//       backgroundColor: appTheme.whiteA700,
//       child: CustomImageView(
//         imagePath: ImageConstant.imgFill1Primary,
//         height: 24.0.v,
//         width: 24.0.h,
//       ),
//     );
//   }
//
//   /// Common widget
//   Widget _buildFavorite(
//       BuildContext context, {
//         required String fiveHundredSeventyEight,
//         required String weeksAgos,
//       }) {
//     return Row(
//       children: [
//         CustomImageView(
//           imagePath: ImageConstant.imgFavorite,
//           height: 16.v,
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 8.h),
//           child: Text(
//             fiveHundredSeventyEight,
//             style: CustomTextStyles.labelLargeBluegray900.copyWith(
//               color: appTheme.blueGray900,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 22.h),
//           child: Text(
//             weeksAgos,
//             style: CustomTextStyles.labelLargeBluegray900.copyWith(
//               color: appTheme.blueGray900,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

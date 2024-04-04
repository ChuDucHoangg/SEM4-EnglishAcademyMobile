// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
// import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
// import 'package:english_academy_mobile/presentation/single_mentor_details_rating_page/single_mentor_details_rating_page.dart';
// import 'package:english_academy_mobile/presentation/single_mentor_details_page/single_mentor_details_page.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class SingleMentorDetailsTabContainerScreen extends StatefulWidget {
//   const SingleMentorDetailsTabContainerScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   @override
//   SingleMentorDetailsTabContainerScreenState createState() =>
//       SingleMentorDetailsTabContainerScreenState();
// }
//
// class SingleMentorDetailsTabContainerScreenState
//     extends State<SingleMentorDetailsTabContainerScreen>
//     with TickerProviderStateMixin {
//   late TabController tabviewController;
//
//   @override
//   void initState() {
//     super.initState();
//     tabviewController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appTheme.whiteA700,
//         body: SizedBox(
//           width: double.maxFinite,
//           child: SingleChildScrollView(
//             child: SizedBox(
//               height: 882.v,
//               width: double.maxFinite,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       decoration: AppDecoration.fillGray,
//                       child: _buildFifty(context),
//                     ),
//                   ),
//                   _buildFortyNine(context),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFifty(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 30.v),
//       decoration: AppDecoration.outlineBlack9002,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CustomAppBar(
//             height: 20.v,
//             leadingWidth: double.maxFinite,
//             leading: AppbarLeadingImage(
//               imagePath: ImageConstant.imgFill1BlueGray900,
//               margin: EdgeInsets.only(
//                 left: 35.h,
//                 right: 367.h,
//               ),
//             ),
//           ),
//           SizedBox(height: 22.v),
//           Container(
//             height: 120.adaptSize,
//             width: 120.adaptSize,
//             decoration: BoxDecoration(
//               color: appTheme.black900,
//               borderRadius: BorderRadius.circular(
//                 60.h,
//               ),
//             ),
//           ),
//           SizedBox(height: 8.v),
//           Text(
//             "Christopher J. Levine",
//             style: theme.textTheme.titleLarge,
//           ),
//           Text(
//             "Graphic Designer At Google",
//             style: theme.textTheme.labelLarge,
//           ),
//           SizedBox(height: 8.v),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 69.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "26",
//                       style: CustomTextStyles.titleMedium17,
//                     ),
//                     Text(
//                       "Courses",
//                       style: theme.textTheme.labelLarge,
//                     ),
//                   ],
//                 ),
//                 Spacer(
//                   flex: 49,
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "15800",
//                       style: CustomTextStyles.titleMedium17,
//                     ),
//                     Text(
//                       "Students",
//                       style: theme.textTheme.labelLarge,
//                     ),
//                   ],
//                 ),
//                 Spacer(
//                   flex: 50,
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "8750",
//                       style: CustomTextStyles.titleMedium17,
//                     ),
//                     SizedBox(height: 1.v),
//                     Text(
//                       "Ratings",
//                       style: theme.textTheme.labelLarge,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20.v),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 34.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomOutlinedButton(
//                   width: 170.h,
//                   text: "Follow",
//                   buttonStyle: CustomButtonStyles.outlineBlueGrayTL30,
//                 ),
//                 CustomElevatedButton(
//                   width: 170.h,
//                   text: "Message",
//                   margin: EdgeInsets.only(left: 20.h),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFortyNine(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 34.h),
//         decoration: AppDecoration.outlineBlack9001.copyWith(
//           borderRadius: BorderRadiusStyle.circleBorder15,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 291.h,
//               margin: EdgeInsets.symmetric(horizontal: 34.h),
//               child: Text(
//                 "Sed quanta s alias nunc tantum possitne tanta Nec vero sum nescius esse utilitatem in historia non modo voluptatem.",
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.center,
//                 style: CustomTextStyles.labelLargeGray500,
//               ),
//             ),
//             SizedBox(height: 14.v),
//             Container(
//               height: 52.v,
//               width: 360.h,
//               child: TabBar(
//                 controller: tabviewController,
//                 labelPadding: EdgeInsets.zero,
//                 labelColor: appTheme.blueGray900,
//                 labelStyle: TextStyle(
//                   fontSize: 15.fSize,
//                   fontFamily: 'Jost',
//                   fontWeight: FontWeight.w600,
//                 ),
//                 unselectedLabelColor: appTheme.blueGray900,
//                 unselectedLabelStyle: TextStyle(
//                   fontSize: 15.fSize,
//                   fontFamily: 'Jost',
//                   fontWeight: FontWeight.w600,
//                 ),
//                 indicator: BoxDecoration(
//                   color: appTheme.blue50,
//                 ),
//                 tabs: [
//                   Tab(
//                     child: Text(
//                       "Couses",
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       "Ratings",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 323.v,
//               child: TabBarView(
//                 controller: tabviewController,
//                 children: [
//                   SingleMentorDetailsRatingPage(),
//                   SingleMentorDetailsPage(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:english_academy_mobile/presentation/single_course_details_curriculcum_page/single_course_details_curriculcum_page.dart';
// import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class SingleCourseDetailsCurriculcumTabContainerScreen extends StatefulWidget {
//   const SingleCourseDetailsCurriculcumTabContainerScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   @override
//   SingleCourseDetailsCurriculcumTabContainerScreenState createState() =>
//       SingleCourseDetailsCurriculcumTabContainerScreenState();
// }
//
// class SingleCourseDetailsCurriculcumTabContainerScreenState
//     extends State<SingleCourseDetailsCurriculcumTabContainerScreen>
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
//             child: Container(
//               height: 882.v,
//               width: double.maxFinite,
//               decoration: AppDecoration.fillGray,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   _buildFiftyFour(context),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 34.h),
//                       decoration: AppDecoration.outlineBlack9001.copyWith(
//                         borderRadius: BorderRadiusStyle.circleBorder15,
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: 20.h,
//                               right: 24.h,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Graphic Design",
//                                   style: CustomTextStyles.labelLargeOrangeA700,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     CustomImageView(
//                                       imagePath:
//                                       ImageConstant.imgSignalAmberA20001,
//                                       height: 12.adaptSize,
//                                       width: 12.adaptSize,
//                                       margin: EdgeInsets.only(bottom: 2.v),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(left: 3.h),
//                                       child: Text(
//                                         "4.2",
//                                         style: theme.textTheme.labelMedium,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 6.v),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 20.h),
//                               child: Text(
//                                 "Design Principles: Organizing ..",
//                                 style: CustomTextStyles.titleLarge20,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 6.v),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: 20.h,
//                               right: 24.h,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 CustomImageView(
//                                   imagePath: ImageConstant.imgUpload,
//                                   height: 19.adaptSize,
//                                   width: 19.adaptSize,
//                                   margin: EdgeInsets.only(
//                                     top: 4.v,
//                                     bottom: 3.v,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     left: 8.h,
//                                     top: 7.v,
//                                     bottom: 5.v,
//                                   ),
//                                   child: Text(
//                                     "21 Class",
//                                     style: theme.textTheme.labelMedium,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     left: 10.h,
//                                     top: 7.v,
//                                   ),
//                                   child: Text(
//                                     "|",
//                                     style: CustomTextStyles.titleSmallBlack900,
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 16.adaptSize,
//                                   width: 16.adaptSize,
//                                   margin: EdgeInsets.only(
//                                     left: 10.h,
//                                     top: 6.v,
//                                     bottom: 4.v,
//                                   ),
//                                   padding: EdgeInsets.all(4.h),
//                                   decoration: AppDecoration.fillGray900,
//                                   child: CustomImageView(
//                                     imagePath: ImageConstant.imgFill3,
//                                     width: 4.h,
//                                     alignment: Alignment.topRight,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     left: 8.h,
//                                     top: 8.v,
//                                     bottom: 4.v,
//                                   ),
//                                   child: Text(
//                                     "42 Hours",
//                                     style: theme.textTheme.labelMedium,
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Text(
//                                   "28",
//                                   style:
//                                   CustomTextStyles.titleLargeMulishPrimary,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 7.v),
//                           _buildTabview(context),
//                           _buildTabBarView(context),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 321.v,
//                       right: 49.h,
//                     ),
//                     child: CustomIconButton(
//                       height: 63.adaptSize,
//                       width: 63.adaptSize,
//                       padding: EdgeInsets.all(18.h),
//                       decoration: IconButtonStyleHelper.outlineBlackTL31,
//                       alignment: Alignment.topRight,
//                       child: CustomImageView(
//                         imagePath: ImageConstant.imgGroup6,
//                       ),
//                     ),
//                   ),
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
//   Widget _buildFiftyFour(BuildContext context) {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 35.h,
//           vertical: 30.v,
//         ),
//         decoration: AppDecoration.fillBlack,
//         child: CustomImageView(
//           imagePath: ImageConstant.imgArrowDown,
//           height: 20.v,
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildTabview(BuildContext context) {
//     return Container(
//       height: 52.v,
//       width: 360.h,
//       child: TabBar(
//         controller: tabviewController,
//         labelPadding: EdgeInsets.zero,
//         labelColor: appTheme.blueGray900,
//         labelStyle: TextStyle(
//           fontSize: 15.fSize,
//           fontFamily: 'Jost',
//           fontWeight: FontWeight.w600,
//         ),
//         unselectedLabelColor: appTheme.blueGray900,
//         unselectedLabelStyle: TextStyle(
//           fontSize: 15.fSize,
//           fontFamily: 'Jost',
//           fontWeight: FontWeight.w600,
//         ),
//         indicator: BoxDecoration(
//           color: appTheme.gray50,
//           border: Border.all(
//             color: appTheme.blue50,
//             width: 2.h,
//           ),
//         ),
//         tabs: [
//           Tab(
//             child: Text(
//               "About",
//             ),
//           ),
//           Tab(
//             child: Text(
//               "Curriculcum",
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildTabBarView(BuildContext context) {
//     return SizedBox(
//       height: 359.v,
//       child: TabBarView(
//         controller: tabviewController,
//         children: [
//           SingleCourseDetailsCurriculcumPage(),
//           SingleCourseDetailsCurriculcumPage(),
//         ],
//       ),
//     );
//   }
// }

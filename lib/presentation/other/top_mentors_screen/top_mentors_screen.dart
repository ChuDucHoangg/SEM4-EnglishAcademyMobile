// import 'package:english_academy_mobile/presentation/popular_courses_page/popular_courses_page.dart';
// import 'package:english_academy_mobile/presentation/my_course_completed_page/course_screen.dart';
// import 'package:english_academy_mobile/presentation/indox_chats_page/indox_screen.dart';
// import 'package:english_academy_mobile/presentation/transactions_page/transactions_screen.dart';
// import 'package:english_academy_mobile/presentation/profiles_page/profiles_screen.dart';
// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
// import 'widgets/williamkolivas_item_widget.dart';
// import 'package:english_academy_mobile/widgets/custom_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class TopMentorsScreen extends StatelessWidget {
//   TopMentorsScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: _buildAppBar(context),
//         body: SizedBox(
//           width: double.maxFinite,
//           child: Column(
//             children: [
//               SizedBox(height: 29.v),
//               _buildWilliamKOlivas(context),
//               SizedBox(height: 20.v),
//               _buildInbox(context),
//             ],
//           ),
//         ),
//         // bottomNavigationBar: Padding(
//         //   padding: EdgeInsets.only(
//         //     left: 36.h,
//         //     right: 31.h,
//         //   ),
//         //   child: _buildBottomBar(context),
//         // ),
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
//         text: "Top Mentors",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//       actions: [
//         AppbarTrailingImage(
//           imagePath: ImageConstant.imgQrcodePrimarycontainer,
//           margin: EdgeInsets.fromLTRB(34.h, 17.v, 34.h, 18.v),
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildWilliamKOlivas(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 34.h,
//         right: 31.h,
//       ),
//       child: ListView.separated(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         separatorBuilder: (
//             context,
//             index,
//             ) {
//           return Padding(
//             padding: EdgeInsets.symmetric(vertical: 13.0.v),
//             child: SizedBox(
//               width: 360.h,
//               child: Divider(
//                 height: 1.v,
//                 thickness: 1.v,
//                 color: appTheme.blue50,
//               ),
//             ),
//           );
//         },
//         itemCount: 6,
//         itemBuilder: (context, index) {
//           return WilliamkolivasItemWidget();
//         },
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildInbox(BuildContext context) {
//     return SizedBox(
//       height: 112.v,
//       width: double.maxFinite,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Container(
//               height: 66.adaptSize,
//               width: 66.adaptSize,
//               margin: EdgeInsets.only(left: 34.h),
//               decoration: BoxDecoration(
//                 color: appTheme.black900,
//                 borderRadius: BorderRadius.circular(
//                   33.h,
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: double.maxFinite,
//               margin: EdgeInsets.only(top: 12.v),
//               padding: EdgeInsets.symmetric(vertical: 20.v),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 24.v),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 19.v,
//                           width: 18.h,
//                           child: Stack(
//                             alignment: Alignment.centerRight,
//                             children: [
//                               CustomImageView(
//                                 imagePath: ImageConstant.imgInbox,
//                                 width: 8.h,
//                                 alignment: Alignment.bottomLeft,
//                               ),
//                               CustomImageView(
//                                 imagePath: ImageConstant.imgNavHome,
//                                 width: 13.h,
//                                 alignment: Alignment.centerRight,
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 4.v),
//                         Text(
//                           "Home".toUpperCase(),
//                           style: CustomTextStyles.labelSmallTeal700,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 24.v),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgNavMyCourses,
//                           width: 18.h,
//                           margin: EdgeInsets.only(left: 21.h),
//                         ),
//                         SizedBox(height: 4.v),
//                         Text(
//                           "My Courses".toUpperCase(),
//                           style: theme.textTheme.labelSmall,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 24.v),
//                     child: Column(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgNavIndox,
//                           height: 20.adaptSize,
//                           width: 20.adaptSize,
//                         ),
//                         SizedBox(height: 4.v),
//                         Text(
//                           "Indox".toUpperCase(),
//                           style: theme.textTheme.labelSmall,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 24.v),
//                     child: Column(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgNavTransaction,
//                           height: 19.v,
//                         ),
//                         SizedBox(height: 4.v),
//                         Text(
//                           "Transaction".toUpperCase(),
//                           style: theme.textTheme.labelSmall,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 24.v),
//                     child: Column(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgNavProfile,
//                           width: 16.h,
//                         ),
//                         SizedBox(height: 4.v),
//                         Text(
//                           "Profile".toUpperCase(),
//                           style: theme.textTheme.labelSmall,
//                         ),
//                       ],
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
//
//   /// Section Widget
//   // Widget _buildBottomBar(BuildContext context) {
//   //   return CustomBottomBar(
//   //     onChanged: (BottomBarEnum type) {
//   //       Navigator.pushNamed(
//   //           navigatorKey.currentContext!, getCurrentRoute(type));
//   //     },
//   //   );
//   // }
//   //
//   // ///Handling route based on bottom click actions
//   // String getCurrentRoute(BottomBarEnum type) {
//   //   switch (type) {
//   //     case BottomBarEnum.Home:
//   //       return AppRoutes.popularCoursesPage;
//   //     case BottomBarEnum.Mycourses:
//   //       return AppRoutes.myCourseCompletedPage;
//   //     case BottomBarEnum.Indox:
//   //       return AppRoutes.indoxChatsPage;
//   //     case BottomBarEnum.Transaction:
//   //       return AppRoutes.transactionsPage;
//   //     case BottomBarEnum.Profile:
//   //       return AppRoutes.profilesPage;
//   //     default:
//   //       return "/";
//   //   }
//   // }
//   //
//   // ///Handling page based on route
//   // Widget getCurrentPage(String currentRoute) {
//   //   switch (currentRoute) {
//   //     case AppRoutes.popularCoursesPage:
//   //       return PopularCoursesPage();
//   //     case AppRoutes.myCourseCompletedPage:
//   //       return MyCourseCompletedPage();
//   //     case AppRoutes.indoxChatsPage:
//   //       return IndoxChatsPage();
//   //     case AppRoutes.transactionsPage:
//   //       return TransactionsPage();
//   //     case AppRoutes.profilesPage:
//   //       return ProfilesPage();
//   //     default:
//   //       return DefaultWidget();
//   //   }
//   // }
// }

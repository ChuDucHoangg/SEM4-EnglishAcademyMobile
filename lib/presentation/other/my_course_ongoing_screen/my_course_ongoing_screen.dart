// import 'package:english_academy_mobile/presentation/popular_courses_page/popular_courses_page.dart';
// import 'package:english_academy_mobile/presentation/my_course_completed_page/course_screen.dart';
// import 'package:english_academy_mobile/presentation/indox_chats_page/indox_screen.dart';
// import 'package:english_academy_mobile/presentation/transactions_page/transactions_screen.dart';
// import 'package:english_academy_mobile/presentation/profiles_page/profiles_screen.dart';
// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
// import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
// import 'widgets/uiuxdesign_item_widget.dart';
// import 'package:english_academy_mobile/widgets/custom_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class MyCourseOngoingScreen extends StatelessWidget {
//   MyCourseOngoingScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   TextEditingController searchController = TextEditingController();
//
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(context),
//         body: Container(
//           width: double.maxFinite,
//           padding: EdgeInsets.symmetric(horizontal: 34.h),
//           child: Column(
//             children: [
//               SizedBox(height: 2.v),
//               CustomTextFormField(
//                 controller: searchController,
//                 hintText: "Search for …",
//                 hintStyle: CustomTextStyles.titleMediumMulishBluegray200,
//                 textInputAction: TextInputAction.done,
//                 suffix: Container(
//                   padding: EdgeInsets.all(9.h),
//                   margin: EdgeInsets.fromLTRB(30.h, 13.v, 10.h, 13.v),
//                   decoration: BoxDecoration(
//                     color: theme.colorScheme.primary,
//                     borderRadius: BorderRadius.circular(
//                       10.h,
//                     ),
//                   ),
//                   child: CustomImageView(
//                     imagePath: ImageConstant.imgContrastWhiteA700,
//                     height: 20.adaptSize,
//                     width: 20.adaptSize,
//                   ),
//                 ),
//                 suffixConstraints: BoxConstraints(
//                   maxHeight: 64.v,
//                 ),
//                 contentPadding: EdgeInsets.only(
//                   left: 15.h,
//                   top: 21.v,
//                   bottom: 21.v,
//                 ),
//                 borderDecoration: TextFormFieldStyleHelper.outlineBlackTL15,
//               ),
//               SizedBox(height: 20.v),
//               _buildCategory(context),
//               SizedBox(height: 20.v),
//               _buildUIUXDesign(context),
//             ],
//           ),
//         ),
//         // bottomNavigationBar: _buildBottomBar(context),
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
//         text: "My Courses",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildCategory(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//           child: CustomElevatedButton(
//             height: 48.v,
//             text: "Completed",
//             margin: EdgeInsets.only(right: 10.h),
//             buttonStyle: CustomButtonStyles.fillBlue,
//             buttonTextStyle: CustomTextStyles.titleSmallBluegray900ExtraBold15,
//           ),
//         ),
//         Expanded(
//           child: CustomElevatedButton(
//             height: 48.v,
//             text: "Ongoing",
//             margin: EdgeInsets.only(left: 10.h),
//             buttonStyle: CustomButtonStyles.fillTeal,
//             buttonTextStyle: CustomTextStyles.titleSmallWhiteA700ExtraBold,
//           ),
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildUIUXDesign(BuildContext context) {
//     return ListView.separated(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       separatorBuilder: (
//           context,
//           index,
//           ) {
//         return SizedBox(
//           height: 20.v,
//         );
//       },
//       itemCount: 4,
//       itemBuilder: (context, index) {
//         return UiuxdesignItemWidget();
//       },
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
//
//   ///Handling page based on route
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

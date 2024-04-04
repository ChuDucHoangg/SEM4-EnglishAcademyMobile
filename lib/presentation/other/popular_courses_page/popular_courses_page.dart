// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
// import 'widgets/graphicdesign1_item_widget.dart';
// import 'widgets/category_item_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class PopularCoursesPage extends StatelessWidget {
//   const PopularCoursesPage({Key? key})
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
//         body: SizedBox(
//           height: 713.v,
//           width: double.maxFinite,
//           child: Stack(
//             alignment: Alignment.topRight,
//             children: [
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 34.h),
//                   decoration: AppDecoration.fillGray,
//                   child: _buildGraphicDesign(context),
//                 ),
//               ),
//               _buildCategory(context),
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
//         text: "Popular Courses",
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
//   Widget _buildGraphicDesign(BuildContext context) {
//     return ListView.separated(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       separatorBuilder: (
//           context,
//           index,
//           ) {
//         return SizedBox(
//           height: 16.v,
//         );
//       },
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return Graphicdesign1ItemWidget();
//       },
//     );
//   }
//
//   /// Section Widget
//   Widget _buildCategory(BuildContext context) {
//     return Align(
//       alignment: Alignment.topRight,
//       child: Container(
//         height: 713.v,
//         padding: EdgeInsets.symmetric(vertical: 4.v),
//         child: ListView.separated(
//           padding: EdgeInsets.only(
//             left: 34.h,
//             top: 22.v,
//             bottom: 661.v,
//           ),
//           scrollDirection: Axis.horizontal,
//           separatorBuilder: (
//               context,
//               index,
//               ) {
//             return SizedBox(
//               width: 50.h,
//             );
//           },
//           itemCount: 4,
//           itemBuilder: (context, index) {
//             return CategoryItemWidget();
//           },
//         ),
//       ),
//     );
//   }
// }

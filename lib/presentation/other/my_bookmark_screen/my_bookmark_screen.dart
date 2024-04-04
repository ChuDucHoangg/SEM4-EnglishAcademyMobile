// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'widgets/graphicdesign3_item_widget.dart';
// import 'widgets/category1_item_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class MyBookmarkScreen extends StatelessWidget {
//   const MyBookmarkScreen({Key? key})
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
//           width: SizeUtils.width,
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(top: 26.v),
//             child: Container(
//               height: 770.v,
//               width: 394.h,
//               margin: EdgeInsets.only(
//                 left: 34.h,
//                 bottom: 5.v,
//               ),
//               child: Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Container(
//                       margin: EdgeInsets.only(right: 34.h),
//                       decoration: AppDecoration.fillGray,
//                       child: _buildGraphicDesign(context),
//                     ),
//                   ),
//                   _buildCategory(context),
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
//         text: "My Bookmark",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
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
//         return Graphicdesign3ItemWidget();
//       },
//     );
//   }
//
//   /// Section Widget
//   Widget _buildCategory(BuildContext context) {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: Container(
//         height: 770.v,
//         padding: EdgeInsets.symmetric(vertical: 4.v),
//         child: ListView.separated(
//           padding: EdgeInsets.only(bottom: 740.v),
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
//             return Category1ItemWidget();
//           },
//         ),
//       ),
//     );
//   }
// }

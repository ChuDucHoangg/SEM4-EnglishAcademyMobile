// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_rating_bar.dart';
// import 'widgets/fortytwo1_item_widget.dart';
// import 'widgets/category2_item_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class ReviewsScreen extends StatelessWidget {
//   const ReviewsScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appTheme.whiteA700,
//         body: SizedBox(
//           height: 882.v,
//           width: double.maxFinite,
//           child: Stack(
//             alignment: Alignment.topRight,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 25.v),
//                   decoration: AppDecoration.fillGray,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       _buildAppBar(context),
//                       SizedBox(
//                         height: 64.v,
//                         width: 102.h,
//                         child: Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                             Align(
//                               alignment: Alignment.topCenter,
//                               child: Text(
//                                 "4.8",
//                                 style: theme.textTheme.displaySmall,
//                               ),
//                             ),
//                             CustomRatingBar(
//                               alignment: Alignment.bottomCenter,
//                               initialRating: 4,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 3.v),
//                       Text(
//                         "Based on 448 Reviews",
//                         style: theme.textTheme.labelLarge,
//                       ),
//                       SizedBox(height: 71.v),
//                       _buildFortyTwo(context),
//                       SizedBox(height: 12.v),
//                     ],
//                   ),
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
//       height: 30.v,
//       leadingWidth: 61.h,
//       leading: AppbarLeadingImage(
//         imagePath: ImageConstant.imgArrowDown,
//         margin: EdgeInsets.only(
//           left: 35.h,
//           top: 5.v,
//           bottom: 5.v,
//         ),
//       ),
//       title: AppbarSubtitle(
//         text: "Reviews",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFortyTwo(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 34.h),
//       child: ListView.separated(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         separatorBuilder: (
//             context,
//             index,
//             ) {
//           return SizedBox(
//             height: 15.v,
//           );
//         },
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           return Fortytwo1ItemWidget();
//         },
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildCategory(BuildContext context) {
//     return Align(
//       alignment: Alignment.topRight,
//       child: Container(
//         height: 882.v,
//         padding: EdgeInsets.symmetric(vertical: 4.v),
//         child: ListView.separated(
//           padding: EdgeInsets.only(
//             left: 35.h,
//             top: 160.v,
//             bottom: 692.v,
//           ),
//           scrollDirection: Axis.horizontal,
//           separatorBuilder: (
//               context,
//               index,
//               ) {
//             return SizedBox(
//               width: 46.h,
//             );
//           },
//           itemCount: 5,
//           itemBuilder: (context, index) {
//             return Category2ItemWidget();
//           },
//         ),
//       ),
//     );
//   }
// }

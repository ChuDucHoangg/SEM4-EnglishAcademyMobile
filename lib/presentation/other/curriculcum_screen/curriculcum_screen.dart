// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'widgets/sectionintrodu_item_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class CurriculcumScreen extends StatelessWidget {
//   CurriculcumScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   List sectionintroduItemList = [
//     {'id': 1, 'groupBy': "Section 01 - Introducation"},
//     {'id': 2, 'groupBy': "Section 01 - Introducation"},
//     {'id': 3, 'groupBy': "Section 02 - Graphic Design"},
//     {'id': 4, 'groupBy': "Section 02 - Graphic Design"},
//     {'id': 5, 'groupBy': "Section 02 - Graphic Design"},
//     {'id': 6, 'groupBy': "Section 02 - Graphic Design"},
//     {'id': 7, 'groupBy': "Section 02 - Graphic Design"},
//     {'id': 8, 'groupBy': "Section 02 - Graphic Design"},
//     {'id': 9, 'groupBy': "Section 02 - Graphic Design"}
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: _buildAppBar(context),
//         body: Container(
//           height: 954.v,
//           width: double.maxFinite,
//           padding: EdgeInsets.symmetric(
//             horizontal: 34.h,
//             vertical: 29.v,
//           ),
//           child: Stack(
//             alignment: Alignment.topCenter,
//             children: [
//               CustomElevatedButton(
//                 width: 350.h,
//                 text: "Enroll Course - 55",
//                 margin: EdgeInsets.only(bottom: 5.v),
//                 rightIcon: Container(
//                   padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
//                   margin: EdgeInsets.only(left: 30.h),
//                   decoration: BoxDecoration(
//                     color: appTheme.whiteA700,
//                     borderRadius: BorderRadius.circular(
//                       24.h,
//                     ),
//                   ),
//                   child: CustomImageView(
//                     imagePath: ImageConstant.imgFill1Primary,
//                     height: 17.v,
//                   ),
//                 ),
//                 alignment: Alignment.bottomCenter,
//               ),
//               _buildSectionIntrodu(context),
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
//         text: "Curriculcum",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildSectionIntrodu(BuildContext context) {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: Padding(
//         padding: EdgeInsets.only(bottom: 68.v),
//         child: GroupedListView<dynamic, String>(
//           shrinkWrap: true,
//           stickyHeaderBackgroundColor: Colors.transparent,
//           elements: sectionintroduItemList,
//           groupBy: (element) => element['groupBy'],
//           sort: false,
//           groupSeparatorBuilder: (String value) {
//             return Padding(
//               padding: EdgeInsets.only(
//                 top: 26.v,
//                 bottom: 19.v,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Section 01 - ",
//                               style: CustomTextStyles.titleSmallJostff202244,
//                             ),
//                             TextSpan(
//                               text: "Introducation",
//                               style: CustomTextStyles.titleSmallJostff0961f5,
//                             ),
//                           ],
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 86.h,
//                           top: 3.v,
//                           bottom: 2.v,
//                         ),
//                         child: Text(
//                           value,
//                           style: CustomTextStyles.labelLargePrimary.copyWith(
//                             color: theme.colorScheme.primary,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//           itemBuilder: (context, model) {
//             return SectionintroduItemWidget();
//           },
//           separator: SizedBox(
//             height: 20.v,
//           ),
//         ),
//       ),
//     );
//   }
// }

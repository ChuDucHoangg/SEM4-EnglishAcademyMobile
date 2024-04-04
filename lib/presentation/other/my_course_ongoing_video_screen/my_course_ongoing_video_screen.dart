// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class MyCourseOngoingVideoScreen extends StatelessWidget {
//   const MyCourseOngoingVideoScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appTheme.black900,
//         body: Container(
//           width: double.maxFinite,
//           padding: EdgeInsets.symmetric(
//             horizontal: 42.h,
//             vertical: 44.v,
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 21.v),
//               Padding(
//                 padding: EdgeInsets.only(right: 2.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           "04:34",
//                           style: CustomTextStyles.titleSmallJostWhiteA700,
//                         ),
//                         SizedBox(height: 11.v),
//                         CustomImageView(
//                           imagePath: ImageConstant.imgArrowDownWhiteA700,
//                           height: 8.v,
//                           radius: BorderRadius.circular(
//                             1.h,
//                           ),
//                           alignment: Alignment.centerRight,
//                         ),
//                         SizedBox(height: 21.v),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Container(
//                             margin: EdgeInsets.only(
//                               left: 3.h,
//                               right: 4.h,
//                             ),
//                             decoration: AppDecoration.outlineBlue50.copyWith(
//                               borderRadius: BorderRadiusStyle.roundedBorder4,
//                             ),
//                             child: Container(
//                               height: 140.v,
//                               width: 8.h,
//                               decoration: BoxDecoration(
//                                 color: appTheme.teal700,
//                                 borderRadius: BorderRadius.circular(
//                                   4.h,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 11.v),
//                         Text(
//                           "36:34",
//                           style: CustomTextStyles.titleSmallJostWhiteA700,
//                         ),
//                         SizedBox(height: 9.v),
//                         CustomImageView(
//                           imagePath: ImageConstant.imgMicrophone,
//                           height: 19.adaptSize,
//                           width: 19.adaptSize,
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         top: 4.v,
//                         bottom: 444.v,
//                       ),
//                       child: Column(
//                         children: [
//                           CustomImageView(
//                             imagePath: ImageConstant.imgArrowRight,
//                             width: 20.h,
//                           ),
//                           SizedBox(height: 8.v),
//                           Text(
//                             "Wordpress Website Development",
//                             style: CustomTextStyles.titleLargeWhiteA700,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

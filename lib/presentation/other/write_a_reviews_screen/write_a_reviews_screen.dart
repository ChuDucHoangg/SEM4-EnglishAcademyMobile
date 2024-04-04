// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
// import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class WriteAReviewsScreen extends StatelessWidget {
//   WriteAReviewsScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   TextEditingController reviewController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(context),
//         body: Container(
//           width: double.maxFinite,
//           padding: EdgeInsets.symmetric(
//             horizontal: 34.h,
//             vertical: 12.v,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildGraphicDesign(context),
//               SizedBox(height: 20.v),
//               Text(
//                 "Add Photo (or) Video",
//                 style: CustomTextStyles.titleMedium18,
//               ),
//               SizedBox(height: 8.v),
//               _buildUpload(context),
//               SizedBox(height: 15.v),
//               Text(
//                 "Write you Review",
//                 style: CustomTextStyles.titleMedium18,
//               ),
//               SizedBox(height: 13.v),
//               CustomTextFormField(
//                 controller: reviewController,
//                 hintText:
//                 "Would you like to write anything about this Product?",
//                 textInputAction: TextInputAction.done,
//                 maxLines: 8,
//                 borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
//               ),
//               SizedBox(height: 50.v),
//               CustomElevatedButton(
//                 text: "Submit Review",
//                 margin: EdgeInsets.symmetric(horizontal: 5.h),
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
//               ),
//               SizedBox(height: 5.v),
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
//           bottom: 18.v,
//         ),
//       ),
//       title: AppbarSubtitle(
//         text: "Write a Reviews",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildGraphicDesign(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 21.h,
//         vertical: 14.v,
//       ),
//       decoration: AppDecoration.outlineBlack9001.copyWith(
//         borderRadius: BorderRadiusStyle.circleBorder15,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Container(
//             height: 100.adaptSize,
//             width: 100.adaptSize,
//             margin: EdgeInsets.only(top: 6.v),
//             decoration: BoxDecoration(
//               color: appTheme.black900,
//               borderRadius: BorderRadius.circular(
//                 16.h,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 33.v,
//               right: 8.h,
//               bottom: 25.v,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Graphic Design",
//                   style: CustomTextStyles.labelLargeOrangeA700,
//                 ),
//                 SizedBox(height: 7.v),
//                 Text(
//                   "Setup your Graphic Desig..",
//                   style: theme.textTheme.titleMedium,
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
//   Widget _buildUpload(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 112.h,
//         vertical: 31.v,
//       ),
//       decoration: AppDecoration.outlineBlack9001.copyWith(
//         borderRadius: BorderRadiusStyle.circleBorder15,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgFill1Teal700,
//             height: 40.v,
//           ),
//           SizedBox(height: 11.v),
//           Text(
//             "Click here to Upload",
//             style: theme.textTheme.titleSmall,
//           ),
//         ],
//       ),
//     );
//   }
// }

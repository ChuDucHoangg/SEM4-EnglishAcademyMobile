// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_radio_button.dart';
// import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
// import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class PaymentMethodsScreen extends StatelessWidget {
//   PaymentMethodsScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   String radioGroup = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: _buildAppBar(context),
//         body: Container(
//           width: double.maxFinite,
//           padding: EdgeInsets.symmetric(
//             horizontal: 34.h,
//             vertical: 11.v,
//           ),
//           child: Column(
//             children: [
//               _buildGraphicDesign(context),
//               SizedBox(height: 21.v),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Select the Payment Methods you Want to Use",
//                   style: theme.textTheme.titleSmall,
//                 ),
//               ),
//               SizedBox(height: 16.v),
//               _buildTwo(
//                 context,
//                 googlePay: "Paypal",
//               ),
//               SizedBox(height: 12.v),
//               _buildTwo(
//                 context,
//                 googlePay: "Google Pay",
//               ),
//               SizedBox(height: 12.v),
//               _buildApplePay(context),
//               SizedBox(height: 12.v),
//               _buildFour(context),
//               Spacer(),
//               SizedBox(height: 18.v),
//               Padding(
//                 padding: EdgeInsets.only(right: 13.h),
//                 child: CustomIconButton(
//                   height: 62.adaptSize,
//                   width: 62.adaptSize,
//                   padding: EdgeInsets.all(18.h),
//                   decoration: IconButtonStyleHelper.outlineBlack,
//                   alignment: Alignment.centerRight,
//                   child: CustomImageView(
//                     imagePath: ImageConstant.imgCloseWhiteA700,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: _buildEnrollCourse55(context),
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
//         text: "Payment Methods",
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
//   Widget _buildApplePay(BuildContext context) {
//     return CustomRadioButton(
//       width: 360.h,
//       text: "Apple Pay",
//       value: "Apple Pay",
//       groupValue: radioGroup,
//       padding: EdgeInsets.symmetric(
//         horizontal: 30.h,
//         vertical: 19.v,
//       ),
//       isRightCheck: true,
//       onChange: (value) {
//         radioGroup = value;
//       },
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFour(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 20.h,
//         vertical: 17.v,
//       ),
//       decoration: AppDecoration.outlineBlack9001.copyWith(
//         borderRadius: BorderRadiusStyle.circleBorder15,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               top: 3.v,
//               bottom: 4.v,
//             ),
//             child: Text(
//               "**** ****  **76  3054",
//               style: CustomTextStyles.titleSmallBluegray900ExtraBold,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 12.h),
//             padding: EdgeInsets.all(5.h),
//             decoration: AppDecoration.outlineTeal.copyWith(
//               borderRadius: BorderRadiusStyle.roundedBorder12,
//             ),
//             child: Container(
//               height: 12.adaptSize,
//               width: 12.adaptSize,
//               decoration: BoxDecoration(
//                 color: appTheme.teal700,
//                 borderRadius: BorderRadius.circular(
//                   6.h,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildEnrollCourse55(BuildContext context) {
//     return CustomElevatedButton(
//       text: "Enroll Course - 55",
//       margin: EdgeInsets.only(
//         left: 39.h,
//         right: 39.h,
//         bottom: 53.v,
//       ),
//       rightIcon: Container(
//         padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
//         margin: EdgeInsets.only(left: 30.h),
//         decoration: BoxDecoration(
//           color: appTheme.whiteA700,
//           borderRadius: BorderRadius.circular(
//             24.h,
//           ),
//         ),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgFill1Primary,
//           height: 17.v,
//         ),
//       ),
//     );
//   }
//
//   /// Common widget
//   Widget _buildTwo(
//       BuildContext context, {
//         required String googlePay,
//       }) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 20.h,
//         vertical: 17.v,
//       ),
//       decoration: AppDecoration.outlineBlack9001.copyWith(
//         borderRadius: BorderRadiusStyle.circleBorder15,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               top: 5.v,
//               bottom: 2.v,
//             ),
//             child: Text(
//               googlePay,
//               style: CustomTextStyles.titleSmallBluegray900ExtraBold.copyWith(
//                 color: appTheme.blueGray900,
//               ),
//             ),
//           ),
//           CustomImageView(
//             imagePath: ImageConstant.imgContrastBlueGray200,
//             height: 26.adaptSize,
//             width: 26.adaptSize,
//             margin: EdgeInsets.only(left: 11.h),
//           ),
//         ],
//       ),
//     );
//   }
// }

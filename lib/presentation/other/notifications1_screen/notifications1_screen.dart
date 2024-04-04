// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:english_academy_mobile/widgets/custom_switch.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class Notifications1Screen extends StatelessWidget {
//   Notifications1Screen({Key? key})
//       : super(
//     key: key,
//   );
//
//   bool isSelectedSwitch = false;
//
//   bool isSelectedSwitch1 = false;
//
//   bool isSelectedSwitch2 = false;
//
//   bool isSelectedSwitch3 = false;
//
//   bool isSelectedSwitch4 = false;
//
//   bool isSelectedSwitch5 = false;
//
//   bool isSelectedSwitch6 = false;
//
//   bool isSelectedSwitch7 = false;
//
//   bool isSelectedSwitch8 = false;
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
//             vertical: 15.v,
//           ),
//           child: Column(
//             children: [
//               _buildOne(context),
//               SizedBox(height: 40.v),
//               _buildTwo(context),
//               SizedBox(height: 40.v),
//               _buildThree(context),
//               SizedBox(height: 40.v),
//               _buildFour(context),
//               SizedBox(height: 40.v),
//               _buildFive(context),
//               SizedBox(height: 40.v),
//               _buildSix(context),
//               SizedBox(height: 40.v),
//               _buildSeven(context),
//               SizedBox(height: 40.v),
//               _buildEight(context),
//               SizedBox(height: 40.v),
//               _buildNine(context),
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
//           bottom: 17.v,
//         ),
//       ),
//       title: AppbarSubtitle(
//         text: "Notification",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildOne(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: 5.v,
//             bottom: 3.v,
//           ),
//           child: Text(
//             "Special Offers",
//             style: CustomTextStyles.titleMediumMulishBold,
//           ),
//         ),
//         CustomSwitch(
//           value: isSelectedSwitch,
//           onChange: (value) {
//             isSelectedSwitch = value;
//           },
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildTwo(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: 3.v,
//             bottom: 5.v,
//           ),
//           child: Text(
//             "Sound",
//             style: CustomTextStyles.titleMediumMulishBold,
//           ),
//         ),
//         CustomSwitch(
//           value: isSelectedSwitch1,
//           onChange: (value) {
//             isSelectedSwitch1 = value;
//           },
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildThree(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: 3.v,
//             bottom: 5.v,
//           ),
//           child: Text(
//             "Vibrate",
//             style: CustomTextStyles.titleMediumMulishBold,
//           ),
//         ),
//         CustomSwitch(
//           value: isSelectedSwitch2,
//           onChange: (value) {
//             isSelectedSwitch2 = value;
//           },
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFour(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: 3.v,
//             bottom: 5.v,
//           ),
//           child: Text(
//             "General Notification",
//             style: CustomTextStyles.titleMediumMulishBold,
//           ),
//         ),
//         CustomSwitch(
//           value: isSelectedSwitch3,
//           onChange: (value) {
//             isSelectedSwitch3 = value;
//           },
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildFive(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: 3.v,
//             bottom: 5.v,
//           ),
//           child: Text(
//             "Promo & Discount",
//             style: CustomTextStyles.titleMediumMulishBold,
//           ),
//         ),
//         CustomSwitch(
//           value: isSelectedSwitch4,
//           onChange: (value) {
//             isSelectedSwitch4 = value;
//           },
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildSix(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: 5.v,
//             bottom: 3.v,
//           ),
//           child: Text(
//             "Payment Options",
//             style: CustomTextStyles.titleMediumMulishBold,
//           ),
//         ),
//         CustomSwitch(
//           value: isSelectedSwitch5,
//           onChange: (value) {
//             isSelectedSwitch5 = value;
//           },
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildSeven(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: 5.v,
//             bottom: 3.v,
//           ),
//           child: Text(
//             "App Update",
//             style: CustomTextStyles.titleMediumMulishBold,
//           ),
//         ),
//         CustomSwitch(
//           value: isSelectedSwitch6,
//           onChange: (value) {
//             isSelectedSwitch6 = value;
//           },
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildEight(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: 3.v,
//             bottom: 5.v,
//           ),
//           child: Text(
//             "New Service Available",
//             style: CustomTextStyles.titleMediumMulishBold,
//           ),
//         ),
//         CustomSwitch(
//           value: isSelectedSwitch7,
//           onChange: (value) {
//             isSelectedSwitch7 = value;
//           },
//         ),
//       ],
//     );
//   }
//
//   /// Section Widget
//   Widget _buildNine(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: 5.v,
//             bottom: 3.v,
//           ),
//           child: Text(
//             "New Tips Available",
//             style: CustomTextStyles.titleMediumMulishBold,
//           ),
//         ),
//         CustomSwitch(
//           value: isSelectedSwitch8,
//           onChange: (value) {
//             isSelectedSwitch8 = value;
//           },
//         ),
//       ],
//     );
//   }
// }

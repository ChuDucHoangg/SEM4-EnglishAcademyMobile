// import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class CongratulationsScreen extends StatelessWidget {
//   const CongratulationsScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         extendBodyBehindAppBar: true,
//         backgroundColor: appTheme.blueGray900.withOpacity(0.8),
//         body: Container(
//           width: SizeUtils.width,
//           height: SizeUtils.height,
//           decoration: BoxDecoration(
//             color: appTheme.blueGray900.withOpacity(0.8),
//             image: DecorationImage(
//               image: AssetImage(
//                 ImageConstant.img11Congratulations,
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Container(
//             width: double.maxFinite,
//             padding: EdgeInsets.symmetric(horizontal: 34.h),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 4.v),
//                 _buildPROCESS(context),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildPROCESS(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(41.h),
//       decoration: AppDecoration.fillGray.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder40,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Align(
//             alignment: Alignment.centerRight,
//             child: Padding(
//               padding: EdgeInsets.only(left: 18.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   CustomImageView(
//                     imagePath: ImageConstant.imgSignal,
//                     height: 18.adaptSize,
//                     width: 18.adaptSize,
//                     margin: EdgeInsets.only(
//                       top: 105.v,
//                       bottom: 53.v,
//                     ),
//                   ),
//                   Container(
//                     height: 176.v,
//                     width: 164.h,
//                     margin: EdgeInsets.only(left: 14.h),
//                     child: Stack(
//                       alignment: Alignment.topLeft,
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgBrightness,
//                           width: 25.h,
//                           alignment: Alignment.topLeft,
//                           margin: EdgeInsets.only(left: 24.h),
//                         ),
//                         CustomImageView(
//                           imagePath: ImageConstant.imgCloseTeal700,
//                           width: 25.h,
//                           alignment: Alignment.topLeft,
//                           margin: EdgeInsets.only(
//                             left: 49.h,
//                             top: 9.v,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: SizedBox(
//                             height: 157.v,
//                             width: 153.h,
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: Container(
//                                     height: 157.v,
//                                     width: 152.h,
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 56.h,
//                                       vertical: 28.v,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: fs.Svg(
//                                           ImageConstant.imgGroup29,
//                                         ),
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     child: CustomImageView(
//                                       imagePath: ImageConstant.imgContrast,
//                                       height: 31.v,
//                                       alignment: Alignment.bottomRight,
//                                     ),
//                                   ),
//                                 ),
//                                 CustomImageView(
//                                   imagePath: ImageConstant.imgImage9,
//                                   height: 153.adaptSize,
//                                   width: 153.adaptSize,
//                                   alignment: Alignment.center,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         CustomImageView(
//                           imagePath: ImageConstant.imgTriangle,
//                           height: 14.adaptSize,
//                           width: 14.adaptSize,
//                           alignment: Alignment.bottomLeft,
//                         ),
//                         Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Container(
//                             height: 8.adaptSize,
//                             width: 8.adaptSize,
//                             margin: EdgeInsets.only(
//                               left: 1.h,
//                               bottom: 41.v,
//                             ),
//                             decoration: BoxDecoration(
//                               color: appTheme.teal700,
//                               borderRadius: BorderRadius.circular(
//                                 4.h,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Container(
//                             height: 12.adaptSize,
//                             width: 12.adaptSize,
//                             margin: EdgeInsets.only(
//                               left: 1.h,
//                               top: 37.v,
//                             ),
//                             decoration: BoxDecoration(
//                               color: appTheme.orangeA700,
//                               borderRadius: BorderRadius.circular(
//                                 6.h,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 7.h,
//                       top: 16.v,
//                       bottom: 97.v,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgSignalAmberA40001,
//                           height: 18.adaptSize,
//                           width: 18.adaptSize,
//                           alignment: Alignment.centerRight,
//                         ),
//                         SizedBox(height: 33.v),
//                         Container(
//                           height: 12.adaptSize,
//                           width: 12.adaptSize,
//                           decoration: BoxDecoration(
//                             color: appTheme.gray80001,
//                             borderRadius: BorderRadius.circular(
//                               6.h,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   CustomImageView(
//                     imagePath: ImageConstant.imgTriangleTeal700,
//                     height: 14.adaptSize,
//                     width: 14.adaptSize,
//                     margin: EdgeInsets.only(
//                       left: 16.h,
//                       top: 87.v,
//                       bottom: 75.v,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 29.v),
//           Text(
//             "Congratulations",
//             style: theme.textTheme.headlineSmall,
//           ),
//           SizedBox(height: 10.v),
//           SizedBox(
//             width: 276.h,
//             child: Text(
//               "Your Account is Ready to Use. You will be redirected to the Home Page in a Few Seconds.",
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: theme.textTheme.titleSmall,
//             ),
//           ),
//           SizedBox(height: 25.v),
//           CustomImageView(
//             imagePath: ImageConstant.imgUser,
//             height: 40.adaptSize,
//             width: 40.adaptSize,
//           ),
//           SizedBox(height: 8.v),
//         ],
//       ),
//     );
//   }
// }

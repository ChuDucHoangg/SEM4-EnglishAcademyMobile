// import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
// import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
// import 'package:flutter/material.dart';
// import 'package:english_academy_mobile/core/app_export.dart';
//
// class TermsConditionsScreen extends StatelessWidget {
//   const TermsConditionsScreen({Key? key})
//       : super(
//     key: key,
//   );
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
//             vertical: 25.v,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Condition & Attending",
//                 style: CustomTextStyles.titleLarge20,
//               ),
//               SizedBox(height: 10.v),
//               Container(
//                 width: 351.h,
//                 margin: EdgeInsets.only(right: 7.h),
//                 child: Text(
//                   "At enim hic etiam dolore. Dulce amarum, leve asperum, prope longe, stare movere, quadratum rotundum. At certe gravius. Nullus est igitur cuiusquam dies natalis. Paulum, cum regem Persem captum adduceret, eodem flumine invectio?\n\nQuare hoc videndum est, possitne nobis hoc ratio philosophorum dare.\nSed finge non solum callidum eum, qui aliquid improbe faciat, verum etiam praepotentem, ut M.\nEst autem officium, quod ita factum est, ut eius facti probabilis ratio reddi possit.",
//                   maxLines: 13,
//                   overflow: TextOverflow.ellipsis,
//                   style: CustomTextStyles.titleSmall15.copyWith(
//                     height: 1.33,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 18.v),
//               Text(
//                 "Terms & Use",
//                 style: CustomTextStyles.titleLarge20,
//               ),
//               SizedBox(height: 11.v),
//               SizedBox(
//                 width: 357.h,
//                 child: Text(
//                   "Ut proverbia non nulla veriora sint quam vestra dogmata. Tamen aberramus a proposito, et, ne longius, prorsus, inquam, Piso, si ista mala sunt, placet. Omnes enim iucundum motum, quo sensus hilaretur. Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba. Quibusnam praeteritis? Portenta haec esse dicit, quidem hactenus; Si id dicis, vicimus. Qui ita affectus, beatum esse numquam probabis; Igitur neque stultorum quisquam beatus neque sapientium non beatus.\n\nDicam, inquam, et quidem discendi causa magis, quam quo te aut Epicurum reprehensum velim. Dolor ergo, id est summum malum, metuetur semper, etiamsi non ader.",
//                   maxLines: 15,
//                   overflow: TextOverflow.ellipsis,
//                   style: CustomTextStyles.titleSmall15.copyWith(
//                     height: 1.33,
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
//           bottom: 17.v,
//         ),
//       ),
//       title: AppbarSubtitle(
//         text: "Terms & Conditions",
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//     );
//   }
// }

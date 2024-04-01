import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class FortytwoItemWidget extends StatelessWidget {
  const FortytwoItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 46.adaptSize,
          width: 46.adaptSize,
          margin: EdgeInsets.only(
            top: 3.v,
            bottom: 65.v,
          ),
          decoration: BoxDecoration(
            color: appTheme.black900,
            borderRadius: BorderRadius.circular(
              23.h,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Heather S. McMullen",
                      style: CustomTextStyles.titleMedium17,
                    ),
                    CustomOutlinedButton(
                      height: 26.v,
                      width: 60.h,
                      text: "4.2",
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 2.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgSignalAmber700,
                          height: 12.adaptSize,
                          width: 12.adaptSize,
                        ),
                      ),
                      buttonTextStyle:
                      CustomTextStyles.labelLargeJostBluegray900,
                    ),
                  ],
                ),
                SizedBox(height: 9.v),
                Container(
                  width: 244.h,
                  margin: EdgeInsets.only(right: 12.h),
                  child: Text(
                    "The Course is Very Good dolor sit amet, con sect tur adipiscing elit. Naturales divitias dixit parab les esse..",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                SizedBox(height: 11.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgFavorite,
                      height: 16.v,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: Text(
                        "760",
                        style: CustomTextStyles.labelLargeBluegray900,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 22.h),
                      child: Text(
                        "2 Weeks Agos",
                        style: CustomTextStyles.labelLargeBluegray900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

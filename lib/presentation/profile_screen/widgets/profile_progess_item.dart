import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';

class ProfileProgessItem extends StatefulWidget {
  const ProfileProgessItem({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileProgessItemState createState() => ProfileProgessItemState();
}

class ProfileProgessItemState extends State<ProfileProgessItem>
    with AutomaticKeepAliveClientMixin<ProfileProgessItem> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.h),
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.outlineGray90010.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
          color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 6.h,
              right: 4.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 4.v,
                  ),
                  decoration: AppDecoration.outlineGray9008.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder5,
                  ),
                  child: Center(
                    child: Text(
                      "IELTS",
                      style: CustomTextStyles.labelMediumGreenA400,
                    ),
                  ),
                ),
                Container(
                  width: 90.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 4.v,
                  ),
                  decoration: AppDecoration.outlineGray9009.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder5,
                  ),
                  child: Center(
                    child: Text(
                      "TOEIC",
                      style: CustomTextStyles.labelMediumRedA200,
                    ),
                  ),
                ),
                Container(
                  width: 90.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 4.v,
                  ),
                  decoration: AppDecoration.outlineGray90010.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder5,
                  ),
                  child: Center(
                    child: Text(
                      "PTE",
                      style: CustomTextStyles.labelMediumPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          SizedBox(
            height: 8.v,
            width: 303.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8.v,
                    width: 303.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: appTheme.gray100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.greenA400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.v)
        ],
      ),
    );
  }
}

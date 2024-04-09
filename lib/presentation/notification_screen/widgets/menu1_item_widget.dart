import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class Menu1ItemWidget extends StatelessWidget {
  const Menu1ItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            CustomIconButton(
              height: 48.adaptSize,
              width: 48.adaptSize,
              padding: EdgeInsets.all(11.h),
              decoration: IconButtonStyleHelper.outlineBlueGrayTL24,
              child: CustomImageView(
                imagePath: ImageConstant.imgIcon48x48,
              ),
            ),
            SizedBox(height: 10.v),
            Text(
              "Promotions",
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

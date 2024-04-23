import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../widgets/custom_icon_button.dart';

class CheckoutPaymentMethodItem extends StatelessWidget {
  final String paymentMethodName;
  final String paymentMethodDescription;
  final String paymentMethodLogoPath;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CheckoutPaymentMethodItem({
    Key? key,
    required this.paymentMethodName,
    required this.paymentMethodDescription,
    required this.paymentMethodLogoPath,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 16.v,
        ),
        decoration: AppDecoration.outlineBluegray501.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          children: [
            CustomIconButton(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(10.h),
              child: CustomImageView(
                imagePath: paymentMethodLogoPath,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 3.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    paymentMethodName,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 6.v),
                  Text(
                    paymentMethodDescription,
                    style: theme.textTheme.bodySmall,
                  )
                ],
              ),
            ),
            Spacer(),
            MSHCheckbox(
              size: 22,
              value: isChecked,
              colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                checkedColor: theme.primaryColor,
              ),
              style: MSHCheckboxStyle.fillScaleCheck,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

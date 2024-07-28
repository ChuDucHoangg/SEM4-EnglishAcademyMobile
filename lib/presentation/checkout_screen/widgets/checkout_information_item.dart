import 'dart:convert';

import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../service/AuthService.dart';
import '../../../theme/app_decoration.dart';

class CheckoutInformationItem extends StatefulWidget {
  const CheckoutInformationItem({Key? key})
      : super(
          key: key,
        );

  @override
  CheckoutInformationItemState createState() => CheckoutInformationItemState();
}

class CheckoutInformationItemState extends State<CheckoutInformationItem> {
  String _fullname = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  void _getUserInfo() async {
    try {
      final String token = await AuthService.getToken();
      final List<String> parts = token.split(".");
      final String normalizedToken = base64Url.normalize(parts[1]);
      final String decodedToken =
          utf8.decode(base64Url.decode(normalizedToken));

      final Map<String, dynamic> tokenData = json.decode(decodedToken);

      setState(() {
        _fullname = tokenData['Fullname'];
        _email = tokenData['sub'];
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Customer information",
              style: theme.textTheme.titleMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.v),
              child: Text(
                "Change",
                style: CustomTextStyles.labelLargePrimary,
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 15.h),
      Container(
        width: 327.h,
        margin: EdgeInsets.symmetric(horizontal: 23.h),
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 13.v,
        ),
        decoration: AppDecoration.outlineBluegray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.v),
            Text(
              "${_fullname},",
              style: theme.textTheme.titleSmall,
            ),
            SizedBox(height: 7.v),
            Container(
              width: 286.h,
              margin: EdgeInsets.only(right: 8.h),
              child: Text(
                "3702 Oliver Street, Fort Worth, TX, Texas, 76102, 817-352-2015, ${_email}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall!.copyWith(
                  height: 1.60,
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

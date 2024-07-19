import 'dart:convert';

import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/presentation/profile_screen/widgets/profile_more.dart';
import 'package:flutter/material.dart';

import '../../../service/AuthService.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';

class ProfileInfomationItem extends StatefulWidget {
  const ProfileInfomationItem({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileInfomationItemState createState() => ProfileInfomationItemState();
}

class ProfileInfomationItemState extends State<ProfileInfomationItem>
    with AutomaticKeepAliveClientMixin<ProfileInfomationItem> {
  @override
  bool get wantKeepAlive => true;
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
      final Map<String, dynamic> tokenData = json.decode(
          ascii.decode(base64.decode(base64.normalize(token.split(".")[1]))));

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
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.outlineGray90010.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
          color: Theme.of(context).colorScheme.primaryContainer
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius:
            BorderRadius.all(Radius.circular(50)),
            child: CustomImageView(
              width: 50,
              height: 50,
              imagePath: "https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              top: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _fullname,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 9.v),
                Text(
                  _email,
                  style: CustomTextStyles.bodySmallBluegray300_1,
                ),
                SizedBox(height: 7.v),
                Text(
                  "Student",
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgSearchBlueGray300,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 21.v),
            onTap: () {
              _navigateToProfileMoreScreen(context);
            },
          )
        ],
      ),
    );
  }
  void _navigateToProfileMoreScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileMoreScreen()),
    );
  }
}

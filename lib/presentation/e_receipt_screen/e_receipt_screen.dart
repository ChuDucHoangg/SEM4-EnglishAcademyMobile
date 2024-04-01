import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class EReceiptScreen extends StatelessWidget {
  const EReceiptScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 44.h,
            vertical: 30.v,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIconBlueGray50,
                height: 100.v,
              ),
              SizedBox(height: 29.v),
              SizedBox(
                height: 103.v,
                width: 270.h,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgFill1Gray90001100x270,
                      height: 100.v,
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.h),
                        child: Text(
                          "25234567",
                          style: CustomTextStyles.labelLargeBlack900,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 50.h),
                        child: Text(
                          "28646345",
                          style: CustomTextStyles.labelLargeBlack900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34.v),
              _buildEmailID(
                context,
                emailID: "Name",
                email: "Scott R. Shoemake",
              ),
              SizedBox(height: 11.v),
              _buildEmailID(
                context,
                emailID: "Email ID",
                email: "shoemake.redial@gmail.com",
              ),
              SizedBox(height: 12.v),
              _buildEmailID(
                context,
                emailID: "Course",
                email: "3d Character Illustration Cre..",
              ),
              SizedBox(height: 13.v),
              _buildEmailID(
                context,
                emailID: "Category",
                email: "Web Development",
              ),
              SizedBox(height: 38.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TransactionID",
                    style: CustomTextStyles.titleSmallJostBluegray900,
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Text(
                      "SK345680976",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgThumbsUpBlueGray90016x13,
                    width: 13.h,
                    margin: EdgeInsets.only(
                      left: 10.h,
                      top: 3.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 11.v),
              _buildEmailID(
                context,
                emailID: "Price",
                email: "55.00",
              ),
              SizedBox(height: 12.v),
              _buildEmailID(
                context,
                emailID: "Date",
                email: "Nov 20, 202X   /   15:45",
              ),
              SizedBox(height: 11.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.v),
                    child: Text(
                      "Status",
                      style: CustomTextStyles.titleSmallJostBluegray900,
                    ),
                  ),
                  CustomOutlinedButton(
                    height: 22.v,
                    width: 60.h,
                    text: "Paid",
                    margin: EdgeInsets.only(top: 2.v),
                    buttonStyle: CustomButtonStyles.outlineTeal,
                    buttonTextStyle: CustomTextStyles.labelLargeWhiteA70012,
                  ),
                ],
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 35.h,
          top: 16.v,
          bottom: 19.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "E-Receipt",
        margin: EdgeInsets.only(left: 12.h),
      ),
      actions: [
        AppbarTrailingIconbuttonOne(
          imagePath: ImageConstant.imgGroup73,
          margin: EdgeInsets.fromLTRB(36.h, 14.v, 36.h, 17.v),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildEmailID(
      BuildContext context, {
        required String emailID,
        required String email,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          emailID,
          style: CustomTextStyles.titleSmallJostBluegray900.copyWith(
            color: appTheme.blueGray900,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text(
            email,
            style: theme.textTheme.titleSmall!.copyWith(
              color: appTheme.gray700,
            ),
          ),
        ),
      ],
    );
  }
}

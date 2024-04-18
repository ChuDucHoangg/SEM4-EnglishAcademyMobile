import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/custom_icon_button.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CheckoutPaymentMethodScreen extends StatelessWidget {
  const CheckoutPaymentMethodScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30.v),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bank transfer",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 18.v),
                _buildBankTransfer(context),
                SizedBox(height: 10.v),
                Text(
                  "Debit/Credit Card",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 17.v),
                _buildCreditCard(context),
                SizedBox(height: 26.v),
                Text(
                  "E-wallet",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 17.v),
                _buildWallet(context),
                SizedBox(height: 26.v),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
          vertical: 25.v,
        ),
        decoration: AppDecoration.outlineGray9006,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
              text: "Choose This Payment",
              buttonStyle: CustomButtonStyles.fillPrimary,
            )
          ],
        ),
      )
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 35.h,
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 22.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Payment Method",
      ),
    );
  }

  /// Section Widget
  Widget _buildBankTransfer(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 16.v,
        );
      },
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 16.v,
          ),
          decoration: AppDecoration.outlineBluegray501.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.v),
                child: CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(9.h),
                  decoration: IconButtonStyleHelper.fillGrayTL8,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgTelevisionLightBlue800,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 1.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "American Express",
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 8.v),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Checked automatically",
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 11.v),
                padding: EdgeInsets.all(2.h),
                decoration: AppDecoration.outlinePrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Container(
                  height: 13.adaptSize,
                  width: 13.adaptSize,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      6.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildCreditCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlineBluegray506.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder16,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.v),
            child: CustomIconButton(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(10.h),
              decoration: IconButtonStyleHelper.fillGrayTL8,
              child: CustomImageView(
                imagePath: ImageConstant.imgTelevisionPrimary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mastercard, Visa",
                  style: CustomTextStyles.titleSmallBlueA700,
                ),
                SizedBox(height: 7.v),
                Text(
                  "Add New Card",
                  style: CustomTextStyles.bodySmallBluegray300_1,
                )
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightBlueGray30020x20,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 11.v),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWallet(BuildContext context) {
    return Container(
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
            padding: EdgeInsets.all(12.h),
            decoration: IconButtonStyleHelper.fillGrayTL8,
            child: CustomImageView(
              imagePath: ImageConstant.imgLogosPaypal,
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
                  "Paypal",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 6.v),
                Text(
                  "Checked automatically",
                  style: theme.textTheme.bodySmall,
                )
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgContrastOnerrorcontainer,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 10.v),
          )
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

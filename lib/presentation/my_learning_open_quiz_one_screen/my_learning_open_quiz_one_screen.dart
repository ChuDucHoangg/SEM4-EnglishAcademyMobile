import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'widgets/label2_item_widget.dart';
import 'package:flutter/material.dart';




class MyLearningOpenQuizOneScreen extends StatelessWidget {
  const MyLearningOpenQuizOneScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(24.h),
          child: Column(
            children: [
              Container(
                height: 8.v,
                width: 327.h,
                decoration: BoxDecoration(
                  color: appTheme.blueGray500,
                  borderRadius: BorderRadius.circular(
                    3.h,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    3.h,
                  ),
                  child: LinearProgressIndicator(
                    value: 0.2,
                    backgroundColor: appTheme.blueGray500,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.onErrorContainer.withOpacity(1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 56.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 32.v,
                ),
                decoration: AppDecoration.fillOnErrorContainer.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.v),
                    Text(
                      "Question 2 of 10",
                      style: CustomTextStyles.labelLargeBluegray300,
                    ),
                    SizedBox(height: 14.v),
                    Container(
                      width: 259.h,
                      margin: EdgeInsets.only(right: 19.h),
                      child: Text(
                        "An experience that is easy to use is said to be…",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleLarge!.copyWith(
                          height: 1.35,
                        ),
                      ),
                    ),
                    SizedBox(height: 31.v),
                    _buildLabel(context),
                  ],
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildContinue(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
        margin: EdgeInsets.only(left: 22.h),
      ),
      centerTitle: true,
      title: AppbarSubtitleTwo(
        text: "UX Design Principles",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotificationOnerrorcontainer,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildLabel(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
          context,
          index,
          ) {
        return SizedBox(
          height: 12.v,
        );
      },
      itemCount: 4,
      itemBuilder: (context, index) {
        return Label2ItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
      text: "Continue",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 50.v,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}

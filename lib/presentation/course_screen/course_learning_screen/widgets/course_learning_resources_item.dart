import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CourseLearningResourcesItem extends StatefulWidget {
  const CourseLearningResourcesItem({Key? key})
      : super(
          key: key,
        );

  @override
  CourseLearningResourcesItemState createState() =>
      CourseLearningResourcesItemState();
}

class CourseLearningResourcesItemState
    extends State<CourseLearningResourcesItem>
    with AutomaticKeepAliveClientMixin<CourseLearningResourcesItem> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollView(context),
    );;
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(top: 10.v),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (
                        context,
                        index,
                        ) {
                      return SizedBox(
                        height: 16.v,
                      );
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.h,
                          vertical: 17.v,
                        ),
                        decoration: AppDecoration.outlineBluegray501.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 36.v,
                              width: 30.h,
                              margin: EdgeInsets.only(
                                left: 5.h,
                                top: 2.v,
                                bottom: 2.v,
                              ),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgProfile,
                                    height: 36.v,
                                    width: 30.h,
                                    alignment: Alignment.center,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 8.v),
                                      child: Text(
                                        "ZIP",
                                        style:
                                        CustomTextStyles.labelSmallGray900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 17.h,
                                top: 1.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "UX Research.zip",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 7.v),
                                  Text(
                                    "Size: 10 MB",
                                    style: CustomTextStyles.labelLargeGray60001,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            CustomImageView(
                              imagePath: ImageConstant.imgDownload,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 10.v),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}


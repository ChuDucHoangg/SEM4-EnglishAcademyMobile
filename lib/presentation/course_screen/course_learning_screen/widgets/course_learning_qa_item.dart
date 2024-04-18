import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CourseLearningQAItem extends StatefulWidget {
  const CourseLearningQAItem({Key? key})
      : super(
          key: key,
        );

  @override
  CourseLearningQAItemState createState() => CourseLearningQAItemState();
}

class CourseLearningQAItemState extends State<CourseLearningQAItem>
    with AutomaticKeepAliveClientMixin<CourseLearningQAItem> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollView(context),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 10.v),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.h),
            padding: EdgeInsets.all(15.h),
            decoration: AppDecoration.outlineBluegray501.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 1.v),
                  decoration: AppDecoration.outlineBluegray502,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgAvatar32x32,
                        height: 32.adaptSize,
                        width: 32.adaptSize,
                        radius: BorderRadius.circular(
                          16.h,
                        ),
                        margin: EdgeInsets.only(bottom: 12.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 12.h,
                          bottom: 10.v,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Charolette Hanlin",
                              style: CustomTextStyles.labelLargeGray900_1,
                            ),
                            SizedBox(height: 3.v),
                            SizedBox(
                              width: 152.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.v),
                                    child: Text(
                                      "Announcement",
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ),
                                  Container(
                                    height: 3.adaptSize,
                                    width: 3.adaptSize,
                                    margin: EdgeInsets.only(
                                      top: 4.v,
                                      bottom: 6.v,
                                    ),
                                    decoration: BoxDecoration(
                                      color: appTheme.blueGray100,
                                      borderRadius: BorderRadius.circular(
                                        1.h,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "1 month ago",
                                    style: theme.textTheme.labelMedium,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        imagePath: ImageConstant.imgBarcodeBlueGray300,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        margin: EdgeInsets.only(
                          top: 6.v,
                          bottom: 18.v,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.v),
                Text(
                  "Hi, There!",
                  style: CustomTextStyles.bodySmallBluegray700,
                ),
                SizedBox(height: 6.v),
                SizedBox(
                  width: 295.h,
                  child: Text(
                    "One of the things students love the most about this course is the free ebook that is full-packed with resources. But as you may have noticed, that ebook is quickly becoming outdated, which is why I published a resources page that gets regular updates :)",
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallBluegray700.copyWith(
                      height: 1.60,
                    ),
                  ),
                ),
                SizedBox(height: 5.v),
                GestureDetector(
                  onTap: () {
                    onTapTxtLabel(context);
                  },
                  child: Text(
                    "https://charolette.com/resources/",
                    style: CustomTextStyles.labelLargePrimary,
                  ),
                ),
                SizedBox(height: 12.v),
                Container(
                  decoration: AppDecoration.outlineBluegray505,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgOffer,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        margin: EdgeInsets.only(top: 12.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 14.v,
                          bottom: 2.v,
                        ),
                        child: Text(
                          "23 Liked",
                          style: CustomTextStyles.labelLargeBluegray300,
                        ),
                      ),
                      Spacer(
                        flex: 50,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgUserBlueGray300,
                        height: 18.adaptSize,
                        width: 18.adaptSize,
                        margin: EdgeInsets.only(top: 13.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 15.v,
                        ),
                        child: Text(
                          "40 Replies",
                          style: CustomTextStyles.labelLargeBluegray300,
                        ),
                      ),
                      Spacer(
                        flex: 49,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgShareTwoBlueGray300,
                        height: 18.adaptSize,
                        width: 18.adaptSize,
                        margin: EdgeInsets.only(top: 13.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 15.v,
                        ),
                        child: Text(
                          "Reply",
                          style: CustomTextStyles.titleMediumff1d2857,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  onTapTxtLabel(BuildContext context) {
    // TODO: implement Actions
  }
}

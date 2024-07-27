import 'package:english_academy_mobile/data/model/CourseModel.dart';
import 'package:english_academy_mobile/widgets/custom_rating_bar.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:intl/intl.dart';

class CourseDetailReviewsItem extends StatefulWidget {
  final CourseModel course;

  const CourseDetailReviewsItem({Key? key, required this.course})
      : super(
          key: key,
        );

  @override
  CourseDetailReviewsItemState createState() => CourseDetailReviewsItemState();
}

class CourseDetailReviewsItemState extends State<CourseDetailReviewsItem>
    with AutomaticKeepAliveClientMixin<CourseDetailReviewsItem> {
  @override
  bool get wantKeepAlive => true;
  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    if (widget.course.reviewList.isNotEmpty) {
      _isExpandedList =
          List<bool>.filled(widget.course.reviewList.length, false);
      _isExpandedList[0] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Padding(
            padding: EdgeInsets.only(top: 10.v),
            child: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Text(
                          "Ratings",
                          style: CustomTextStyles.titleMediumOnPrimaryContainer.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.v),
                    _buildReview(context, widget.course),
                    SizedBox(height: 25.v),
                    _buildHeader(context),
                    _buildPersonReview(context),
                    SizedBox(height: 120.v),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildReview(BuildContext context, CourseModel course) {
    int totalReviews = 0;
    totalReviews += course.reviewList.length;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(
        horizontal: 50.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.outlineBluegray503.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Customer Review",
            style: TextStyle(
              fontSize: 13.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${(widget.course.calculateTotalStars()).toStringAsFixed(1)} Ratings",
                  style: theme.textTheme.labelMedium,
                ),
                Container(
                  height: 4.adaptSize,
                  width: 4.adaptSize,
                  margin: EdgeInsets.only(
                    left: 5.h,
                    top: 3.v,
                    bottom: 5.v,
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.blueGray100,
                    borderRadius: BorderRadius.circular(
                      2.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    "$totalReviews Reviews",
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.v),
            decoration: AppDecoration.fillGray5002.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRatingBar(
                  initialRating: 4,
                  color: appTheme.amberA200,
                  // backgroundColor: appTheme.gray100,
                  // valueColor: AlwaysStoppedAnimation<Color>(
                  //   appTheme.amberA200,
                  // ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.v),
                  child: Text(
                    "4.5 out of 5",
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 13.h,
                right: 3.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "5 star",
                    style: theme.textTheme.labelMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.v,
                      bottom: 3.v,
                    ),
                    child: Container(
                      height: 7.v,
                      width: 130.h,
                      decoration: BoxDecoration(
                        color: appTheme.gray100,
                        borderRadius: BorderRadius.circular(
                          2.h,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          2.h,
                        ),
                        child: LinearProgressIndicator(
                          value: 1,
                          backgroundColor: appTheme.gray100,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            appTheme.amberA200,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "60%",
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 7.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 13.h,
                right: 3.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "4 star",
                    style: theme.textTheme.labelMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.v,
                      bottom: 3.v,
                    ),
                    child: Container(
                      height: 7.v,
                      width: 130.h,
                      decoration: BoxDecoration(
                        color: appTheme.gray100,
                        borderRadius: BorderRadius.circular(
                          2.h,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          2.h,
                        ),
                        child: LinearProgressIndicator(
                          value: 0.8,
                          backgroundColor: appTheme.gray100,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            appTheme.amberA200,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "35%",
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              right: 9.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "3 star",
                  style: theme.textTheme.labelMedium,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.v,
                    bottom: 3.v,
                  ),
                  child: Container(
                    height: 7.v,
                    width: 130.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.27,
                        backgroundColor: appTheme.gray100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.amberA200,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "5%",
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              right: 9.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "2 star",
                  style: theme.textTheme.labelMedium,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.v,
                    bottom: 3.v,
                  ),
                  child: Container(
                    height: 7.v,
                    width: 130.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.19,
                        backgroundColor: appTheme.gray100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.amberA200,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "5%",
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              right: 9.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1 star",
                  style: theme.textTheme.labelMedium,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.v,
                    bottom: 3.v,
                  ),
                  child: Container(
                    height: 7.v,
                    width: 130.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.19,
                        backgroundColor: appTheme.gray100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.amberA200,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "5%",
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "User reviews",
            style: CustomTextStyles.titleMediumOnPrimaryContainer,
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgShareBlueGray300,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.only(top: 2.v),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "Sort",
              style: CustomTextStyles.titleSmallBluegray300,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPersonReview(BuildContext context) {
    if (widget.course.reviewList.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
          child: Text(
            "This course has no reviews yet",
            style: TextStyle(
              fontSize: 13.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }

    List<Widget> reviewWidgets = [];

    for (int i = 0; i < widget.course.reviewList.length; i++) {
      var item = widget.course.reviewList[i];
      final createdDate = item['createdDate'] != null ? DateTime.parse(item['createdDate']) : null;
      final formattedDate = createdDate != null ? DateFormat('dd/MM/yyyy').format(createdDate) : '';
      reviewWidgets.add(Column(children: [
        SizedBox(height: 19.v),
        Container(
          decoration: AppDecoration.outlineBluegray506,
        ),
        SizedBox(height: 19.v),
        Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgAvatar40x40,
              height: 40.adaptSize,
              width: 40.adaptSize,
              radius: BorderRadius.circular(
                20.h,
              ),
              margin: EdgeInsets.only(bottom: 1.v),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Merrill Kervin",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    formattedDate,
                    style: CustomTextStyles.labelLargeGray60001,
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomElevatedButton(
              height: 20.v,
              width: 43.h,
              text: (item['score']).toString(),
              margin: EdgeInsets.only(bottom: 23.v),
              leftIcon: Container(
                margin: EdgeInsets.only(right: 4.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgSignalOnerrorcontainer,
                  height: 10.adaptSize,
                  width: 10.adaptSize,
                ),
              ),
              buttonStyle: CustomButtonStyles.fillAmberA,
              buttonTextStyle: CustomTextStyles.labelMediumOnErrorContainer,
            ),
          ],
        ),
        SizedBox(height: 19.v),
        Container(
          width: 308.h,
          margin: EdgeInsets.only(right: 19.h),
          child: Text(
            (item['message']),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.titleSmallMedium.copyWith(
              height: 1.60,
            ),
          ),
        ),
        SizedBox(height: 12.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgOffer,
              height: 20.adaptSize,
              width: 20.adaptSize,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text(
                "20",
                style: CustomTextStyles.labelLargeBluegray300_1.copyWith(
                  color: appTheme.blueGray300,
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgTelevisionBlueGray300,
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.only(left: 14.h),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text(
                "0",
                style: CustomTextStyles.labelLargeBluegray300_1.copyWith(
                  color: appTheme.blueGray300,
                ),
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgBarcode,
              height: 20.adaptSize,
              width: 20.adaptSize,
            ),
          ],
        ),
      ]));
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(vertical: 1.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: reviewWidgets,
          ),
          SizedBox(height: 19.v),
          Container(
            decoration: AppDecoration.outlineBluegray506,
          ),
        ],
      ),
    );
  }
}

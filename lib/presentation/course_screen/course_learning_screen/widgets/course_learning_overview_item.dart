import 'package:english_academy_mobile/data/model/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CourseLearningOverviewItem extends StatefulWidget {
  final ItemModel item;

  const CourseLearningOverviewItem({Key? key, required this.item})
      : super(
          key: key,
        );

  @override
  CourseLearningOverviewItemState createState() =>
      CourseLearningOverviewItemState();
}

class CourseLearningOverviewItemState extends State<CourseLearningOverviewItem>
    with AutomaticKeepAliveClientMixin<CourseLearningOverviewItem> {
  bool criticalThinking = false;

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
      child: Padding(
        padding: EdgeInsets.only(top: 10.v),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Content",
                style: theme.textTheme.titleMedium,
              ),
            ),
            SizedBox(height: 8.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 313.h,
                margin: EdgeInsets.only(
                  right: 38.h,
                ),
                child: Text(
                  widget.item.content,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelLargeBluegray80001,
                ),
              ),
            ),

            //key points
            SizedBox(height: 32.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 313.h,
                margin: EdgeInsets.only(
                  right: 38.h,
                ),
                child: Column(children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: "- Join the ",
                            style: CustomTextStyles.labelLargeBluegray500),
                        TextSpan(
                          text: "English Academy Group",
                          style:
                              CustomTextStyles.labelLargeBluegray300.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                          ),
                        ),
                        TextSpan(
                            text: " on Facebook to discuss together ❤️️",
                            style: CustomTextStyles.labelLargeBluegray500),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: "- Subscribe to ",
                            style: CustomTextStyles.labelLargeBluegray500),
                        TextSpan(
                          text: "English Academy Official",
                          style:
                          CustomTextStyles.labelLargeBluegray300.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                          ),
                        ),
                        TextSpan(
                            text: " Youtube channel to receive notifications ❤️️",
                            style: CustomTextStyles.labelLargeBluegray500),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: "- Visit the ",
                            style: CustomTextStyles.labelLargeBluegray500),
                        TextSpan(
                          text: "English Academy",
                          style:
                          CustomTextStyles.labelLargeBluegray300.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                          ),
                        ),
                        TextSpan(
                            text: " website to see the latest events ❤️️",
                            style: CustomTextStyles.labelLargeBluegray500),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 120.v),
          ],
        ),
      ),
    );
  }
}

import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:english_academy_mobile/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

import '../../../data/model/TopicModel.dart';
import '../../../init_screen.dart';
import '../../../service/CourseService.dart';
import '../../course_screen/button_sheet_item.dart';

class ThankYouScreen extends StatefulWidget {
  final String slug;

  ThankYouScreen({Key? key, required this.slug}) : super(key: key);

  @override
  ThankYouScreenState createState() => ThankYouScreenState();
}

class ThankYouScreenState extends State<ThankYouScreen> {
  late Future<TopicModel> _topicFuture;

  @override
  void initState() {
    super.initState();
    _topicFuture = CourseService.fetchTopicDetail(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 50.v,
        ),
        child: Column(
          children: [
            SizedBox(height: 140.v),
            CustomImageView(
              imagePath: ImageConstant.imgPaymentCheck1,
              height: 140.adaptSize,
              width: 140.adaptSize,
            ),
            SizedBox(height: 50.v),
            Text(
              "Successfully Purchased!",
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 8.v),
            Container(
              width: 310.h,
              margin: EdgeInsets.symmetric(horizontal: 8.h),
              child: Text(
                "Neque et fermentum parturient euismod pellentesque.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeGray60001.copyWith(
                  height: 1.50,
                ),
              ),
            ),
            Spacer(),
            CustomElevatedButton(
              text: "Start Learning",
              buttonStyle: CustomButtonStyles.fillPrimary,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return FutureBuilder<TopicModel>(
                      future: _topicFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          final TopicModel topic = snapshot.data!;
                          return ButtonSheetItem(course: topic);
                        }
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(height: 12.v),
            CustomOutlinedButton(
              text: "Back to Home",
              buttonStyle: CustomButtonStyles.outlineBlueGrayTL28,
              buttonTextStyle: CustomTextStyles.titleMediumIndigo100,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InitScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

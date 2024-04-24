import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CourseLearningMiniTestScreen extends StatefulWidget {
  const CourseLearningMiniTestScreen({Key? key})
      : super(
          key: key,
        );

  @override
  CourseLearningMiniTestScreenState createState() =>
      CourseLearningMiniTestScreenState();
}

class CourseLearningMiniTestScreenState
    extends State<CourseLearningMiniTestScreen>
    with AutomaticKeepAliveClientMixin<CourseLearningMiniTestScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(24.h),
        child: Column(
          children: [
            SizedBox(height: 6.v),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 28.v,
              ),
              decoration: AppDecoration.fillGray10001.copyWith(
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
                      "An experience that is easy to use is said",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge!.copyWith(
                        height: 1.35,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.v),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.h,
                            vertical: 17.v,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.colorScheme.primary,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                            color: appTheme.indigo100,
                          ),
                          child: Row(
                            children: [
                              Radio(
                                value: index,
                                groupValue: 2,
                                onChanged: (value) {},
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => theme.colorScheme.primary),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              SizedBox(width: 5),
                              Text("Viet Nam"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 13.v, horizontal: 12.h),
                      decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      margin: EdgeInsets.only(left: 152.h, top: 15.h),
                      child: Text(
                        "Check Answer",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

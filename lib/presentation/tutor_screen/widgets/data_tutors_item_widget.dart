import 'package:english_academy_mobile/data/model/TurtorModel.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class DataTutorsItemWidget extends StatelessWidget {
  final List<TutorModel> tutors;

  const DataTutorsItemWidget({Key? key, required this.tutors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navigateToTutorDetail(BuildContext context, String code) {
      Navigator.pushNamed(context, AppRoutes.tutorDetailScreen, arguments: code);
    }

    String truncateText(String text) {
      if (text.length > 10) {
        return text.substring(0, 10) + '...';
      } else {
        return text;
      }
    }

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 16.v,
        );
      },
      itemCount: tutors.length,
      itemBuilder: (context, index) {
        final TutorModel tutor = tutors[index];
        return GestureDetector(
          onTap: () {
            _navigateToTutorDetail(context, tutor.code);
          },
          child: Container(
            padding: EdgeInsets.all(15.h),
            decoration: AppDecoration.outlineBluegray501.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(24.h)),
                        child: CustomImageView(
                          width: 48.h,
                          height: 48.h,
                          imagePath: tutor.avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
                        width: 45,
                        decoration: AppDecoration.outlineAmberA200.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder5,
                        ),
                        child: Row(children: [
                          Container(
                            child: CustomImageView(
                              imagePath: ImageConstant.imgSignalOnerrorcontainer,
                              height: 9.adaptSize,
                              width: 9.adaptSize,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "4.5",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w800),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.h, top: 2.v, bottom: 2.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tutor.fullname, style: theme.textTheme.titleSmall),
                      SizedBox(height: 10.v),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: Colors.grey[600]),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                              tutor.address,
                              style: CustomTextStyles.labelLargeGray60001,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 2.h, top: 30.v, bottom: 2.v),
                  child: Text(
                    truncateText(tutor.teachingSubject),
                    style: CustomTextStyles.labelLargeGray60001,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

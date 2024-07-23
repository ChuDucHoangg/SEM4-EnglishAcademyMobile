import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/TurtorModel.dart';
import '../../../../theme/app_decoration.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../theme/theme_helper.dart';

class InformationTutor extends StatelessWidget {
  final TutorModel tutor;

  const InformationTutor({
    Key? key,
    required this.tutor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(15),
            decoration: AppDecoration.outlineBluegray505.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: CustomImageView(
                          width: 70,
                          height: 70,
                          imagePath: tutor.avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tutor.fullname,
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.bookmark_border,
                            color: Colors.grey[600],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1),
                            child: Text(
                              tutor.teachingSubject,
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
                  padding: EdgeInsets.only(top: 30, bottom: 2),
                  child: Text(
                    "\$${tutor.hourlyRate.toString()} / Hour",
                    style: CustomTextStyles.labelLargeGray60001,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'The sessions you choose will be repeated over the weeks...',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

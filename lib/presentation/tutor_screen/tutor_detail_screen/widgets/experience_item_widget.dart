import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/data/model/TurtorModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ExperienceItemWidget extends StatefulWidget {
  final TutorModel tutor;

  const ExperienceItemWidget({Key? key, required this.tutor}) : super(key: key);

  @override
  _ExperienceItemWidgetState createState() => _ExperienceItemWidgetState();
}

class _ExperienceItemWidgetState extends State<ExperienceItemWidget>
    with AutomaticKeepAliveClientMixin<ExperienceItemWidget> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 27.v,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 8.v,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.h),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: widget.tutor.address,
                            style: CustomTextStyles.titleSmallff6b7280),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 25.v,
                  ),
                  Text(
                    "Descriptions",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 8.v,
                  ),
                  Container(
                    child: HtmlWidget(
                      widget.tutor.experience,
                      textStyle: CustomTextStyles.titleSmallff6b7280,
                    ),
                  ),
                  SizedBox(
                    height: 25.v,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

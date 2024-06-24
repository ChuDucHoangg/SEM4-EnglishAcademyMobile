import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/data/model/TurtorModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CertificateItemWidget extends StatefulWidget {
  final TutorModel tutor;

  const CertificateItemWidget({Key? key, required this.tutor})
      : super(key: key);

  @override
  _CertificateItemWidgetState createState() => _CertificateItemWidgetState();
}

class _CertificateItemWidgetState extends State<CertificateItemWidget>
    with AutomaticKeepAliveClientMixin<CertificateItemWidget> {
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
                  HtmlWidget(
                    widget.tutor.cetificate,
                    textStyle: theme.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 30.v,
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

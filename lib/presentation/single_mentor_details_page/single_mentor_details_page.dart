import 'widgets/graphicdesign4_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SingleMentorDetailsPage extends StatefulWidget {
  const SingleMentorDetailsPage({Key? key})
      : super(
    key: key,
  );

  @override
  SingleMentorDetailsPageState createState() => SingleMentorDetailsPageState();
}

class SingleMentorDetailsPageState extends State<SingleMentorDetailsPage>
    with AutomaticKeepAliveClientMixin<SingleMentorDetailsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.h,
                  right: 22.h,
                ),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (
                      context,
                      index,
                      ) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.5.v),
                      child: SizedBox(
                        width: 320.h,
                        child: Divider(
                          height: 1.v,
                          thickness: 1.v,
                          color: appTheme.blueGray200,
                        ),
                      ),
                    );
                  },
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Graphicdesign4ItemWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

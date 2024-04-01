import 'widgets/fortytwo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SingleMentorDetailsRatingPage extends StatefulWidget {
  const SingleMentorDetailsRatingPage({Key? key})
      : super(
    key: key,
  );

  @override
  SingleMentorDetailsRatingPageState createState() =>
      SingleMentorDetailsRatingPageState();
}

class SingleMentorDetailsRatingPageState
    extends State<SingleMentorDetailsRatingPage>
    with AutomaticKeepAliveClientMixin<SingleMentorDetailsRatingPage> {
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
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                    context,
                    index,
                    ) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 11.5.v),
                    child: SizedBox(
                      width: 360.h,
                      child: Divider(
                        height: 1.v,
                        thickness: 1.v,
                        color: appTheme.blue50,
                      ),
                    ),
                  );
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  return FortytwoItemWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

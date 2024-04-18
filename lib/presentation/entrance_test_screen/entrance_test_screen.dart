import 'package:english_academy_mobile/presentation/entrance_test_screen/widgets/data_test_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';


class EntranceTestScreen extends StatefulWidget {
  const EntranceTestScreen({Key? key}) : super(key: key);

  @override
  EntranceTestScreenState createState() => EntranceTestScreenState();
}

class EntranceTestScreenState extends State<EntranceTestScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 24.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // _buildTabview(context),
                // SizedBox(height: 40.v),
                _buildEntranceTest(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      // leading: AppbarLeadingImage(
      //   imagePath: ImageConstant.imgArrowLeftGray900,
      //   margin: EdgeInsets.only(left: 22.h),
      // ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Entrance Test",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgShareTwo,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        )
      ],
    );
  }

  // Widget _buildTabview(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 16.0),
  //     child: Container(
  //       height: 52.v,
  //       width: 327.h,
  //       decoration: BoxDecoration(
  //         color: appTheme.gray900,
  //         borderRadius: BorderRadius.circular(5.h)
  //       ),
  //       child: TabBar(
  //         controller: tabviewController,
  //         labelPadding: EdgeInsets.zero,
  //         labelColor: appTheme.gray900,
  //         labelStyle: TextStyle(
  //           fontSize: 12.fSize,
  //           fontFamily: 'SFProText',
  //           fontWeight: FontWeight.w700,
  //         ),
  //         unselectedLabelColor: appTheme.blueGray900,
  //         unselectedLabelStyle: TextStyle(
  //           fontSize: 12.fSize,
  //           fontFamily: 'SFProText',
  //           fontWeight: FontWeight.w700,
  //         ),
  //         indicator: BoxDecoration(),
  //         tabs: [
  //           _buildTab("IELTS", 0),
  //           _buildTab("TOEIC", 1),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildTab(String title, int index) {
    return Expanded(
      child: Tab(
        child: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  tabviewController.index = index;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: tabviewController.index == index ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.h),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: tabviewController.index == index ? appTheme.gray900 : appTheme.blueGray300,
                      fontSize: 12.fSize,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEntranceTest(BuildContext context) {
    return DataTestItemWidget();
  }
}
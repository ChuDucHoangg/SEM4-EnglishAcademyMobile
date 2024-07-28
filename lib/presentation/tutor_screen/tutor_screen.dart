import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'widgets/data_tutors_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/data/model/TurtorModel.dart';
import 'package:english_academy_mobile/service/TutorService.dart';

class TutorScreen extends StatefulWidget {
  TutorScreen({Key? key}) : super(key: key);

  @override
  _TutorScreenState createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen> {
  TextEditingController searchController = TextEditingController();
  List<TutorModel> allTutors = [];
  List<TutorModel> filteredTutors = [];

  @override
  void initState() {
    super.initState();
    fetchTutors();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    filterTutors();
  }

  Future<void> fetchTutors() async {
    allTutors = await TutorService.fetchTutors();
    setState(() {
      filteredTutors = allTutors;
    });
  }

  void filterTutors() {
    List<TutorModel> results = [];
    if (searchController.text.isEmpty) {
      results = allTutors;
    } else {
      results = allTutors
          .where((tutor) => tutor.fullname
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredTutors = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SizedBox(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 15.v),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchView(
                  controller: searchController,
                  hintText: "Search",
                  hintStyle: CustomTextStyles.bodyMediumBluegray300,
                  borderDecoration: SearchViewStyleHelper.outlineBlueGrayTL12,
                  filled: false,
                  autofocus: false,
                ),
                SizedBox(height: 17.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Showing ",
                        style: CustomTextStyles.titleSmallff6b7280,
                      ),
                      TextSpan(
                        text:
                            "${filteredTutors.length} instructor${filteredTutors.length == 1 ? '' : 's'}",
                        style: CustomTextStyles.titleSmallff111827,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 17.v),
                DataTutorsItemWidget(tutors: filteredTutors),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 40.h,
      title: AppbarSubtitleOne(
        margin: EdgeInsets.only(left: 22.h),
        text: "Tutor",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgTelevision,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        )
      ],
    );
  }
}

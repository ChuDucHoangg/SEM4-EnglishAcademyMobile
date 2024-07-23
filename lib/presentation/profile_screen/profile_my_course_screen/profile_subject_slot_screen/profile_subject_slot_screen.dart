import 'package:english_academy_mobile/data/model/SubjectOfflineModel.dart';
import 'package:english_academy_mobile/service/CourseOfflineService.dart';
import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_trailing_image.dart';
import 'package:english_academy_mobile/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class ProfileSubjectSlotScreen extends StatefulWidget {
  final String slug;

  const ProfileSubjectSlotScreen({Key? key, required this.slug})
      : super(
          key: key,
        );

  @override
  ProfileSubjectSlotScreenState createState() =>
      ProfileSubjectSlotScreenState();
}

class ProfileSubjectSlotScreenState extends State<ProfileSubjectSlotScreen>
    with AutomaticKeepAliveClientMixin<ProfileSubjectSlotScreen> {
  @override
  bool get wantKeepAlive => true;
  TextEditingController searchController = TextEditingController();
  late Future<SubjectOfflineModel> _subjectFuture;

  @override
  void initState() {
    super.initState();
    _subjectFuture =
        CourseOfflineService.fetchSubjectOfflineDetail(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SubjectOfflineModel>(
        future: _subjectFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final SubjectOfflineModel subject = snapshot.data!;
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: _buildAppBar(context),
              body: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 4.v),
                  child: Column(
                    children: [
                      _buildSearchSubject(context, subject),
                      SizedBox(height: 27.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text(
                            "Slot in the Subject",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.v),
                      _buildContent(context, subject),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 50.v,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 16.v,
          bottom: 16.v,
        ),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarSubtitle(
        text: "Subject",
        margin: EdgeInsets.only(left: 10.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgGridGray90024x24,
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 16.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSearchSubject(
      BuildContext context, SubjectOfflineModel subject) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 32.v,
      ),
      decoration: AppDecoration.fillPrimary,
      child: Column(
        children: [
          SizedBox(height: 5.v),
          Text(
            subject.name,
            style: CustomTextStyles.headlineMediumOnErrorContainer,
          ),
          SizedBox(height: 23.v),
          CustomSearchView(
            controller: searchController,
            hintText: "Search Slot",
            hintStyle: CustomTextStyles.bodyMediumBluegray300,
            contentPadding: EdgeInsets.only(
              top: 19.v,
              right: 30.h,
              bottom: 19.v,
            ),
            borderDecoration: SearchViewStyleHelper.fillOnErrorContainer,
            fillColor: theme.colorScheme.onErrorContainer.withOpacity(0.1),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContent(BuildContext context, SubjectOfflineModel subject) {
    void _navigateToSubjectLearning(BuildContext context, String slug) {
      Navigator.pushNamed(context, AppRoutes.profileSubjectLearningScreen,
          arguments: slug);
    }

    List<Widget> slotWidgets = [];

    for (int i = 0; i < subject.slotResponseDetailList.length; i++) {
      var slot = subject.slotResponseDetailList[i];
      slotWidgets.add(Column(children: [
        SizedBox(height: 10.v),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h),
          decoration: AppDecoration.outlineBluegray501.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExpansionTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                title: Text(
                  slot['name'],
                  style: theme.textTheme.titleSmall!,
                ),
                subtitle: Text(
                  slot['time'],
                  style: theme.textTheme.bodySmall!,
                ),
                children: [
                  Container(
                    decoration: AppDecoration.outlineBluegray506,
                  ),
                  if (slot['itemSlotResponseList'].isEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Text(
                        "This slot has no content",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  for (var item in slot['itemSlotResponseList'])
                    Column(children: [
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: GestureDetector(
                          onTap: () {
                            _navigateToSubjectLearning(context, item['slug']);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _getIconBasedOnItemType(item['itemType']),
                                size: 20.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 12.h,
                                  top: 2.v,
                                ),
                                child: Text(
                                  item['title'],
                                  style: CustomTextStyles.labelLargeGray900.copyWith(
                                    color: appTheme.gray900,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.lock_open_outlined,
                                size: 16.adaptSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  SizedBox(height: 16.v),
                ],
              ),
            ],
          ),
        ),
      ]));
    }

    return Column(children: slotWidgets);
  }

  IconData _getIconBasedOnItemType(int itemType) {
    switch (itemType) {
      case 0:
        return Icons.edit_document;
      case 1:
        return Icons.pending_actions_outlined;
      case 2:
        return Icons.help_outline;
      default:
        return Icons.pending_actions_outlined; // Default icon
    }
  }


  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

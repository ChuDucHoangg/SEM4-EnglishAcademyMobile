import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/data/model/TurtorModel.dart';
import 'package:english_academy_mobile/presentation/tutor_screen/tutor_detail_screen/widgets/certificate_item_widget.dart';
import 'package:english_academy_mobile/presentation/tutor_screen/tutor_detail_screen/widgets/experience_item_widget.dart';
import 'package:english_academy_mobile/presentation/tutor_screen/tutor_hire_screen/animation_tutor_hire.dart';
import 'package:english_academy_mobile/service/TutorService.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/image_constant.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';

class TutorDetailScreen extends StatefulWidget {
  final String code;

  const TutorDetailScreen({Key? key, required this.code})
      : super(
          key: key,
        );

  @override
  _TutorDetailScreenState createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  late Future<TutorModel> _tutorFuture;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
    _tutorFuture = TutorService.fetchTutorDetail(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TutorModel>(
        future: _tutorFuture,
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
            final TutorModel tutor = snapshot.data!;
            return Scaffold(
              appBar: _buildAppBar(context),
              body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 16.v),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 413.v,
                        width: 316.h,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            _buildPhoto(context, tutor),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomElevatedButton(
                                      height: 24.v,
                                      width: 56.h,
                                      text: "4.5",
                                      leftIcon: Container(
                                        margin: EdgeInsets.only(right: 4.h),
                                        child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgSignalOnerrorcontainer,
                                          height: 10.adaptSize,
                                          width: 10.adaptSize,
                                        ),
                                      ),
                                      buttonStyle:
                                          CustomButtonStyles.fillAmberA,
                                      buttonTextStyle: CustomTextStyles
                                          .labelLargeOnErrorContainer,
                                    ),
                                    SizedBox(height: 9.v),
                                    Text(
                                      tutor.fullname,
                                      style: theme.textTheme.headlineSmall,
                                    ),
                                    SizedBox(height: 8.v),
                                    Text(
                                      tutor.teachingSubject,
                                      style: CustomTextStyles
                                          .bodySmallBluegray30002,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 17.v),
                      _buildStats(context),
                      SizedBox(
                        height: 16.v,
                      ),
                      _builTabview(context),
                      _builTabBarView(context, tutor)
                    ],
                  ),
                ),
              ),
              floatingActionButton: ExtendedFloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return AnimationTutorHire(tutor: tutor);
                    },
                    opaque: false,
                  ));
                },
                label: Text(
                  'HIRE TUTOR',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.edit, color: Colors.white),
                backgroundColor: Color(0xFF1E2857),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            );
          }
        });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 22.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgShareTwo,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
        )
      ],
    );
  }

  Widget _buildPhoto(BuildContext context, TutorModel tutor) {
    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.customBorderTL32,
              image: DecorationImage(
                image: NetworkImage(tutor.avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.5, 0),
                  end: Alignment(0.5, 1),
                  colors: [
                    theme.colorScheme.onErrorContainer.withOpacity(0),
                    theme.colorScheme.onErrorContainer.withOpacity(1)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(vertical: 12.v),
      decoration: AppDecoration.outlineOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "585",
                style: CustomTextStyles.titleMediumOnErrorContainer_1,
              ),
              SizedBox(height: 3.v),
              Text(
                "Students",
                style: CustomTextStyles.bodySmallBluegray30002,
              )
            ],
          ),
          SizedBox(
            height: 38.v,
            child: VerticalDivider(
              width: 1.h,
              thickness: 1.v,
              color: theme.colorScheme.onErrorContainer.withOpacity(0.1),
              indent: 7.h,
              endIndent: 7.h,
            ),
          ),
          Column(
            children: [
              Text(
                "352",
                style: CustomTextStyles.titleMediumOnErrorContainer_1,
              ),
              SizedBox(
                height: 4.v,
              ),
              Text(
                "Reviews",
                style: CustomTextStyles.bodySmallBluegray30002,
              )
            ],
          ),
          SizedBox(
            height: 38.v,
            child: VerticalDivider(
              width: 1.h,
              thickness: 1.v,
              color: theme.colorScheme.onErrorContainer.withOpacity(0.1),
              indent: 7.h,
              endIndent: 7.h,
            ),
          ),
          Column(
            children: [
              Text(
                "75%",
                style: CustomTextStyles.titleMediumOnErrorContainer_1,
              ),
              SizedBox(
                height: 4.v,
              ),
              Text(
                "Positive",
                style: CustomTextStyles.bodySmallBluegray30002,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _builTabview(BuildContext context) {
    return Container(
      height: 40.v,
      width: 327.h,
      decoration: BoxDecoration(
        color: appTheme.gray5002,
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.gray900,
        labelStyle: TextStyle(
            fontSize: 12.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700),
        unselectedLabelColor: appTheme.blueGray300,
        unselectedLabelStyle: TextStyle(
            fontSize: 12.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700),
        indicatorPadding: EdgeInsets.all(4.0.h),
        // indicator: BoxDecoration(
        //     color: theme.colorScheme.onErrorContainer.withOpacity(1),
        //     borderRadius: BorderRadius.circular(6.h),
        //     boxShadow: [
        //       BoxShadow(
        //           color: appTheme.gray900.withOpacity(0.04),
        //           spreadRadius: 2.h,
        //           blurRadius: 2.h,
        //           offset: Offset(1, 2))
        //     ]
        // ),
        tabs: [
          Tab(
            child: Text("Experience"),
          ),
          Tab(
            child: Text("Certificate"),
          )
        ],
      ),
    );
  }

  Widget _builTabBarView(BuildContext context, TutorModel tutor) {
    return SizedBox(
      height: 159.v,
      child: TabBarView(
        controller: tabviewController,
        children: [
          ExperienceItemWidget(tutor: tutor),
          CertificateItemWidget(tutor: tutor)
        ],
      ),
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

class ExtendedFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget label;
  final Widget icon;
  final Color backgroundColor;

  ExtendedFloatingActionButton({
    required this.onPressed,
    required this.label,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: label,
      icon: icon,
      backgroundColor: backgroundColor,
    );
  }
}

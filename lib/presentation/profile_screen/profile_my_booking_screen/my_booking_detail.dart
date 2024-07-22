import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/data/model/BookingModel.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_my_booking_screen/join_room_screen.dart';
import 'package:english_academy_mobile/service/BookingService.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../tutor_screen/tutor_hire_screen/tutor_hire_screen.dart';

class MyBookingDetail extends StatefulWidget {
  final int id;

  const MyBookingDetail({super.key, required this.id});

  @override
  State<MyBookingDetail> createState() => _MyBookingDetailState();
}

class _MyBookingDetailState extends State<MyBookingDetail> {
  late Future<BookingModel> _bookingFuture;

  @override
  void initState() {
    super.initState();
    _bookingFuture = BookingService.fetchBookingDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    String truncateText(String text) {
      if (text.length > 18) {
        return text.substring(0, 18) + '...';
      } else {
        return text;
      }
    }

    String formatDate(String dateTime) {
      final parts = dateTime.split('T')[0].split('-');
      return '${parts[2]}/${parts[1]}/${parts[0]}';
    }

    return FutureBuilder<BookingModel>(
        future: _bookingFuture,
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
            final BookingModel booking = snapshot.data!;
            return Scaffold(
              appBar: _buildAppBar(context),
              body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 20.v),
                  child: Column(
                    children: [
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Information",
                                style: theme.textTheme.titleMedium,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.v),
                                child: Text(
                                  booking.status,
                                  style: CustomTextStyles.labelLargePrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          width: 327.h,
                          margin: EdgeInsets.symmetric(horizontal: 23.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.h,
                            vertical: 13.v,
                          ),
                          decoration: AppDecoration.outlineBluegray50.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.v),
                              Text(
                                booking.tutorName,
                                style: theme.textTheme.titleSmall,
                              ),
                              SizedBox(height: 7.v),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.h,
                                    vertical: 4.v,
                                  ),
                                  decoration: AppDecoration.fillYellow.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder12,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: booking.lessonDays
                                        .map(
                                          (lessonDay) => Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12.v),
                                            decoration: AppDecoration
                                                .outlineBluegray502,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 2.v),
                                                  child: Text(
                                                    lessonDay['dayOfWeek'],
                                                    style: theme
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                      color: appTheme.gray60001,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 1.v),
                                                  child: Text(
                                                    "${lessonDay['startTime']} - ${lessonDay['endTime']}",
                                                    style: CustomTextStyles
                                                        .bodySmallGray900
                                                        .copyWith(
                                                      color: appTheme.gray900,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Lessons",
                                style: theme.textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: Column(
                            children: booking.lessionBookingDTOS
                                .map((lesson) => Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15.h,
                                              vertical: 16.v,
                                            ),
                                            decoration: AppDecoration
                                                .outlineBluegray501
                                                .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder12,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomIconButton(
                                                        height: 45.adaptSize,
                                                        width: 90.adaptSize,
                                                        child: Center(
                                                            child: Text(
                                                          formatDate(lesson[
                                                              'scheduledStartTime']),
                                                        ))),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 10.h,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Code: ",
                                                                style: theme
                                                                    .textTheme
                                                                    .titleSmall,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  String? path =
                                                                      lesson[
                                                                          'path'];
                                                                  if (path !=
                                                                          null &&
                                                                      path !=
                                                                          'N/A') {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                JoinRoomScreen(
                                                                          path:
                                                                              path,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                                child: Text(
                                                                  truncateText(
                                                                      lesson['path'] ??
                                                                          'N/A'),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .lightBlue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 6.v),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Status: ",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodySmall,
                                                              ),
                                                              Text(
                                                                lesson['status'] ??
                                                                    'N/A',
                                                                style: CustomTextStyles
                                                                    .labelMediumPrimary,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 16.h,
                                                    vertical: 4.v,
                                                  ),
                                                  decoration: AppDecoration
                                                      .fillGray100
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder12,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 12.v),
                                                        decoration: AppDecoration
                                                            .outlineBluegray502,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 2.v),
                                                              child: Text(
                                                                "Scheduled Time",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodySmall!
                                                                    .copyWith(
                                                                  color: appTheme
                                                                      .gray60001,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 1.v),
                                                              child: Text(
                                                                "${lesson['scheduledStartTime']?.split('T')[1] ?? 'N/A'} - ${lesson['scheduledEndTime']?.split('T')[1] ?? 'N/A'}",
                                                                style: CustomTextStyles
                                                                    .bodySmallGray900
                                                                    .copyWith(
                                                                  color: appTheme
                                                                      .gray900,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 12.v),
                                                        decoration: AppDecoration
                                                            .outlineBluegray502,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 2.v),
                                                              child: Text(
                                                                "Actual Time",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodySmall!
                                                                    .copyWith(
                                                                  color: appTheme
                                                                      .gray60001,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 1.v),
                                                              child: Text(
                                                                "${lesson['actualStartTime']?.split('T')[1] ?? 'N/A'} - ${lesson['actualEndTime']?.split('T')[1] ?? 'N/A'}",
                                                                style: CustomTextStyles
                                                                    .bodySmallGray900
                                                                    .copyWith(
                                                                  color: appTheme
                                                                      .gray900,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                        SizedBox(height: 12.h),
                                      ],
                                    ))
                                .toList(),
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
              ),
              // floatingActionButton: ExtendedFloatingActionButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => JoinRoomScreen()),
              //     );
              //   },
              //   label: Text(
              //     'JOIN ROOM',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   icon: Icon(Icons.meeting_room, color: Colors.white),
              //   backgroundColor: Color(0xFF1E2857),
              // ),
              // floatingActionButtonLocation:
              //     FloatingActionButtonLocation.endFloat,
            );
          }
        });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 35.h,
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 22.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Booking Detail",
      ),
    );
  }
}

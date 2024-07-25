import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_my_booking_screen/booking_waiting_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/model/BookingModel.dart';
import '../../../service/BookingService.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';

class BookingWaitingScreen extends StatefulWidget {
  const BookingWaitingScreen({super.key});

  @override
  State<BookingWaitingScreen> createState() => _BookingWaitingScreenState();
}

class _BookingWaitingScreenState extends State<BookingWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StudentPackageDTO>>(
      future: BookingService.fetchBookingWaitingList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<StudentPackageDTO> bookings = snapshot.data!;
          return Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 26.0, vertical: 15),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16.v,
                  );
                },
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final StudentPackageDTO booking = bookings[index];
                  return GestureDetector(
                    onTap: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookingWaitingDetailScreen(id: booking.id),
                          ),
                        );
                      }
                    },
                    child: Container(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  child: Image.network(
                                    width: 50,
                                    height: 50,
                                    "https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg",
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
                                  booking.studentName,
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.keyboard_option_key_outlined,
                                      color: Colors.grey[600],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 1),
                                      child: Text(
                                        booking.packageName,
                                        style: CustomTextStyles
                                            .labelLargeGray60001,
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
                              booking.status,
                              style: CustomTextStyles.labelMediumPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 35.h,
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 22.h),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(text: "Booking Waiting"),
    );
  }
}

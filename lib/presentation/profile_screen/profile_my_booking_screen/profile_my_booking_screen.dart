import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/data/model/BookingModel.dart';
import 'package:english_academy_mobile/service/BookingService.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';

class ProfileMyBookingListScreen extends StatefulWidget {
  const ProfileMyBookingListScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileMyBookingListScreenState createState() =>
      ProfileMyBookingListScreenState();
}

class ProfileMyBookingListScreenState extends State<ProfileMyBookingListScreen>
    with AutomaticKeepAliveClientMixin<ProfileMyBookingListScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // void _navigateToBookingDetail(BuildContext context, String code) {
    //   Navigator.pushNamed(context, AppRoutes.bookingDetailScreen,
    //       arguments: code);
    // }

    String truncateText(String text) {
      if (text.length > 10) {
        return text.substring(0, 10) + '...';
      } else {
        return text;
      }
    }

    return FutureBuilder<List<BookingModel>>(
      future: BookingService.fetchBookingList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<BookingModel> bookings = snapshot.data!;
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.v,
              );
            },
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final BookingModel booking = bookings[index];
              return GestureDetector(
                  onTap: () {
                    // _navigateToBookingDetail(context, booking.id);
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
                                booking.tutorName,
                                style: theme.textTheme.titleSmall,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.bookmark_border,
                                    color: Colors.grey[600],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 1),
                                    child: Text(
                                      booking.description,
                                      style:
                                          CustomTextStyles.labelLargeGray60001,
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
                            style: CustomTextStyles.labelLargeGray60001,
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
            // child: Text(''),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

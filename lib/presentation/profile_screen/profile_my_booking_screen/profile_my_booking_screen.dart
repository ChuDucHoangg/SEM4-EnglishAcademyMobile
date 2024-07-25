import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/data/model/BookingModel.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_my_booking_screen/booking_watting_screen.dart';
import 'package:english_academy_mobile/service/BookingService.dart';
import 'package:flutter/material.dart';

class ProfileMyBookingListScreen extends StatefulWidget {
  const ProfileMyBookingListScreen({Key? key}) : super(key: key);

  @override
  ProfileMyBookingListScreenState createState() =>
      ProfileMyBookingListScreenState();
}

class ProfileMyBookingListScreenState extends State<ProfileMyBookingListScreen>
    with
        AutomaticKeepAliveClientMixin<ProfileMyBookingListScreen>,
        SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    void _navigateToBookingDetail(BuildContext context, int id) {
      Navigator.pushNamed(context, AppRoutes.profileBookingDetailScreen,
          arguments: id);
    }

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
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingWaitingScreen(),
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Booking Waiting",
                      style: theme.textTheme.titleSmall,
                    ),
                    TweenAnimationBuilder(
                      tween: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset(1, 0),
                      ),
                      duration: Duration(seconds: 1),
                      curve: Curves.elasticInOut,
                      builder: (context, Offset offset, child) {
                        return Transform.translate(
                          offset: offset,
                          child: child,
                        );
                      },
                      child: Icon(Icons.navigate_next_outlined),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
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
                        _navigateToBookingDetail(context, booking.id);
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
                      ));
                },
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            // child: Text('Error: ${snapshot.error}'),
            child: Text(''),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

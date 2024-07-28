import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import '../../../service/AuthService.dart';
import '../../../service/api_constants.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_rating_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../tutor_screen/tutor_hire_screen/tutor_hire_screen.dart';

class CourseCompleteScreen extends StatefulWidget {
  final String courseSlug;

  CourseCompleteScreen({Key? key, required this.courseSlug}) : super(key: key);

  @override
  CourseCompleteScreenState createState() => CourseCompleteScreenState();
}

class CourseCompleteScreenState extends State<CourseCompleteScreen> {
  bool? isCourseComplete;
  String? errorMessage;
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0.0;

  @override
  void initState() {
    super.initState();
    _checkCourseCompletion();
  }

  Future<void> _checkCourseCompletion() async {
    final String token = await AuthService.getToken();
    final url = Uri.parse(
        '${ApiConstants.baseUrl}/certificate-online/complete-course/${widget.courseSlug}');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        setState(() {
          isCourseComplete = true;
        });
      } else {
        setState(() {
          isCourseComplete = false;
          errorMessage = responseBody['message'];
        });
      }
    } else {
      setState(() {
        isCourseComplete = false;
        errorMessage = 'Failed to check course completion';
      });
    }
  }

  Future<void> _submitReview() async {
    final String token = await AuthService.getToken();
    final url = Uri.parse('${ApiConstants.baseUrl}/api/v1/review');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({
        "courseOnlineSlug": widget.courseSlug,
        "message": _reviewController.text,
        "score": _rating.toInt(),
      }),
    );

    if (response.statusCode == 200) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          title: "Successfully",
          text: "Request sent successfully!",
          confirmBtnColor: Color(0XFF1E2857),
          borderRadius: 25.0,
          width: 320,
          onConfirmBtnTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CourseCompleteScreen(courseSlug: widget.courseSlug)),
            );
          });
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'An error occurred, please try again!',
        confirmBtnColor: Color(0XFF1E2857),
        borderRadius: 25.0,
        width: 320,
      );
    }
  }

  void _launchURL() async {
    const url = 'https://english-academy-psi.vercel.app/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: isCourseComplete == null
          ? Center(child: CircularProgressIndicator())
          : isCourseComplete!
              ? Container(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: LottieBuilder.asset(
                          "assets/lottie/Success.json",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 50.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26.h),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 20),
                          decoration: AppDecoration.outlineBluegray503.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How to Get Certificate?",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '1. Visit our ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'English Academy',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = _launchURL,
                                    ),
                                    TextSpan(
                                      text: ' website',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "2. Log in to your existing account on the site, then access the course you just completed.",
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "3. Click Download Certificate (PNG or PDF)"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26.h),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 20),
                          decoration: AppDecoration.outlineBluegray503.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Write your review about this course",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 15.v),
                              CustomRatingBar(
                                initialRating: 0,
                                color: appTheme.amberA200,
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    _rating = rating;
                                  });
                                },
                              ),
                              SizedBox(height: 15.v),
                              CustomTextFormField(
                                controller: _reviewController,
                                hintText: "Enter your review",
                                autofocus: false,
                                hintStyle:
                                    CustomTextStyles.bodyLargeBluegray300,
                                contentPadding:
                                    EdgeInsets.only(bottom: 25.v, left: 15.v),
                              ),
                              SizedBox(height: 20.v),
                              Padding(
                                padding: EdgeInsets.only(left: 144.1.h),
                                child: GestureDetector(
                                  onTap: _submitReview,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18.h, vertical: 12.v),
                                    decoration: AppDecoration
                                        .outlinePrimaryContainer
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder16,
                                      color: Color(0xFF1E2857),
                                    ),
                                    child: Text(
                                      "Submit Review",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : _buildIncompleteMessage(),
    );
  }

  Widget _buildIncompleteMessage() {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: LottieBuilder.asset(
              "assets/lottie/Fail.json",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 50.v),
          Text(
            "We're sorry, but it looks like you haven't completed the course yet.",
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 18.v),
          Container(
            width: 310.h,
            margin: EdgeInsets.symmetric(horizontal: 8.h),
            child: Text(
              errorMessage ??
                  "Please complete all the required lessons and tests to unlock your certificate of completion.",
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyLargeGray60001.copyWith(
                height: 1.50,
              ),
            ),
          ),
        ],
      ),
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
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "",
      ),
    );
  }
}

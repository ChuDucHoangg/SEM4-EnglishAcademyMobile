import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import '../../../data/model/profileModel.dart';
import '../../../service/profileService.dart';
import '../../../service/BookingService.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'room_screen.dart';

class JoinRoomScreen extends StatefulWidget {
  final String path;
  final TextEditingController _controller;

  JoinRoomScreen({super.key, required this.path})
      : _controller = TextEditingController(text: path);

  @override
  _JoinRoomScreenState createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  late Future<ProfileModel> _profileFuture;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _profileFuture = ProfileService.fetchProfileDetail();
  }

  void _navigateToRoomScreen(ProfileModel profile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomScreen(
          codeRoom: widget._controller.text,
          userID: profile.id.toString(),
          username: profile.fullName,
        ),
      ),
    );
  }

  Future<void> _joinRoom(ProfileModel profile) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      bool isRoomValid =
          await BookingService.checkRoomCode(widget._controller.text);
      if (isRoomValid) {
        _navigateToRoomScreen(profile);
      } else {
        setState(() {
          _errorMessage = 'Room code not found.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'This room has not been opened yet';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: FutureBuilder<ProfileModel>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            final ProfileModel profile = snapshot.data!;
            return _buildContent(context, profile);
          }
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ProfileModel profile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 220),
      child: Container(
        padding: EdgeInsets.all(18.h),
        decoration: AppDecoration.outlineGray90010.copyWith(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomImageView(
                  imagePath:
                      "http://localhost:3000/assets/images/logo/logo.png",
                  height: 66.adaptSize,
                  width: 170.adaptSize,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(8.h),
                  margin: EdgeInsets.only(bottom: 2.v),
                ),
              ],
            ),
            SizedBox(height: 7.v),
            Row(
              children: [
                CustomTextFormField(
                  width: 255,
                  hintText: "Enter room code",
                  controller: widget._controller,
                  autofocus: false,
                  hintStyle: CustomTextStyles.bodyLargeBluegray300,
                  contentPadding: EdgeInsets.only(bottom: 25.v, left: 15.v),
                  borderDecoration: _errorMessage != null
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.h),
                          borderSide: BorderSide(
                            color: appTheme.redA200,
                            width: 1,
                          ),
                        )
                      : null,
                ),
                SizedBox(width: 10),
                _isLoading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () => _joinRoom(profile),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.h, vertical: 14.v),
                          decoration:
                              AppDecoration.outlinePrimaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder16,
                            color: Color(0xFF1E2857),
                          ),
                          child: Icon(
                            Icons.move_down_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ],
            ),
            if (_errorMessage != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 12.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Online Room for students and tutors.",
                style: CustomTextStyles.labelLargeGray60001,
              ),
            ),
            SizedBox(height: 12.v),
          ],
        ),
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
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(text: "Join Room"),
    );
  }
}

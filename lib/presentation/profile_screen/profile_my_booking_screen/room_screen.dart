import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen(
      {Key? key,
      required this.codeRoom,
      required this.userID,
      required this.username})
      : super(key: key);
  final String codeRoom;
  final String userID;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltVideoConference(
      appID: 1832232243,
      appSign:
          "a9ba758ef23a2ac03860936627146d9317980c632837c56fd7f0ccba4097be00",
      userID: userID,
      userName: username,
      conferenceID: codeRoom,
      config: ZegoUIKitPrebuiltVideoConferenceConfig(
        leaveConfirmDialogInfo: ZegoLeaveConfirmDialogInfo(
          title: "Leave the conference",
          message: "Are you sure to leave the conference?",
          cancelButtonName: "Cancel",
          confirmButtonName: "Confirm",
        ),
      ),
    );
  }
}

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
      appID: 738547881,
      appSign:
          "78ae9f0dd89039e1a93f25db732bfea60b531e6c4b473c62ffab2ad9f6e0fd1d",
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

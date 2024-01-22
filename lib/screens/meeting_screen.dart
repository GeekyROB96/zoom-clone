import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  final AuthMethods authMethods = AuthMethods();

 createNewMeeting() async {
  var random = Random();
  String roomName = (random.nextInt(100000000) + 10000000).toString();

  await _jitsiMeetMethods.createMeeting(
    roomName,
    true,
    true,
    authMethods.user.displayName ?? 'DefaultUsername',
  );
}


  joinMeeting(context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: () => createNewMeeting(),
              text: "New Meeting",
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: () => joinMeeting(context),
              text: "Join Meeting",
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: "Schedule",
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: "Share Screen",
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with just a click',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

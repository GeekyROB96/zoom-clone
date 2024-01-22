import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  Future<void> createMeeting(String roomName, bool isAudioMuted,
      bool isVideoMuted, String username) async {
    try {
      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetConferenceOptions(
        serverURL: 'https://jitsi.hadoly.fr/',
        room: roomName!,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "subject": "${roomName}",
        },
        featureFlags: {"unsaferoomwarning.enabled": false},
        userInfo: JitsiMeetUserInfo(
          displayName: name,
          email: _authMethods.user.email,
          avatar: _authMethods.user.photoURL,
        ),
      );

      // Use the JitsiMeet class to join the meeting
      await JitsiMeet().join(options);

      _firestoreMethods.addToMeetingHistory(roomName);
    } catch (e) {
      print("Error creating new meeting: $e");
    }
  }
}

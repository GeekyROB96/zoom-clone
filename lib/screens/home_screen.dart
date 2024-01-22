import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/history_meeting_screen.dart';
import 'package:zoom_clone/screens/meeting_screen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/custom_button.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   int _page = 0;

  OnPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
     MeetingScreen(),
   const HistoryMeetingScreen(),
   const Text('Contacts'),
   CustomButton(text: 'LogOut', onPressed: () {
    AuthMethods authMethods = AuthMethods();
    authMethods.signOut();
    })

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: OnPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: footerColor,
              icon: Icon(Icons.comment_bank),
              label: "Meet & Char"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "Meetings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
    );
  }
}
 
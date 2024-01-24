import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/utils/screens/history_meeting_scren.dart';
import 'package:zoom_clone/utils/screens/meeting_screen.dart';
import 'package:zoom_clone/widgets/custom_button.dart';


class HomeScrren extends StatefulWidget {
  const HomeScrren({super.key});
  
  @override
  State<HomeScrren> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {
  int _page = 0;
  OnPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

List<Widget> pages = [
   MeetingScreen(),
  const HistoryMeetingScreen(),
  const Text("COntact"),
  CustomButton(text: 'Log Out', onPressed:() => AuthMethod().signOut()),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          currentIndex: _page,
          onTap: OnPageChange,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet & Char'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meeting'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Contact'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Seeting'),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet & Char'),
          ]),
    );
  }

}

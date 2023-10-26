import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/chat_screen.dart';
import 'package:mental_health_app/pages/home_page.dart';
import 'package:mental_health_app/pages/profile_page.dart';
import 'package:mental_health_app/pages/schedule_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = const [
    HomePage(),
    SchedulePage(),
    ChatScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(
        Icons.home,
        size: 30,
      ),
      const Icon(
        Icons.calendar_month_rounded,
        size: 30,
      ),
      const Icon(
        Icons.message_rounded,
        size: 30,
      ),
      const Icon(
        Icons.person_2_rounded,
        size: 30,
      ),
    ];
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        backgroundColor: Colors.transparent,
        items: items,
        index: currentIndex,
        height: 60,
        onTap: (index) => setState(() {
          currentIndex = index;
        })),
      // bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: currentIndex,
      //     onTap: (index) => setState(() {
      //           currentIndex = index;
      //         }),
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.calendar_month),
      //         label: "Calender",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.message_rounded),
      //         label: "Chat",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person_outline_rounded),
      //         label: "Profile",
      //       )
      //     ]),
    );
  }
}

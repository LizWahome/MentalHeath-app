import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/student/bottom_nav_bar.dart';
import 'package:mental_health_app/pages/chat_screen.dart';
import 'package:mental_health_app/pages/profile_page.dart';
import 'package:mental_health_app/pages/therapist/therapist_completed.dart';
import 'package:mental_health_app/pages/therapist/therapist_home.dart';
import 'package:mental_health_app/pages/therapist/therapist_profile.dart';
import 'package:mental_health_app/pages/therapist/therapist_schedule.dart';

class TherapistPage extends StatefulWidget {
  const TherapistPage({super.key});

  @override
  State<TherapistPage> createState() => _TherapistPageState();
}

class _TherapistPageState extends State<TherapistPage> {
  int currentIndex = 0;
  final screens = [
    const TherapistHomePage(),
    const TherapistSchedulePage(),
    const TherapistCompletedPage(),
    const TherapistProfile()
  ];
  @override
  Widget build(BuildContext context) {
    final items = [
       const Icon(
        Icons.home_rounded,
        size: 25,
      ),
      const Icon(
        Icons.calendar_month_rounded,
        size: 25,
      ),
      const Icon(
        Icons.pending_actions_rounded,
        size: 25,
      ),
      const Icon(
        Icons.person,
        size: 25,
      )
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: const Text("Therapist Page")),
      body: Container(
         decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey.withOpacity(0.5),
              Colors.white.withOpacity(0.1),
              Colors.blue
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: screens[currentIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        backgroundColor: Colors.white.withOpacity(0.1),
        items: items,
        index: currentIndex,
        height: 50,
        onTap: (index) => setState(() {
          currentIndex = index;
        })
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mental_health_app/widgets/health_needs.dart';
import 'package:mental_health_app/widgets/recent_appointments.dart';
import 'package:mental_health_app/widgets/schedule_doctor.dart';

class TherapistHomePage extends StatefulWidget {
  const TherapistHomePage({super.key});

  @override
  State<TherapistHomePage> createState() => _TherapistHomePageState();
}

class _TherapistHomePageState extends State<TherapistHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey.withOpacity(0.5),
              Colors.white.withOpacity(0.1),
              Colors.blue
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
      child: const SafeArea(
        child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'LilitaOne')),
                            SizedBox(
                              height: 5,
                            ),
                            Text("How are you doing today?",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Shirkhand'))
                          ],
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/doctor-2337835_1280.jpg"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ScheduleDoctor(
                        image: "assets/man-8002901_1280.jpg",
                        name: "Vincent Wafula",
                        title: "Student",
                        day: "Today",
                        date: "14:30 - 16:00",
                        row: Row(),),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Care Needs",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'LilitaOne',
                          letterSpacing: 1.2),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    HealthNeeds(),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Recent Appointments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'LilitaOne',
                            letterSpacing: 1.2)),
                    SizedBox(
                      height: 30,
                    ),
                    RecentAppointments(),
                    // TextButton(
                    //     onPressed: () {
                    //       checkRole(snapshot);
                    //     },
                    //     child: const Text("Check role"))
                  ],
                ),
              ),
      ),
    );
  }
}
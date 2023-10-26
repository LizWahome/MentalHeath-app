import 'package:flutter/material.dart';
import 'package:mental_health_app/widgets/schedule_doctor.dart';

class TherapistSchedulePage extends StatefulWidget {
  const TherapistSchedulePage({super.key});

  @override
  State<TherapistSchedulePage> createState() => _TherapistSchedulePageState();
}

class _TherapistSchedulePageState extends State<TherapistSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: const SingleChildScrollView(
        child: Column(
          children: [
              ScheduleDoctor(
              image: "assets/male-2101801_1280.jpg", 
              name: "Robin Mwiti", 
              title: "Student", 
              day: "Today", 
              date: "09:00 - 11:00",
              ),
              SizedBox(
                height: 10,
              ),
              ScheduleDoctor(
              image: "assets/man-8002901_1280.jpg", 
              name: "Bonface Wafula", 
              title: "Student", 
              day: "Monday", 
              date: "09:00 - 11:00",
              ),
              SizedBox(
                height: 10,
              ),
              ScheduleDoctor(
              image: "assets/portrait-3416680_1280.jpg", 
              name: "Christopher Mwali", 
              title: "Student", 
              day: "Saturday", 
              date: "2:00 - 3:00",
              ),
              SizedBox(
                height: 10,
              ),
              ScheduleDoctor(
              image: "assets/black-women-4957031_1280.jpg", 
              name: "Miriam Abdala", 
              title: "Student", 
              day: "Saturday", 
              date: "2:00 - 3:00",
              ),
              SizedBox(
                height: 10,
              ),
              ScheduleDoctor(
              image: "assets/child-1127087_1280.jpg", 
              name: "Christine Nduta", 
              title: "Student", 
              day: "Saturday", 
              date: "2:00 - 3:00",
              ),
            ],
        ),
      ),
    );
  }
}
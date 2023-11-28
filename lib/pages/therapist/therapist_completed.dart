import 'package:flutter/material.dart';
import 'package:mental_health_app/widgets/schedule_doctor.dart';

class TherapistCompletedPage extends StatefulWidget {
  const TherapistCompletedPage({super.key});

  @override
  State<TherapistCompletedPage> createState() => _TherapistCompletedPageState();
}

class _TherapistCompletedPageState extends State<TherapistCompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: const SingleChildScrollView(
        child: Column(
          children: [
              ScheduleDoctor(
              image: "assets/male-2101801_1280.jpg", 
              name: "Dedan Kin", 
              title: "Student", 
              day: "Today", 
              date: "09:00 - 11:00",
              row: Row(),
              ),
              SizedBox(
                height: 10,
              ),
              ScheduleDoctor(
              image: "assets/man-8002901_1280.jpg", 
              name: "Phillip Bright", 
              title: "Student", 
              day: "Monday", 
              date: "09:00 - 11:00",
              row: Row(),
              ),
              SizedBox(
                height: 10,
              ),
              ScheduleDoctor(
              image: "assets/portrait-3416680_1280.jpg", 
              name: "Robert Ndirangu", 
              title: "Student", 
              day: "Saturday", 
              date: "2:00 - 3:00",
              row: Row(),
              ),
              SizedBox(
                height: 10,
              ),
            ],
        ),
      ),
    );
  }
}
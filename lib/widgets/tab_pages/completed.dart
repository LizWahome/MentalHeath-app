import 'package:flutter/material.dart';
import 'package:mental_health_app/widgets/schedule_doctor.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({super.key});

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: const SingleChildScrollView(
        child: Column(
          children: [
              ScheduleDoctor(
              image: "assets/doctor-5710152_1280.jpg", 
              name: "Dr. Robin", 
              title: "Psychologist", 
              day: "24/03/23", 
              date: "09:00 - 11:00",
              ),
              SizedBox(
                height: 10,
              ),
              ScheduleDoctor(
              image: "assets/crutches-538883_1280.jpg", 
              name: "Dr. Joseph Amin", 
              title: "Psychologist", 
              day: "Monday", 
              date: "09:00 - 11:00",
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
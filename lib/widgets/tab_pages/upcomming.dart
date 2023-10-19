import 'package:flutter/material.dart';
import 'package:mental_health_app/widgets/schedule_doctor.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: const SingleChildScrollView(
        child: Column(
          children: [
              ScheduleDoctor(
              image: "assets/doctor-5710152_1280.jpg", 
              name: "Dr. Roy Mwangi", 
              title: "Psychologist", 
              day: "Today", 
              date: "09:00 - 11:00",
              ),
              SizedBox(
                height: 10,
              ),
              ScheduleDoctor(
              image: "assets/crutches-538883_1280.jpg", 
              name: "Dr. Sora Ummy", 
              title: "Psychologist", 
              day: "Monday", 
              date: "09:00 - 11:00",
              ),
              SizedBox(
                height: 10,
              ),
              ScheduleDoctor(
              image: "assets/dentist-1191671_1280.jpg", 
              name: "Dr. Esther Wanja", 
              title: "Psychologist", 
              day: "Saturday", 
              date: "09:00 - 11:00",
              ),
            ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mental_health_app/models/doctor_model.dart';
import 'package:mental_health_app/pages/student/student_detail.dart';

class DoctoInfoWidget extends StatelessWidget {
  final DoctorModel doctor;
  const DoctoInfoWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blueGrey.withOpacity(0.5),
            Colors.white.withOpacity(0.1),
            Colors.blue
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: screenSize.height * 0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(doctor.profile),
                            fit: BoxFit.contain)),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      doctor.position,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text("About",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      doctor.about,
                      style: const TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentDetails()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: const Text("Book Appointment"),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

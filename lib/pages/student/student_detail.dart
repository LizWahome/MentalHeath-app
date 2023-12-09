import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_health_app/pages/student/bottom_nav_bar.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  TextEditingController admController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient's details"),
      ),
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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Fill in your details to book your appointment.",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: admController,
                  decoration: InputDecoration(
                      hoverColor: Colors.green,
                      fillColor: Colors.white.withOpacity(0.9),
                      filled: true,
                      label: Text("ADM NO."),
                      hintText: "Enter your Admission number",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.9),
                      filled: true,
                      label: Text("Name"),
                      hintText: "Enter your name",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.9),
                      filled: true,
                      label: Text("Phone Number"),
                      hintText: "Enter your Phone number",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: reasonController,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.9),
                      filled: true,
                      label: Text("Reason for visit"),
                      hintText: "Enter your reason",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                      "Your appointment has successfully been added to your schedule."),
                                  content: LottieBuilder.asset(
                                    "assets/Animation - 1701678515267.json",
                                    width: 100,
                                    height: 100,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BottomNavBar()));
                                        },
                                        child: const Text("OK")),
                                  ],
                                ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Continue"),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

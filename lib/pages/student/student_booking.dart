import 'package:flutter/material.dart';
import 'package:mental_health_app/models/doctor_model.dart';
import 'package:mental_health_app/widgets/doctor_info.dart';

class StudentBookingPage extends StatefulWidget {
  const StudentBookingPage({super.key});

  @override
  State<StudentBookingPage> createState() => _StudentBookingPageState();
}

class _StudentBookingPageState extends State<StudentBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blueGrey.withOpacity(0.5),
            Colors.white.withOpacity(0.1),
            Colors.blue
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: SafeArea(
          minimum: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Hello\nHere is a list of doctors that can be of assistance to you.",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: nearbyDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = nearbyDoctors[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Card(
                            elevation: 5,
                            color: Colors.lightBlueAccent,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DoctoInfoWidget(doctor: doctor)));
                              },
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage(doctor.profile),
                              ),
                              title: Text(doctor.name),
                              subtitle: Text(doctor.position),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

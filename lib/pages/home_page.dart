import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/therapist_page.dart';
import 'package:mental_health_app/widgets/health_needs.dart';
import 'package:mental_health_app/widgets/nearby_doctor.dart';
import 'package:mental_health_app/widgets/schedule_doctor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  //User? user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error : $snapshot.error");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello {snapshot.data!['name']},",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'LilitaOne')),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("How are you doing today?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Shirkhand'))
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          "assets/toddler-8297939_1280.jpg",
                          width: 50,
                          //height: 50,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ScheduleDoctor(
                      image: "assets/doctor-2337835_1280.jpg",
                      name: "Dr. Salim Faraj",
                      title: "Therapist",
                      day: "Today",
                      date: "14:30 - 16:00"),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Health Needs",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'LilitaOne',
                        letterSpacing: 1.2),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const HealthNeeds(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Nearby Doctor",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'LilitaOne',
                          letterSpacing: 1.2)),
                  const SizedBox(
                    height: 30,
                  ),
                  const NearbyDoctors(),
                  TextButton(
                      onPressed: () {
                        checkRole(snapshot);
                      },
                      child: Text("Check role"))
                ],
              ),
            );
          }
        },
      ),
    );
  }

  checkRole(AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    if (snapshot.data!['role'] == 'Therapist') {
      return TherapistPage();
    } else {
      return HomePage();
    }
  }
}

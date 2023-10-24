import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/models/user_model.dart';
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
  String? myName;
  DocumentSnapshot<Object?>? userSnapshot;
  //User? user;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey.withOpacity(0.5),
              Colors.white.withOpacity(0.1),
              Colors.blue
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
      child: const SafeArea(
        minimum: EdgeInsets.only(top: 50, left: 20, right: 20),
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
                          backgroundImage: AssetImage("assets/sad-2042536_1280.jpg"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ScheduleDoctor(
                        image: "assets/doctor-2337835_1280.jpg",
                        name: "Dr. Salim Faraj",
                        title: "Therapist",
                        day: "Today",
                        date: "14:30 - 16:00"),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Health Needs",
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
                    Text("Nearby Doctor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'LilitaOne',
                            letterSpacing: 1.2)),
                    SizedBox(
                      height: 30,
                    ),
                    NearbyDoctors(),
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

  Future<String?> getUserDetails() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userSnapshot.exists && userSnapshot.data() != null) {
          return userSnapshot['name'];
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user name: $e');
      return null;
    }
  }

  checkRole(AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    if (snapshot.data!['role'] == 'Therapist') {
      return const TherapistPage();
    } else {
      return const HomePage();
    }
  }

  Stream<List<UserModel>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());

  fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds.get('W8GSvxr0Atc82ckZKTz5');
        print(myName);
      });
    }
  }
}

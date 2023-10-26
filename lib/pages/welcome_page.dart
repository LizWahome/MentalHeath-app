import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_health_app/pages/bottom_nav_bar.dart';
import 'package:mental_health_app/pages/home_page.dart';
import 'package:mental_health_app/pages/therapist/therapist_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          snapshot.data;
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(snapshot.data!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final user = snapshot.data!.data();
                  final role = user as Map<String, dynamic>;
                  if (role['role'] == 'therapist') {
                    return const TherapistPage();
                  } else {
                    return const BottomNavBar();
                  }
                }
                return Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(150),
                                  bottomRight: Radius.circular(150)),
                              color: Colors.blue.shade900),
                          height: screenSize.height * 0.5,
                          child: Lottie.asset("assets/animation_lnombhzg.json"),
                        ),
                        const Text(
                          "Take care of your",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'CarterOne'),
                        ),
                        const Text("Mental Health",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Shrikhand')),
                        const Text(
                            "Are you struggling with stress and\n anxiety? We're here to help you.",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'YoungSerif',
                              fontWeight: FontWeight.w400,
                              //letterSpacing: 1.2,
                            )),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavBar()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                color: Colors.blue.shade900),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40),
                              child: Text("Start Exploring",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

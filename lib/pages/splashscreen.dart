import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/chat_screen.dart';
import 'package:mental_health_app/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final _userController = StreamController<bool>();
  Stream<bool> get userStream => _userController.stream;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    checkUserExistenceAndNotify();
    //_checkUser();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Stack(
                children: [
                  const Image(
                    image: AssetImage("assets/mental-health-2019924_1280.jpg"),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.1)
                        ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: ScaleTransition(
                          scale: animation,
                          child: Image.asset("assets/image2.png")))
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return ChatScreen();
          } else {
            return LoginPage();
          }
        });
  }

  Future<bool> checkUserExistence() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }

  Future<void> checkUserExistenceAndNotify() async {
    bool userExists = await checkUserExistence();
    _userController.add(userExists);
  }

  // void _checkUser() async {
  //   StreamBuilder(
  //     stream: FirebaseAuth.instance.authStateChanges(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       } else if (snapshot.hasError) {
  //         return const Center(
  //           child: Text("Something went wrong"),
  //         );
  //       } else if (snapshot.hasData) {
  //         Future.delayed(const Duration(seconds: 6), () async {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => const ChatScreen()));
  //         });
  //       } else {
  //         Future.delayed(const Duration(seconds: 6), () async {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => const LoginPage()));
  //         });
  //       }
  //       return Text("Working on it");
  //     },
  //   );
  // }
}

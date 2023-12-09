import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/login_page.dart';
import 'package:mental_health_app/pages/welcome_page.dart';

class SpashPage extends StatefulWidget {
  const SpashPage({super.key});

  @override
  State<SpashPage> createState() => _SpashPageState();
}

class _SpashPageState extends State<SpashPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    _checkUser();
  }

  @override
  void dispose() {
     controller.dispose();
    super.dispose();
   
  }

  @override
  Widget build(BuildContext context) {
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
                gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.1)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          Align(
              alignment: Alignment.center,
              child: ScaleTransition(
                  scale: animation, child: Image.asset("assets/image2.png")))
        ],
      ),
    );
  }

  void _checkUser() {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      Future.delayed(const Duration(seconds: 6), () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const WelcomePage()));
      });
    } else {
      Future.delayed(const Duration(seconds: 6), () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginPage()));
      });
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/student/bottom_nav_bar.dart';
import 'package:mental_health_app/pages/register_page.dart';
import 'package:mental_health_app/pages/therapist/therapist_page.dart';
import 'package:mental_health_app/pages/welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Image(
              image: const AssetImage("assets/conversation-7559233_1280.jpg"),
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blueGrey.withOpacity(0.5),
                  Colors.white.withOpacity(0.1),
                  Colors.blue
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
            Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Email"),
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Password"),
                              validator: (value) =>
                                  value != null && value.length < 8
                                      ? "Enter at least 8 characters"
                                      : null,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()));
                                },
                                child: const Text("Register",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple),
                                  onPressed: () {
                                    signIn();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text("Login"),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final isValid = _formKey.currentState!.validate();
    _formKey.currentState!.save();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          dismissDirection: DismissDirection.up,
          content: Text(
            "Successfully logged in.",
          ),
          backgroundColor: Colors.green,
        ));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WelcomePage()));
      });
      User? user = userCredential.user;
      final userID = user!.uid;
      print("User uid = $userID");
      // DocumentSnapshot snapshot = await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(user.uid)
      //     .get();
      // if (snapshot.exists) {
      //   Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      //   if (data['role'] == 'Therapist') {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const TherapistPage()));
      //   } else if (data['role'] == 'Student') {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const BottomNavBar()));
      //   }
      // } else {
      //   return;
      // }
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something went wrong")));
    } catch (e) {
      print(e.toString());
    }
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/main.dart';
import 'package:mental_health_app/pages/chat_screen.dart';
import 'package:mental_health_app/pages/login_page.dart';
import 'package:mental_health_app/pages/welcome_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPasswordVisible = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            const Image(
              image: AssetImage("assets/conversation-7559233_1280.jpg"),
              fit: BoxFit.contain,
              //height: double.infinity,
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
              mainAxisAlignment: MainAxisAlignment.end,
              direction: Axis.vertical,
              children: [Align(
                alignment: Alignment.center,
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              validator: (email) =>
                                  email != null && !EmailValidator.validate(email)
                                      ? 'Enter a valid email'
                                      : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: isPasswordVisible,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              validator: (value) =>
                                  value != null && value.length < 8
                                      ? "Enter at least 8 characters"
                                      : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                                controller: confirmpassController,
                                obscureText: isPasswordVisible,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Confirm Password",
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  final password = passwordController.text;
                                  final confirmPassword =
                                      confirmpassController.text;
                                  if (confirmPassword != password) {
                                    return "Password does not match";
                                  }
                                  return null;
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage()));
                              },
                              child: const Text("Already have an account? Login",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple),
                                  onPressed: () {
                                    signUp();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text("Register"),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
          ],)
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomePage()));
    try {
      await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email already exists")));
    } catch (e) {
      print(e.toString());
    }
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
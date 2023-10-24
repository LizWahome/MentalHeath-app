import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/main.dart';
import 'package:mental_health_app/models/user_model.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
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
    nameController.dispose();
    roleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey.withOpacity(0.5),
              Colors.white.withOpacity(0.1),
              Colors.blue
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Image(
                      image: AssetImage("assets/conversation-7559233_1280-removebg-preview.png"),
                      fit: BoxFit.contain,
                      //height: double.infinity,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Name"),
                        // validator: (email) =>
                        //     email != null && !EmailValidator.validate(email)
                        //         ? 'Enter a valid email'
                        //         : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: roleController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Role"),
                        // validator: (email) =>
                        //     email != null && !EmailValidator.validate(email)
                        //         ? 'Enter a valid email'
                        //         : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: isPasswordVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        validator: (value) => value != null && value.length < 8
                            ? "Enter at least 8 characters"
                            : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            final confirmPassword = confirmpassController.text;
                            if (confirmPassword != password) {
                              return "Password does not match";
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
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
                              signUp().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WelcomePage()));
                              });
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
      ),
    );
  }

  Future<void> signUp() async {
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
      //create user
      await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      //Add user details
      signUpData(nameController.text.trim(), roleController.text.trim(),
          emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email already exists")));
    } catch (e) {
      print(e.toString());
    }
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future signUpData(String name, String role, String email) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user =
        UserModel(id: docUser.id, email: email, name: name, role: role);
    final json = user.toJson();
    await docUser.set(json).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Success\nYour account has successfully been created",
        ),
        backgroundColor: Colors.green,
      ));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomePage()));
    });
  }
}

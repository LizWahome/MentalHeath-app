import 'package:flutter/material.dart';

class TherapistPage extends StatefulWidget {
  const TherapistPage({super.key});

  @override
  State<TherapistPage> createState() => _TherapistPageState();
}

class _TherapistPageState extends State<TherapistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Therapist Page"),
      ),
    );
  }
}


// Future<void> signIn(String email, String password) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     User user = userCredential.user;
//     DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//     String role = snapshot.data()['role'];
//     if (role == 'admin') {
//       // Navigate to admin page
//     } else if (role == 'user') {
//       // Navigate to user page
//     } else {
//       // Navigate to default page
//     }
//   } catch (e) {
//     print(e);
//   }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   static void signInUser(
//       BuildContext context, String email, String password) async {
//     try {
//       AuthResult authResult = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       FirebaseUser signedInUser = authResult.user;
//       if (signedInUser != null) {
//         DocumentSnapshot userDocSnapshot = await _firestore
//             .collection('/users')
//             .document(signedInUser.uid)
//             .get();
//         if (userDocSnapshot.exists) {
//           Map<String, dynamic> data = userDocSnapshot.data;
//           if (data['role'] == 'admin') {
//             // Navigate to admin screen
//           } else if (data['role'] == 'user') {
//             // Navigate to user screen
//           }
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }


// }

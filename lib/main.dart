import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/firebase_options.dart';
import 'package:mental_health_app/pages/splash.dart';
import 'package:mental_health_app/pages/student/bottom_nav_bar.dart';
import 'package:mental_health_app/pages/student/student_detail.dart';
import 'package:mental_health_app/pages/therapist/therapist_page.dart';
import 'package:mental_health_app/theme/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        //themeMode: themeProvider.themeMode,
        // theme: MyThemes().lightMode,
        // darkTheme: MyThemes().darkMode,
        home: SpashPage(),
      );
    } );
  }
}

//password17
  // Stream<List<UserModel>> readUsers() => FirebaseFirestore.instance
  //     .collection('users')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());
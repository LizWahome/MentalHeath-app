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
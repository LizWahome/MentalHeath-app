import 'package:flutter/material.dart';

class ProfileWidgetRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const ProfileWidgetRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey.shade700,
        ),
        SizedBox(
          width: screenSize.width * 0.3,
        ),
        Text(text)
      ],
    );
  }
}

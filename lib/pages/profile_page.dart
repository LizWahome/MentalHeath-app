import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/login_page.dart';
import 'package:mental_health_app/theme/theme.dart';
import 'package:mental_health_app/widgets/profile_row_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey.withOpacity(0.5),
              Colors.white.withOpacity(0.1),
              Colors.blue
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenSize.height * 0.35,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/sad-2042536_1280.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'User Information',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          //fontFamily: 'LilitaOne',
                          letterSpacing: 1.2),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Divider(
                      thickness: 1.2,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ProfileWidgetRow(icon: Icons.email, text: "Email"),
                    const SizedBox(
                      height: 25,
                    ),
                    ProfileWidgetRow(icon: Icons.phone, text: "Phone number"),
                    const SizedBox(
                      height: 25,
                    ),
                    ProfileWidgetRow(icon: Icons.location_city_rounded, text: "Address"),
                    const SizedBox(
                      height: 25,
                    ),
                    ProfileWidgetRow(icon: Icons.date_range_rounded, text: "Date joined"),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'User Settings',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          //fontFamily: 'LilitaOne',
                          letterSpacing: 1.2),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Divider(
                      thickness: 1.2,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.dark_mode_rounded,
                          color: Colors.grey.shade700,
                        ),
                        // SizedBox(
                        //   width: screenSize.width * 0.3,
                        // ),
                        const Text("Theme"),
                        Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            })
                        // Switch.adaptive(
                        //     value: themeProvider.isDarkMode,
                        //     onChanged: (value) {
                        //       final provider = Provider.of<ThemeProvider>(context,
                        //           listen: false);
                        //       provider.toggleTheme(value);
                        //     })
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            FirebaseAuth.instance.signOut().then((value) =>
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage())));
                          },
                          child: Icon(
                            Icons.logout_rounded,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.3,
                        ),
                        const Text("Logout")
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

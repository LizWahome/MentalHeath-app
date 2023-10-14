import 'package:flutter/material.dart';
import 'package:mental_health_app/widgets/health_needs.dart';
import 'package:mental_health_app/widgets/nearby_doctor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      minimum: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello Jane,",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'LilitaOne')),
                    SizedBox(
                      height: 5,
                    ),
                    Text("How are you doing today?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Shirkhand'))
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    "assets/toddler-8297939_1280.jpg",
                    width: 50,
                    //height: 50,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: screenSize.height * 0.2,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        blurStyle: BlurStyle.normal,
                        color: Colors.black38,
                        offset: Offset(0, 9))
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.blue.shade900),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20.0, right: screenSize.width * 0.2, left: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenSize.width * 0.15,
                      height: screenSize.width * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber,
                          image: const DecorationImage(
                              image:
                                  AssetImage("assets/plant-8203430_1280.png"),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Dr.Ruben Dorwat",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Therapist",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue.withOpacity(0.2)),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Today",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text("14:30 - 16:30PM")
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Health Needs",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'LilitaOne', letterSpacing: 1.2),
            ),
            const SizedBox(
              height: 30,
            ),
            const HealthNeeds(),
            const SizedBox(
              height: 30,
            ),
            const Text("Nearby Doctor",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'LilitaOne', letterSpacing: 1.2)),
            const SizedBox(
              height: 30,
            ),
            NearbyDoctors()
          ],
        ),
      ),
    );
  }
}

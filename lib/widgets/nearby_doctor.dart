import 'package:flutter/material.dart';
import 'package:mental_health_app/models/doctor_model.dart';
import 'package:mental_health_app/widgets/doctor_info.dart';

class NearbyDoctors extends StatefulWidget {
  const NearbyDoctors({super.key});

  @override
  State<NearbyDoctors> createState() => _NearbyDoctorsState();
}

class _NearbyDoctorsState extends State<NearbyDoctors> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: List.generate(nearbyDoctors.length, (index) {
        final doctor = nearbyDoctors[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DoctoInfoWidget(doctor: doctor)));
                },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenSize.width * 0.25,
                  height: screenSize.width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                      image: DecorationImage(
                          image: AssetImage(nearbyDoctors[index].profile),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: screenSize.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nearbyDoctors[index].name,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      nearbyDoctors[index].position,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade700,
                        ),
                        Text(
                          nearbyDoctors[index].averageReview.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "(${nearbyDoctors[index].totalReview} reviews)",
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

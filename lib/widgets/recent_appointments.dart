import 'package:flutter/material.dart';
import 'package:mental_health_app/models/doctor_model.dart';
import 'package:mental_health_app/models/recent_appointments.dart';

class RecentAppointments extends StatefulWidget {
  const RecentAppointments({super.key});

  @override
  State<RecentAppointments> createState() => _RecentAppointmentsState();
}

class _RecentAppointmentsState extends State<RecentAppointments> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: List.generate(studentModel.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
                        image: AssetImage(studentModel[index].profile),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: screenSize.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    studentModel[index].name,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    studentModel[index].position,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                      ),
                      Text(
                        studentModel[index].averageReview.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "(${studentModel[index].totalReview} reviews)",
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

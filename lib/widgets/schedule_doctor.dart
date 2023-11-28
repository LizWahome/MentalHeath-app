import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScheduleDoctor extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final String day;
  final String date;
  final Widget? row;
  const ScheduleDoctor(
      {super.key,
      required this.image,
      required this.name,
      required this.title,
      required this.day,
      required this.date,
      this.row});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.23,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 4,
                blurStyle: BlurStyle.normal,
                color: Colors.black38,
                offset: Offset(0, 9))
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          color: Colors.blue.shade900),
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.0, right: screenSize.width * 0.2, left: 30),
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
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          day,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(date)
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 10,),
                row ?? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text(
                                        "Are you sure you want to cancel this appointment?"),
                                    content: LottieBuilder.asset(
                                      "assets/Animation - 1701158440431.json",
                                      width: 100,
                                      height: 100,
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Yes")),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("No"))
                                    ],
                                  ));
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.red.shade700,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text(
                                        "Your appointment has successfully been added."),
                                    content: LottieBuilder.asset(
                                      "assets/Animation - 1701159535048.json",
                                      width: 100,
                                      height: 100,
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("OK")),
                                    ],
                                  ));
                        },
                        child: Icon(
                          Icons.check,
                          color: Colors.greenAccent,
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

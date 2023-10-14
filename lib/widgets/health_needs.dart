import 'package:flutter/material.dart';
import 'package:mental_health_app/models/icon_model.dart';

class HealthNeeds extends StatefulWidget {
  const HealthNeeds({
    super.key,
  });

  @override
  State<HealthNeeds> createState() => _HealthNeedsState();
}

class _HealthNeedsState extends State<HealthNeeds> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // List<IconModel> icons = [
    //   IconModel(name: "Appointment", iconData: Icon(Icons.calendar_month)),
    //   IconModel(name: "Hospital", iconData: Icon(Icons.local_hospital_outlined)),
    //   IconModel(name: "More", iconData: Icon(Icons.more_horiz))
    // ];
    List<IconButton> icons = [
      IconButton(
        onPressed: () {
          iconOne(context);
        },
        icon: Icon(
          Icons.calendar_month_rounded,
          size: screenSize.height * 0.05,
          color: Colors.blue.shade800,
        ),
        hoverColor: Colors.amber,
        splashColor: Colors.blue.shade100,
      ),
      IconButton(
          onPressed: () {
            iconOne(context);
          },
          icon: Icon(Icons.local_hospital_outlined,
              color: Colors.blue.shade800, size: screenSize.height * 0.05),
          hoverColor: Colors.blueGrey,
          splashColor: Colors.blue.shade100),
      IconButton(
          onPressed: () {
            iconOne(context);
          },
          icon: Icon(
            Icons.more_horiz,
            color: Colors.blue.shade800,
            size: screenSize.height * 0.05,
          ),
          hoverColor: Colors.blueGrey,
          splashColor: Colors.blue.shade100),
    ];
    List names = ["Appointment", "Hospital", "More"];

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icons[index],
              const SizedBox(
                height: 15,
              ),
              Text(
                names[index],
                style: TextStyle(color: Colors.grey.shade700),
              )
            ],
          );
        }));
  }

  Future iconOne(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        barrierColor: Colors.black.withOpacity(0.5),
        showDragHandle: true,
        builder: (context) {
          return Container(
            height: 400,
          );
        });
  }
}

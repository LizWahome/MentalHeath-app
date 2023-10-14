import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    //TabController tabController = TabController(length: 3, vsync: this);
    return  Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            const Text("Schedule",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'LilitaOne')),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.grey,
            ),
            
            child: DefaultTabController(
              length: 3, 
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(17)
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: "Upcoming",),
                  Tab(text: "Complete",),
                  Tab(text: "Result",)
                ]
                )
              ),
          ),
          // Expanded(child: TabBarView(children: [
          //   Center(child: Text("Upcoming"),),
          //   Center(child: Text("Complete"),),
          //   Center(child: Text("Result"),),
          // ]))
          ],
        ),
      ),
    );
  }
}

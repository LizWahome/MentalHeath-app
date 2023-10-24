import 'package:flutter/material.dart';
import 'package:mental_health_app/widgets/tab_pages/completed.dart';
import 'package:mental_health_app/widgets/tab_pages/upcomming.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey.withOpacity(0.5),
              Colors.white.withOpacity(0.1),
              Colors.blue
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        child: DefaultTabController(
            length: 3,
            child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                        title: Text("Schedule",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'LilitaOne')),
                        bottom: TabBar(
                            indicator: BoxDecoration(
                                color: Colors.blue.shade700,
                                borderRadius: BorderRadius.circular(12)),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            tabs: const [
                              Tab(
                                text: "Upcoming",
                              ),
                              Tab(
                                text: "Complete",
                              ),
                              Tab(
                                text: "Result",
                              )
                            ]))
                  ];
                },
                body: const TabBarView(
                  children: [
                    UpcomingPage(),
                   CompletedPage(),
                    Center(
                      child: Text("Result"),
                    ),
                  ],
                ))),
      ),
    );
    // Scaffold(
    //   body: SafeArea(
    //     minimum: const EdgeInsets.only(top: 50, left: 20, right: 20),
    //     child: Column(
    //       children: [
    //         const Text("Schedule",
    //             style: TextStyle(
    //                 fontSize: 24,
    //                 fontWeight: FontWeight.w400,
    //                 fontFamily: 'LilitaOne')),
    //       Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(17),
    //           color: Colors.grey,
    //         ),

    //         child: DefaultTabController(
    //           length: 3,
    //           child: TabBar(
    //             indicator: BoxDecoration(
    //               color: Colors.blue,
    //               borderRadius: BorderRadius.circular(17)
    //             ),
    //             labelColor: Colors.white,
    //             unselectedLabelColor: Colors.black,
    //             tabs: const [
    //               Tab(text: "Upcoming",),
    //               Tab(text: "Complete",),
    //               Tab(text: "Result",)
    //             ]
    //             )
    //           ),
    //       ),
    //       // Expanded(child: TabBarView(children: [
    //       //   Center(child: Text("Upcoming"),),
    //       //   Center(child: Text("Complete"),),
    //       //   Center(child: Text("Result"),),
    //       // ]))
    //       ],
    //     ),
    //   ),
    // );
  }
}

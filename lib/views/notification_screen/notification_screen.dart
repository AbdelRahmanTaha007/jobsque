import 'package:flutter/material.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  static const route = "notificationScreen";
  bool isThrerNotifications = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notification",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBarScreen(),
                    ));
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: (isThrerNotifications == true)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      width: 450,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(229, 231, 235, 1)),
                      child: Text(
                        "New",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 400,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide())),
                            margin: EdgeInsets.only(bottom: 10),
                            height: 90,
                            width: 400,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/Twitter Logo.png"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dana",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text("Posted new design jobs"),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Color.fromRGBO(219, 180, 14, 1),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("10:00AM")
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      width: 450,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(229, 231, 235, 1)),
                      child: Text(
                        "Yesterday",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 400,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide())),
                            margin: EdgeInsets.only(bottom: 10),
                            height: 90,
                            width: 400,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      // decoration: BoxDecoration(
                                      //     borderRadius:
                                      //         BorderRadius.circular(35),
                                      //     color:
                                      //         Color.fromRGBO(214, 228, 255, 1)),
                                      padding: EdgeInsets.all(8),
                                      child: CircleAvatar(
                                          child: Image.asset(
                                              "assets/images/sms.png")),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dana",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text("Posted new design jobs"),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Color.fromRGBO(219, 180, 14, 1),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("10:00AM")
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Notification Ilustration.png"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "No New notifications yet",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You will receive a notification if there is\n something on your account",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ));
  }
}

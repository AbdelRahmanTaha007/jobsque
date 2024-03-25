import 'package:flutter/material.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';

class MessagesMenuScreen extends StatefulWidget {
  MessagesMenuScreen({super.key});
  static const route = "messagesMenuScreen";

  @override
  State<MessagesMenuScreen> createState() => _MessagesMenuScreenState();
}

class _MessagesMenuScreenState extends State<MessagesMenuScreen> {
  bool unReadSelected = false;
  bool noMessages = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages",
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
      body: Container(
        // margin: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Search messages ...",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  height: 300,
                                  width: 400,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Message filters",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            unReadSelected = !unReadSelected;
                                          });
                                        },
                                        child: Container(
                                            height: 50,
                                            width: 350,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: unReadSelected
                                                  ? Color(0xFF3366FF)
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Unread",
                                                    style: TextStyle(
                                                        color:
                                                            (unReadSelected ==
                                                                    true)
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ),
                                                  Icon(Icons
                                                      .keyboard_arrow_right_outlined),
                                                ],
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 350,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Spam"),
                                            Icon(Icons
                                                .keyboard_arrow_right_outlined),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 350,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Archived"),
                                            Icon(Icons
                                                .keyboard_arrow_right_outlined),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Image.asset("assets/images/setting-4.png")),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              (unReadSelected == true)
                  ? Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            alignment: Alignment.centerLeft,
                            width: 450,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(229, 231, 235, 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Unread",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Read all messages",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF3366FF)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            width: 400,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 90,
                                  width: 400,
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                                child: Image.asset(
                                                    "assets/images/Twitter Logo (1).png")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Twitter",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "Here is the link: http://zoom.com/",
                                                    style: TextStyle(
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Container(
                                              child: Text(
                                                "12:39",
                                                style: TextStyle(
                                                    color: Color(0xFF3366FF),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : (noMessages == true)
                      ? Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 80,
                                ),
                                Image.asset(
                                    "assets/images/Data Ilustration(1).png"),
                                SizedBox(height: 10),
                                Text(
                                  "You have not recieved any messages",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "Once your application has reached the interview\n stage, you will get a message from the recruiter."),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          height: 800,
                          width: 400,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 90,
                                width: 400,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                              child: Image.asset(
                                                  "assets/images/Twitter Logo (1).png")),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Twitter",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  "Here is the link: http://zoom.com/",
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Container(
                                            child: Text(
                                              "12:39",
                                              style: TextStyle(
                                                  color: Color(0xFF3366FF),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

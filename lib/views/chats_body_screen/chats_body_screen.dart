import 'package:flutter/material.dart';

class ChatsBodyScreen extends StatelessWidget {
  const ChatsBodyScreen({super.key});
  static const route = "chatsBodyScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: [
            Image.asset("assets/images/Twitter Logo (1).png"),
            SizedBox(
              width: 15,
            ),
            Text(
              "Twitter",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 700,
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/briefcase.png"),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Visit job post",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_right_outlined),
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
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/note.png"),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "View my application",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_right_outlined),
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
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/sms (1).png"),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Mark as unread",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_right_outlined),
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
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/notification.png"),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Mute",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_right_outlined),
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
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/import.png"),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Archive",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_right_outlined),
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
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/trash.png"),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Delete conversation",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_right_outlined),
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
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset("assets/images/more.png"),
            ),
          )
        ],
      ),
      body: Container(
          color: Color(0xFFFAFAFA),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Today, Nov 13",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        //Left
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFE5E7EB),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            padding: EdgeInsets.all(10),
                            width: 300,
                            height: 130,
                            child: Column(
                              children: [
                                Text(
                                    "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage."),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "10:18",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        //Right
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF3366FF),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            padding: EdgeInsets.all(10),
                            width: 300,
                            height: 100,
                            child: Column(
                              children: [
                                Text(
                                    "Hi Melan, thank you for considering me, this is good news for me.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "10:18",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        //Left
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFE5E7EB),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            padding: EdgeInsets.all(10),
                            width: 300,
                            height: 90,
                            child: Column(
                              children: [
                                Text(
                                    "Can we have an interview via google meet call today at 3pm?",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "10:18",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        //Right
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                // color: Color(0xFFE5E7EB),
                                color: Color(0xFF3366FF),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            padding: EdgeInsets.all(10),
                            width: 150,
                            height: 68,
                            child: Column(
                              children: [
                                Text(
                                  "Of course, I can!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "10:18",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        //Left
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFE5E7EB),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            padding: EdgeInsets.all(10),
                            width: 300,
                            height: 130,
                            child: Column(
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text:
                                          "Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you!"),
                                  TextSpan(
                                      text:
                                          "\nhttps://meet.google.com/dis-sxdu-ave",
                                      style:
                                          TextStyle(color: Color(0xFF3366FF))),
                                ])),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "10:18",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 90,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  height: 70,
                  width: 400,
                  color: Colors.white,
                  child: Center(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Image.asset("assets/images/paperclip.png"),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color(0xFFE5E7EB),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Write a message ...",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Color(0xFFE5E7EB),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Image.asset("assets/images/Microphone.png"),
                          )
                        ]),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

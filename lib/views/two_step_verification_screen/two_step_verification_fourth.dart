import 'package:flutter/material.dart';
import 'package:jobsque/views/login_settings/login_settings.dart';
import 'package:jobsque/views/profile_screen/profile_screen.dart';

class TwoStepVerificationFourth extends StatefulWidget {
  const TwoStepVerificationFourth({super.key});
  static const route = "TwoStepVerificationFourth";
  @override
  State<TwoStepVerificationFourth> createState() =>
      _TwoStepVerificationFourthState();
}

class _TwoStepVerificationFourthState extends State<TwoStepVerificationFourth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Two-step verification",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Enter the 6 digits code",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Please confirm your account by entering the\n authorization code sen to ****-****-7234",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 13, right: 0, top: 20, bottom: 0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: TextField(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  )),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 13, right: 0, top: 20, bottom: 0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: TextField(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  )),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 13, right: 0, top: 20, bottom: 0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: TextField(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  )),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 13, right: 0, top: 20, bottom: 0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: TextField(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  )),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 13, right: 0, top: 20, bottom: 0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: TextField(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  )),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 13, right: 0, top: 20, bottom: 0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: TextField(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  "Resend code ",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "42s",
                  style: TextStyle(color: Color(0xFF3366FF), fontSize: 16),
                )
              ],
            ),
            SizedBox(height: 460),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginSettings(),
                      ));
                },
                child: Text("Verify"))
          ],
        ),
      ),
    );
  }
}

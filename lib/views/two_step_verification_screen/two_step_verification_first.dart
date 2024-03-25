import 'package:flutter/material.dart';
import 'package:jobsque/views/home_screen/home_screen.dart';
import 'package:jobsque/views/two_step_verification_screen/two_step_verification_second.dart';

class TwoStepVerificationFirst extends StatefulWidget {
  const TwoStepVerificationFirst({super.key});
  static const route = "TwoStepVerificationFirst";
  @override
  State<TwoStepVerificationFirst> createState() =>
      _TwoStepVerificationFirstState();
}

class _TwoStepVerificationFirstState extends State<TwoStepVerificationFirst> {
  bool twoStepVerification = false;
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
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Secure your account with \ntwo-step verification",
                    style: TextStyle(fontSize: 17),
                  ),
                  Switch(
                      inactiveThumbColor: Colors.grey,
                      activeColor: Color(0xFF3366FF),
                      value: twoStepVerification,
                      onChanged: (value) {
                        setState(() {
                          twoStepVerification = !twoStepVerification;
                        });
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromRGBO(214, 228, 255, 1),
                  ),
                  child: Image.asset("assets/images/lock.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                    "Two-step verification provides additional\n security by asking for a verification code\n every time you log in on another device."),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromRGBO(214, 228, 255, 1),
                  ),
                  child: Image.asset("assets/images/external-drive.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                    "Two-step verification provides additional\n security by asking for a verification code\n every time you log in on another device."),
              ],
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TwoStepVerificationSecond(),
                      ));
                },
                child: Text("Next")),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}

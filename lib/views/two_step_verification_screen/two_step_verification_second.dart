import 'package:flutter/material.dart';
import 'package:jobsque/views/two_step_verification_screen/two_step_verification_third.dart';

class TwoStepVerificationSecond extends StatefulWidget {
  const TwoStepVerificationSecond({super.key});
  static const route = "TwoStepVerificationSecond";
  @override
  State<TwoStepVerificationSecond> createState() =>
      _TwoStepVerificationSecondState();
}

class _TwoStepVerificationSecondState extends State<TwoStepVerificationSecond> {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                "Select a verification method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
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
                      "Telephone number (SMS)",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application."),
              SizedBox(
                height: 360,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TwoStepVerificationThird(),
                        ));
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}

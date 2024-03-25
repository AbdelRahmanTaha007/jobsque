import 'package:flutter/material.dart';
import 'package:jobsque/views/change_password_screen/change_password_screen.dart';
import 'package:jobsque/views/email_address_change/email_address_change.dart';
import 'package:jobsque/views/phone_number_change/phone_number_change.dart';
import 'package:jobsque/views/two_step_verification_screen/two_step_verification_first.dart';

class LoginSettings extends StatelessWidget {
  const LoginSettings({super.key});
  static const route = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login and Security"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            width: 450,
            height: 40,
            decoration: BoxDecoration(color: Color.fromRGBO(229, 231, 235, 1)),
            child: Text(
              "Account access",
              style: TextStyle(fontSize: 16),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmailChangeScreen(),
                  ));
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email address",
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text(
                        "Taha@gmail.com",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward_rounded)
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhoneNumberChangeScreen(),
                  ));
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone number",
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(Icons.arrow_forward_rounded)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(),
                  ));
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(Icons.arrow_forward_rounded)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TwoStepVerificationFirst(),
                  ));
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Two-step verification",
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text(
                        "non active",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward_rounded)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            margin: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Face ID",
                  style: TextStyle(fontSize: 18),
                ),
                Icon(Icons.arrow_forward_rounded)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

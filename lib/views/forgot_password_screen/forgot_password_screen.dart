import 'package:flutter/material.dart';
import 'package:jobsque/views/check_email_screen/check_email_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  static const route = "forgotPasswordScreen";
  @override
  final emailController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/images/splash_logo.png",
              width: 100,
              height: 50,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset Password",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter your Email...",
                prefixIcon: Icon(Icons.email),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 320,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckEmailScreen(),
                      ));
                },
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "You remember your password  ",
                      style: TextStyle(fontSize: 16)),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(color: Color(0xFF3366FF), fontSize: 17))
                ])),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {}, child: Text("Request password reset"))
          ],
        ),
      ),
    );
  }
}

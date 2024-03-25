import 'package:flutter/material.dart';
import 'package:jobsque/views/reset_password_page/reset_password_screen.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});
  static const route = "CheckEmailScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 950,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/Email Ilustration.png"),
            Text(
              "Check Your Email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "We have sent a reset password to your email\n address",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 230,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPassowrdScreen(),
                          ));
                    },
                    child: Text("Open email app")))
          ],
        )),
      ),
    );
  }
}

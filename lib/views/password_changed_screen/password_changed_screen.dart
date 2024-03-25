import 'package:flutter/material.dart';
import 'package:jobsque/views/login_screen/login_screen.dart';


class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});
  static const route = "PasswordChangedScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 950,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/Password Succesfully Ilustration.png"),
            SizedBox(
              height: 5,
            ),
            Text(
              "Password Changed\n       Succesfully",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Your password has been changed successfully, we will let you know if there are more problems with your account",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 230,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text("Open email app")))
          ],
        )),
      ),
    );
  }
}

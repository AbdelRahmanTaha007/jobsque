import 'package:flutter/material.dart';
import 'package:jobsque/views/login_screen/login_screen.dart';

class AccountDoneScreen extends StatelessWidget {
  const AccountDoneScreen({super.key});
  static const route = "AccountDoneScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 950,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/Success Account Ilustration.png"),
            Text(
              "Your account has been set up!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "We have customized feeds according to your preferences",
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text("Get Started")))
          ],
        )),
      ),
    );
  }
}

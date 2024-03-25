import 'package:flutter/material.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';
import 'package:jobsque/views/home_screen/home_screen.dart';

class ApplyJobScreenSuccess extends StatelessWidget {
  const ApplyJobScreenSuccess({super.key});
  static const route = "applyJobSuccess";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apply Job",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/Data Ilustration.png"),
            Text(
              "Your data has been\nsuccessfully sent",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
                "You will get a message from our team, about\n the announcement of employee acceptance"),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBarScreen(),
                      ));
                },
                child: Text("Back to home"))
          ],
        ),
      ),
    );
  }
}

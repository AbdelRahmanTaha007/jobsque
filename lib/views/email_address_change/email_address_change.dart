import 'package:flutter/material.dart';

class EmailChangeScreen extends StatelessWidget {
  const EmailChangeScreen({super.key});
  static const route = "EmailChangeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Email address",
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
              height: 15,
            ),
            Text(
              "Main E-mail address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline_rounded),
                  hintText: "Email...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            // SizedBox(
            //   height: 570,
            // ),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text("Save")),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}

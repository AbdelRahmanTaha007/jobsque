import 'package:flutter/material.dart';
import 'package:jobsque/views/home_screen/home_screen.dart';
import 'package:jobsque/views/two_step_verification_screen/two_step_verification_fourth.dart';

class TwoStepVerificationThird extends StatefulWidget {
  const TwoStepVerificationThird({super.key});
  static const route = "TwoStepVerificationThird";
  @override
  State<TwoStepVerificationThird> createState() =>
      _TwoStepVerificationThirdState();
}

class _TwoStepVerificationThirdState extends State<TwoStepVerificationThird> {
  bool visiblePassword = false;
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
                height: 15,
              ),
              Text(
                "Main Phone number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefix: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset("assets/images/England.png"),
                    ),
                    hintText: "Phone number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Use the phone number to reset your\n password"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: (visiblePassword == true) ? false : true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        visiblePassword = !visiblePassword;
                        setState(() {});
                      },
                      child: (visiblePassword == true)
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                    hintText: "Enter your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 430,
              ),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TwoStepVerificationFourth(),));
              }, child: Text("Send code"))
            ],
          ),
        ),
      ),
    );
  }
}

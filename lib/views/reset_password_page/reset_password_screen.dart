import 'package:flutter/material.dart';
import 'package:jobsque/views/password_changed_screen/password_changed_screen.dart';

class ResetPassowrdScreen extends StatefulWidget {
  const ResetPassowrdScreen({super.key});
  static const route = "resetPasswordScreen";
  @override
  State<ResetPassowrdScreen> createState() => _ResetPassowrdScreenState();
}

class _ResetPassowrdScreenState extends State<ResetPassowrdScreen> {
  bool visible = true;
  GlobalKey<FormState> formState = GlobalKey();
  final passwordController = TextEditingController();
  final reEnterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Container(
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
                "Set your new password so you can login and acces Jobsque",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    obscureText: (visible == true) ? false : true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline_sharp,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            visible = !visible;
                            setState(() {});
                          },
                          child: (visible == true)
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        hintText: "Password",
                        // focusColor: Color(0xFF3366FF),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusColor: Colors.red),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else if (value.isNotEmpty) {
                        InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Password must be at least 8 characters"),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: (visible == true) ? false : true,
                    controller: reEnterPasswordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline_sharp,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            visible = !visible;
                            setState(() {});
                          },
                          child: (visible == true)
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        hintText: "Password",
                        // focusColor: Color(0xFF3366FF),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusColor: Colors.red),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else if (value.isNotEmpty) {
                        InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Both password must match"),
                ],
              )),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>PasswordChangedScreen() ,));
                  }, child: Text("Request password reset"))
            ],
          ),
        ),
      ),
    );
  }
}

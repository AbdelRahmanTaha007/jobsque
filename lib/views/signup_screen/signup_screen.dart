import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/signup_cubit/signup_cubit.dart';
import 'package:jobsque/views/login_screen/login_screen.dart';
import 'package:jobsque/views/signup_interests_screen/signup_interests_screen.dart';
import 'package:jobsque/views/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});
  static const route = "signupScreen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formState = GlobalKey();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  var visible = true;

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
              SizedBox(
                height: 0,
              ),
              Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Please create an account to find your dream job."),
              SizedBox(
                height: 30,
              ),
              BlocConsumer<SignupCubit, SignupState>(builder: (context, state) {
                print(state);
                return Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline_outlined,
                            ),
                            hintText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name is required";
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                            ),
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Password must be atleast 8 characters",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Color(0xFF3366FF),
                                  fontWeight: FontWeight.w500),
                            ),
                          ])),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF3366FF)),
                            ),
                            onPressed: () async {
                              if (formState.currentState!.validate()) {
                                print("Valid");
                              } else {
                                print("Not valid");
                              }
                              final name = nameController.text;
                              final email = emailController.text;
                              final password = passwordController.text;
                              SignupCubit.get(context)
                                  .signUp(name, email, password);
                              print(state);
                              if (state is SuccessSignupState) {
                                print(state);
                              }
                            },
                            child: Text(
                              "Create an account",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Or signup with',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/googleicon.png",
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Google")
                                ],
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/facebookicon.png",
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Facebook")
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              }, listener: (context, state) async {
                if (state is SuccessSignupState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupInterestsScreen(),
                    ),
                  );
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final token = await prefs.getString('accessToken');
                  print(token);
                } else if (state is FailedSignupState) {
                  print("Login failed with status code");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}







/**
 * Form(
                key: formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline_outlined,
                          ),
                          hintText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                          ),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Password must be atleast 8 characters",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SplashScreen(),
                              ));
                        },
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                                color: Color(0xFF3366FF),
                                fontWeight: FontWeight.w500),
                          ),
                        ])),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFF3366FF)),
                          ),
                          // backgroundColor: if (passwordController.text.isEmpty){
                          //     MaterialStatePropertyAll(Colors.grey)
                          // }
                          // else{
                          //   MaterialStatePropertyAll(Color(0xFF3366FF)))
                          //         setState(() {});
                          // }),
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              print("Valid");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SignupInterestsScreen(),
                                  ));
                            } else {
                              print("Not valid");
                            }
                          },
                          child: Text(
                            "Create an account",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or signup with',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/googleicon.png",
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Google")
                              ],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/facebookicon.png",
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Facebook")
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
 */
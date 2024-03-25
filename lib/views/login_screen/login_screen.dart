import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsque/controllers/LoginCubit/login_cubit_cubit.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';
import 'package:jobsque/views/forgot_password_screen/forgot_password_screen.dart';
import 'package:jobsque/views/home_screen/home_screen.dart';
import 'package:jobsque/views/signup_interests_screen/signup_interests_screen.dart';
import 'package:jobsque/views/signup_screen/signup_screen.dart';
import 'package:jobsque/views/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const route = "loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formState = GlobalKey();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool visible = true;
  bool rememberMe = false;

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
                height: 30,
              ),
              Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Please Login to find your dream job."),
              SizedBox(
                height: 40,
              ),
              Form(
                key: formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                  // _saveRememberMeStatus();
                                });
                              },
                            ),
                            Text('Remember Me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ));
                          },
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
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
                                builder: (context) => SignupScreen(),
                              ));
                        },
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "Don't have an account",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'Register',
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
                    BlocConsumer<LoginCubitCubit, LoginCubitState>(
                        listener: (context, state) async {
                      if (state is SuccessLoginState) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBarScreen(),
                          ),
                        );
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        final token = await prefs.getString('accessToken');
                        print(token);
                      }
                    }, builder: (context, state) {
                      print(state);
                      return Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF3366FF)),
                            ),
                            onPressed: () async {
                              final email = emailController.text;
                              final password = passwordController.text;
                              LoginCubitCubit.get(context)
                                  .login(email, password);
                              if (formState.currentState!.validate() &&
                                  state is SuccessLoginState) {
                                print("Valid");
                                print(state);
                                
                              } else {
                                print(state);
                                emailController.text = "";
                                passwordController.text = "";
                                print(state);
                                
                                // Fluttertoast.showToast(
                                //     msg: "Email or password are wrong!",
                                //     toastLength: Toast.LENGTH_SHORT,
                                //     gravity: ToastGravity.TOP,
                                //     timeInSecForIosWeb: 1,
                                //     backgroundColor: Colors.red,
                                //     textColor: Colors.white,
                                //     fontSize: 16.0);
                              }
                            },
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )),
                      );
                    }),
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsque/controllers/update_password_cubit/update_password_cubit.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';
import 'package:jobsque/views/home_screen/home_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  static const route = "ChangePasswordScreen";
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool visibleOldPassword = true;
  bool visibleNewPassword = true;
  bool visibleConfirmNewPassword = true;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Phone number",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Enter your old password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //Old
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: oldPasswordController,
                  obscureText: (visibleOldPassword == true) ? false : true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            visibleOldPassword = !visibleOldPassword;
                          });
                        },
                        child: (visibleOldPassword == true)
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      hintText: "Enter old Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter your New password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                //New
                TextFormField(
                  controller: newPasswordController,
                  obscureText: (visibleNewPassword == true) ? false : true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            visibleNewPassword = !visibleNewPassword;
                          });
                        },
                        child: (visibleNewPassword == true)
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      hintText: "Enter new Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Confirm your new password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                //Confirm
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText:
                      (visibleConfirmNewPassword == true) ? false : true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            visibleConfirmNewPassword =
                                !visibleConfirmNewPassword;
                          });
                        },
                        child: (visibleConfirmNewPassword == true)
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      hintText: "Confirm new Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
          BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
            listener: (context, state) {
              if (state is SuccessUpdatePassword) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBarScreen(),
                    ));
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ElevatedButton(
                    onPressed: () async {
                      if (newPasswordController.text == confirmPasswordController.text) {
                        final password = newPasswordController.text;
                        UpdatePasswordCubit.get(context)
                            .updatePassword(password);
                        newPasswordController.text = "";
                        print("Success");
                      }
                      // Fluttertoast.showToast(
                      //     msg: "passwords doesn't match!",
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.TOP,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0);
                    },
                    child: Text("Save")),
              );
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

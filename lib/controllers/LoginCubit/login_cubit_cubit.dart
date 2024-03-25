
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());

  static LoginCubitCubit get(context) => BlocProvider.of(context);

  void login(String email, String password) async {
    try {
      var response = await DioHelper.dio.post(
        "https://project2.amit-learning.com/api/auth/login",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        emit(SuccessLoginState());
        Fluttertoast.showToast(
            msg: "Logged in successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        dynamic responseBody = response.data;
        dynamic accessToken = responseBody["token"];
        await SharedHelper.prefs.setBool("isLogin", true);
        await SharedHelper.prefs.setString('accessToken', accessToken);
    
      } 
      if (response.statusCode == 401) {
        emit(FailedLoginState());
        Fluttertoast.showToast(
            msg: "Email or password are wrong!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      else {
        emit(FailedLoginState());
        Fluttertoast.showToast(
                                    msg: "Email or password are wrong!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
        print("Login Failed with status code: ${response.statusCode}");
      }
    } catch (error) {
      print(error);
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
import 'package:meta/meta.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());
  static UpdatePasswordCubit get(context) => BlocProvider.of(context);
  void updatePassword( String password) async {
    try {
      var response = await DioHelper.dio.post(
        "https://project2.amit-learning.com/api/auth/user/update",
        data: {"password": password},
      );
      if (response.statusCode == 200) {
        emit(SuccessUpdatePassword());
        Fluttertoast.showToast(
            msg: "Updated successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
            print("update password Succeed ");
            print("##################################### ");
            print("update password Succeed ");
    
      } 
      else {
        emit(FailedUpdatePassword());
        print("update password Failed with status code: ${response.statusCode}");
      }
    } catch (error) {
      print(error);
    }
  }
}

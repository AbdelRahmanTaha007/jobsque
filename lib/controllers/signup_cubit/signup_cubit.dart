import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
  void signUp(String name, String email, String password) async {
    try {
      var response = await DioHelper.dio.post(
        "https://project2.amit-learning.com/api/auth/register",
        data: {"name" : name,"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        dynamic responseBody = response.data;
        dynamic signupAccessToken = responseBody["token"];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessSignupToken', signupAccessToken);
        emit(SuccessSignupState());
      } else if(response.statusCode == 401){
        emit(FailedSignupState());
        // print("Login failed with status code: ${response.statusCode}");
      }
    } catch (error) {
      print(error);
    }
  }
}

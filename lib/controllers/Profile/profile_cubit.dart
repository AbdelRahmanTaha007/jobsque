import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
import 'package:jobsque/models/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

static ProfileCubit get(context) => BlocProvider.of(context);
  
  List<ProfileModel> profile = [];
  

  void getProfile() async {
    emit(LoadingGetProfileState());
    try {
      dynamic token = SharedHelper.prefs.getString('accessToken');
      DioHelper.dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await DioHelper.dio.get(
        "https://project2.amit-learning.com/api/auth/profile",
      );
      if (response.statusCode == 200) {
        print('Response data Profile : ${response.data}');
        print(
            '###########################################################################');
        print('Profile Loaded successfully');
        print(token);
        dynamic responseBody = response.data;

        dynamic responseBodyData = responseBody;
        for (var element in responseBodyData.values) {
      profile.add(ProfileModel.fromJson(element));
    }
        print(profile);
        emit(SuccessGetProfileState());
      } else {
        emit(ErrorGetProfileState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetProfileState());
    }
  }
}


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
import 'package:jobsque/models/saved_jobs_model.dart';
import 'package:meta/meta.dart';

part 'saved_jobs_state.dart';

class SavedJobsCubit extends Cubit<SavedJobsState> {
  SavedJobsCubit() : super(SavedJobsInitial());
  static SavedJobsCubit get(context) => BlocProvider.of(context);

  List<SavedJobsModel> savedJobs = [];

  void getSavedJobs() async {
    emit(LoadingGetSavedJobsState());
    try {
      dynamic token = SharedHelper.prefs.getString('accessToken');
      DioHelper.dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await DioHelper.dio.get(
        "https://project2.amit-learning.com/api/favorites",
      );
      if (response.statusCode == 200) {
        print('Response data Jobs: ${response.data}');
        print(
            '###########################################################################');
        print('SavedJobs fetched successfully');
        print(token);
        print(savedJobs);
        dynamic responseBody = response.data;
        dynamic responseBodyData = responseBody["data"];
        for (var element in responseBodyData) {
          savedJobs.add(SavedJobsModel.fromJson(element));
        }
        emit(SuccessGetSavedJobsState());
      } else if (response.statusCode == 404) {
        print("Error 404 Not Found");
        emit(ErrorGetSavedJobsState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetSavedJobsState());
    }
  }

  /////////////////////////////////
  void addFavourites({required int userId, required int jobId}) async {
    try {
      var response = await DioHelper.dio.post(
        "https://project2.amit-learning.com/api/favorites?user_id=$userId&job_id=$jobId",
        data: {"user_id": userId, "job_id": jobId},
      );
      if (response.statusCode == 200) {
        emit(SuccessSavinJobToFavouritesState());
        Fluttertoast.showToast(
            msg: "Job Saved successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        dynamic responseBody = response.data;
        print(responseBody);
      } else {
        emit(ErrorSavinJobToFavourites());
        print("Saving job Failed with status code: ${response.statusCode}");
      }
    } catch (error) {
      print(error);
    }
  }
}

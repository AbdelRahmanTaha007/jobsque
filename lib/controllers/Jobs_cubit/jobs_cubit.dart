import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
import 'package:jobsque/models/jobs_model.dart';
import 'package:meta/meta.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());
  static JobsCubit get(context) => BlocProvider.of(context);

  List<JobsModel> jobs = [];

  void getJobs() async {
    emit(LoadingGetJobsState());
    try {
      dynamic token = SharedHelper.prefs.getString('accessToken');
      DioHelper.dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await DioHelper.dio.get(
        "https://project2.amit-learning.com/api/jobs",
      );
      if (response.statusCode == 200) {
        dynamic responseBody = response.data;
        dynamic responseBodyData = responseBody["data"];
        for (var element in responseBodyData) {
          
          jobs.add(JobsModel.fromJson(element));
        }
        // print('Response data Jobs: ${response.data}');
        print(
            '###########################################################################');
        print('Jobs fetched successfully');
        print(token);
        // print(jobs);
        emit(SuccessGetJobsState());
      } else {
        emit(ErrorGetJobsState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetJobsState());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
import 'package:jobsque/models/applied_model.dart';
import 'package:meta/meta.dart';

part 'applied_job_state.dart';

class AppliedJobCubit extends Cubit<AppliedJobState> {
  AppliedJobCubit() : super(AppliedJobInitial());

  static AppliedJobCubit get(context) => BlocProvider.of(context);
  List<AppliedJobsModel> appliedJobs = [];

  void getAppliedJobs() async {
    emit(LoadingGetAppliedJobsState());
    try {
      dynamic token = SharedHelper.prefs.getString('accessToken');
      DioHelper.dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await DioHelper.dio.get(
        "https://project2.amit-learning.com/api/apply/2",
      );
      if (response.statusCode == 200) {
        emit(SuccessGetAppliedJobsState());
        dynamic responseBody = response.data;
        dynamic responseBodyData = responseBody["data"];
        for (var element in responseBodyData) {
          appliedJobs.add(AppliedJobsModel.fromJson(element));
        }
        print('Response data AppliedJobs: ${response.data}');
        print(
            '###########################################################################');
        print('AppliedJobs fetched successfully');
        // print(token);
        // print(jobs);
      } else {
        emit(FailedGetAppliedJobsState());
      }
    } catch (e) {
      print(e.toString());
      emit(FailedGetAppliedJobsState());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
import 'package:jobsque/models/search_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  List<SearchModel> searches = [];

  void getSearches() async {
    emit(LoadingGetSearchState());
    try {
      dynamic token = SharedHelper.prefs.getString('accessToken');
      DioHelper.dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await DioHelper.dio.post(
        "https://project2.amit-learning.com/api/jobs/filter",
      );
      if (response.statusCode == 200) {
        print('Response data searches: ${response.data}');
        print(
            '###########################################################################');
        print('Searches fetched successfully');
        print(token);
        print("Thats Searches :${searches}");
        dynamic responseBody = response.data;
        dynamic responseBodyData = responseBody["data"];

        for (var element in responseBodyData) {
          searches.add(SearchModel.fromJson(element));
        }
        emit(SuccessGetSearchState());
      } else if (response.statusCode == 404) {
        print("error fetching the searches");
        emit(ErrorGetSearchState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetSearchState());
    }
  }
}

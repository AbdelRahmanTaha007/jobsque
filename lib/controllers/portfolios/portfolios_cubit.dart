import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
import 'package:jobsque/models/portfolios_model.dart';
import 'package:jobsque/models/portfolios_profile_model.dart';
import 'package:meta/meta.dart';

part 'portfolios_state.dart';

class PortfoliosCubit extends Cubit<PortfoliosState> {
  PortfoliosCubit() : super(PortfoliosInitial());

  static PortfoliosCubit get(context) => BlocProvider.of(context);
  File? _pickedImage;
  List<PortfoliosPortofolioModel> portfoliosPortfolios = [];
  List<PortfoliosProfileModel> portfoliosProfile = [];
  void getPortfolios() async {
    try {
      dynamic token = SharedHelper.prefs.getString('accessToken');
      DioHelper.dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await DioHelper.dio.get(
        "https://project2.amit-learning.com/api/user/profile/portofolios",
      );
      if (response.statusCode == 200) {
        dynamic responseBody = response.data;
        dynamic responseBodyPortfolioData = responseBody["data"]["portofolio"];
        dynamic responseBodyProfileData = responseBody["data"]["profile"];
        print(responseBodyPortfolioData);
        // dynamic profileData = response.data['data']['profile'];
        // portfoliosProfile.add(PortfoliosProfileModel.fromJson(responseBodyProfileData));
        // for (var element in response.data['data']['profile']) {
        //   portfoliosProfile.add(PortfoliosProfileModel.fromJson(element));
        // }
        portfoliosProfile
            .add(PortfoliosProfileModel.fromJson(responseBodyProfileData));
        for (var element in responseBodyPortfolioData) {
          portfoliosPortfolios.add(PortfoliosPortofolioModel.fromJson(element));
        }
        print('Response data Portofolios: ${response.data}');
        print(
            '###########################################################################');
        print('Portfolios fetched successfully');
        print(token);
        emit(SuccessGetPortfoliosState());
      } else {
        emit(FailedGetPortfoliosState());
      }
    } catch (e) {
      print(e.toString());
      emit(FailedGetPortfoliosState());
    }
  }

  void pickImage() async {
    final picker = ImagePicker();
    var pickedImageFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedImageFile != null) {
      String imagePath = pickedImageFile.path;
      _pickedImage = File(imagePath);
      print('Scanned ${pickedImageFile.path} to $_pickedImage');
      print("Image path is :   ###   ${_pickedImage!.absolute.path}");
      print("Image path is :   ###   '${"${_pickedImage!.absolute.path}"}'");
    }
  }

  void uploadPortfolio() async {
    try {
      if (_pickedImage == null) {
        print('No image picked');
        return;
      }
      dynamic token = SharedHelper.prefs.getString('accessToken');
      DioHelper.dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await DioHelper.dio.post(
          "https://project2.amit-learning.com/api/user/profile/portofolios",
          data: {
            "cv_file": null,
            "image": '"${_pickedImage!.absolute.path}"',
          });
      if (response.statusCode == 200) {
        emit(SuccessUploadPortfoliosState());
        Fluttertoast.showToast(
            msg: "Uploaded successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print('Response data portfolios: ${response.data}');
        print(
            '###########################################################################');
        print('portfolio uploaded successfully');
      }
      if (response.statusCode == 500) {
        print("Error");
        emit(FailedUploadPortfoliosState());
      } else {
        print("Failed :( with ${response.statusCode}");
        emit(FailedUploadPortfoliosState());
      }
    } catch (e) {}
  }
}

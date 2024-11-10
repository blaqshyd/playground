
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:playground/core/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadImageService {
  Future<void> uploadImage(File image) async {

    String fileName = image.path.split('/').last;

    FormData formData = FormData.fromMap({
      "drugImage": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
      ),
    });

    String? sessionCookie = await _retrieveSessionCookie();
    if (sessionCookie == null) {
      log("Session cookie is not available.");
      return;
    }
    else{
      log(sessionCookie);
    }

    Dio dio = Dio();
    dio.options.headers = {
      "Cookie": sessionCookie,
      "Content-Type": "multipart/form-data",
      "Connection": "keep-alive"
    };
    try {
      log("Process began");
      Response response = await dio.post("${Env.baseUrl}drug-vetting", data: formData,);
      if (response.statusCode == 200) {
        log("Image uploaded successfully");
        log(response.data);
      } else {
        log("An Error occurred: ${response.statusCode}");
      }
    } catch (e) {
      log("Exception caught: $e");
    }
  }


  Future<String?> _retrieveSessionCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionCookie');
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_rss/http/dio_instance.dart';

class LoginApi {
  static LoginApi instance = LoginApi._();

  LoginApi._();

  Future<Map<String, dynamic>> login({String? username, String? password}) async {
    Response response = await DioInstance.instance().post(path: "app/auth/login", data: {
      "username": username,
      "password": password
    });
    return response.data;
  }
}
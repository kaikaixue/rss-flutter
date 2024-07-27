import 'dart:io';

import 'package:dio/dio.dart';

import '../constants.dart';
import '../utils/sp_utils.dart';

class CookieInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    SpUtils.getStringList(Constants.SP_COOKIE_List).then((cookieList) {
      options.headers[HttpHeaders.cookieHeader] = cookieList;
      String token = SpUtils.getString(Constants.TOKEN).toString();
      print(token);
      options.headers[HttpHeaders.authorizationHeader] = "Bearer" + token;
      handler.next(options);
    });
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.path.contains("user/login")) {
      dynamic list = response.headers[HttpHeaders.setCookieHeader];
      List<String> cookieList = [];
      if (list is List) {
        for (String? cookie in list) {
          cookieList.add(cookie ?? "");
          print("cookieInterceptor cookie= $cookie");
        }
      }
      SpUtils.saveStringList(Constants.SP_COOKIE_List, cookieList);
    }
    super.onResponse(response, handler);
  }
}
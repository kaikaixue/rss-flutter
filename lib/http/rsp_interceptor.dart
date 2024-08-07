import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rss/common_ui/loading.dart';
import 'package:flutter_rss/pages/auth/login_page.dart';
import 'package:flutter_rss/routes/RouteUtils.dart';
import 'package:oktoast/oktoast.dart';

import 'base_model.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response);
    if (response.statusCode == 200) {
      try {
        var rsp = BaseModel.fromJson(response.data);
        if (rsp.code == 200) {
          if (rsp.data == null) {
            handler.next(Response(requestOptions: response.requestOptions, data: true));
          }  else {
            handler.next(Response(requestOptions: response.requestOptions, data: rsp.data));
          }
        } else if (rsp.code == 401) {
          Loading.dismissAll();
          handler.reject(DioException(requestOptions: response.requestOptions, message: '未登录'));
          showToast('请先登录');
          RouteUtils.push(RouteUtils.context, const LoginPage());
        } else {
          showToast(rsp.msg ?? "");
          if (rsp.data == null) {
            handler.next(Response(requestOptions: response.requestOptions, data: false));
          }  else {
            handler.next(Response(requestOptions: response.requestOptions, data: rsp.data));
          }
        }
      } catch (e) {
        handler.reject(DioException(requestOptions: response.requestOptions, message: '$e'));
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }
}
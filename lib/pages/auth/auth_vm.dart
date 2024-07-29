import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_rss/api/login_api.dart';
import 'package:flutter_rss/constants.dart';
import 'package:flutter_rss/utils/sp_utils.dart';
import 'package:oktoast/oktoast.dart';

class AuthViewModel with ChangeNotifier {

  bool shouldLogin = false;
  String? username;
  Map<String, dynamic>? userInfo;

  LoginInfo loginInfo = LoginInfo();
  RegisterInfo registerInfo = RegisterInfo();

  Future initData() async {
    SpUtils.getString(Constants.USER_INFO).then((value) {
      if (value == null || value == "") {
        username = "请登录";
        shouldLogin = true;
      } else {
        userInfo = jsonDecode(value);
        username = userInfo?['username'];
        shouldLogin = false;
      }
      notifyListeners();
    });
  }

  Future<bool?> login() async {
    if (loginInfo.username != null && loginInfo.password != null) {
      Map<String, dynamic> map = await LoginApi.instance.login(
          username: loginInfo.username, password: loginInfo.password);
      if (map['token'] != null) {
        SpUtils.saveString(Constants.TOKEN, map['token']);
        SpUtils.saveString(Constants.USER_INFO, jsonEncode(map['userInfo']));
      }
      showToast("登录成功");
      return true;
    }
    showToast("登录失败");
    return false;
  }

  Future<bool?> register() async {
    if (registerInfo.username != null && registerInfo.password != null &&
        registerInfo.repassword != null &&
        registerInfo.password == registerInfo.repassword) {
      if ((registerInfo.password?.length ?? 0) >= 6) {
        dynamic callback = await LoginApi.instance.register(
          username: registerInfo.username,
          password: registerInfo.password,
          repassword: registerInfo.repassword
        );
        if (callback is bool) {
          return callback;
        } else {
          return true;
        }
      }
      showToast("密码长度必须大于6位");
      return false;
    }
    showToast("输入不能为空或密码必须一致");
    return false;
  }

  void setLoginInfo({String? username, String? password}) {
    if (username != null) {
      loginInfo.username = username;
    }
    if (password != null) {
      loginInfo.password = password;
    }
  }
}

class RegisterInfo {
  String? username;
  String? password;
  String? repassword;
}

class LoginInfo {
  String? username;
  String? password;
}
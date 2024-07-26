import 'package:flutter/cupertino.dart';
import 'package:flutter_rss/api/login_api.dart';
import 'package:flutter_rss/constants.dart';
import 'package:flutter_rss/utils/sp_utils.dart';
import 'package:oktoast/oktoast.dart';

class AuthViewModel with ChangeNotifier{

  LoginInfo loginInfo = LoginInfo();

  Future<bool?> login() async {
    if (loginInfo.username != null && loginInfo.password != null) {
      Map<String, dynamic> map = await LoginApi.instance.login(username: loginInfo.username, password: loginInfo.password);
      if (map['token'] != null) {
        SpUtils.saveString(Constants.TOKEN, map['token']!);
      }
      showToast("登录成功");
      return true;
    }
    showToast("登录失败");
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

class LoginInfo {
  String? username;
  String? password;
}
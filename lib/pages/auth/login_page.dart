import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss/common_ui/common_style.dart';
import 'package:flutter_rss/pages/auth/register_page.dart';
import 'package:flutter_rss/routes/RouteUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> {

  TextEditingController? userInputController;
  TextEditingController? pwdInputController;

  @override
  void initState() {
    super.initState();
    userInputController = TextEditingController();
    pwdInputController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:  Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonInput(labelText: "输入账号", controller: userInputController),
              SizedBox(height: 20.h,),
              commonInput(labelText: "输入密码", controller: pwdInputController, obscureText: true),
              SizedBox(height: 50.h,),
              whiteBorderButton(title: "登录", onTap: () => {}),
              SizedBox(height: 5.h,),
              registerButton(() {
                RouteUtils.push(context, const RegisterPage());
              }),
            ],
          ),
        ),
    );
  }

  Widget registerButton(GestureTapCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 100.w,
        height: 45.h,
        child: Text('注册', style: TextStyle(color: Colors.white, fontSize: 13.sp),),
      ),
    );
  }
}
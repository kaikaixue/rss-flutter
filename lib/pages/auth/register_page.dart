import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_ui/common_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          alignment: Alignment.center,
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonInput(labelText: "输入账号", onChanged: (value) {

                  }),
                  SizedBox(height: 20.h),
                  commonInput(labelText: "输入密码", obscureText: true, onChanged: (value) {

                  }),
                  SizedBox(height: 20.h,),
                  commonInput(labelText: "再次输入密码",obscureText: true, onChanged: (value) {

                  }),
                  SizedBox(height: 50.h,),
                  whiteBorderButton(title: '点击注册', onTap: () {
                  })
                ],
          ),
      ),
    );
  }
}
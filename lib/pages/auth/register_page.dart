import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss/pages/auth/auth_vm.dart';
import 'package:flutter_rss/routes/RouteUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common_ui/common_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  AuthViewModel authViewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return authViewModel;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          alignment: Alignment.center,
          child: Consumer<AuthViewModel>(
            builder: (context, vm, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonInput(
                      labelText: "输入账号",
                      onChanged: (value) {
                        vm.registerInfo.username = value;
                      }),
                  SizedBox(height: 20.h),
                  commonInput(
                      labelText: "输入密码",
                      obscureText: true,
                      onChanged: (value) {
                        vm.registerInfo.password = value;
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  commonInput(
                      labelText: "再次输入密码",
                      obscureText: true,
                      onChanged: (value) {
                        vm.registerInfo.repassword = value;
                      }),
                  SizedBox(
                    height: 50.h,
                  ),
                  whiteBorderButton(title: '点击注册', onTap: () {
                    authViewModel.register().then((value) {
                      if (value == true) {
                        RouteUtils.pop(context);
                      }
                    });
                  })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

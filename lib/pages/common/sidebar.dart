import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss/pages/auth/auth_vm.dart';
import 'package:flutter_rss/pages/auth/login_page.dart';
import 'package:flutter_rss/routes/RouteUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SidebarMenuState();
  }
}

class _SidebarMenuState extends State<SidebarMenu> {
  AuthViewModel authViewModel = AuthViewModel();

  @override
  void initState() {
    super.initState();
    authViewModel.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(() {
            RouteUtils.push(context, const LoginPage());
          }),
          _settingItem("最近阅读", "assets/images/history.png", () {}),
          _settingItem("整理", "assets/images/entirety.png", () {}),
          SizedBox(
            height: 20.h,
          ),
          const Divider(height: 1.0, indent: 0.0, color: Colors.grey),
          Padding(
            padding: EdgeInsets.only(left: 15.w, top: 15.h),
            child: Text(
              "设置",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          _settingItem("设置", "assets/images/setting.png", () => {}),
        ],
      ),
      // SafeArea(
      //   child:
      // ),
    );
  }

  Widget _header(GestureTapCallback? onTap) {
    return ChangeNotifierProvider(
      create: (context) {
        return authViewModel;
      },
      child: Container(
        padding: EdgeInsets.only(top: 36.h),
        color: Theme.of(context).colorScheme.primary,
        alignment: Alignment.center,
        height: 240.h,
        child: Consumer<AuthViewModel>(
          builder: (context, vm, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(35.r)),
                    child: vm.userInfo?['avatar'] != null
                        ? Image.network(
                            vm.userInfo?['avatar'],
                            width: 70.r,
                            height: 70.r,
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            "assets/images/logo.png",
                            width: 70.r,
                            height: 70.r,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    vm.username ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _settingItem(
      String? title, String? iconUrl, GestureTapCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        padding: EdgeInsets.only(left: 10.w, right: 15.w),
        width: double.infinity,
        height: 32.h,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.grey, width: 0.5.r),
        //   borderRadius: BorderRadius.all(Radius.circular(5.r)),
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconUrl ?? '',
                  width: 22.r,
                  height: 22.r,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  title ?? '',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
              ],
            ),
            // Image.asset(
            //   'assets/images/img_arrow_right.png',
            //   width: 20.r,
            //   height: 20.r,
            // )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss/AppInfoProvider.dart';
import 'package:flutter_rss/constants.dart';
import 'package:flutter_rss/routes/RouteUtils.dart';
import 'package:flutter_rss/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  // 逻辑短边
  final logicalShortestSide = firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  // 逻辑长边
  final logicalLongestSide = firstView.physicalSize.longestSide / firstView.devicePixelRatio;
  // 缩放比例 designSize越小，元素越大
  const scaleFactor = 0.95;
  // 缩放后的逻辑短边和长边
  return Size(logicalShortestSide * scaleFactor, logicalLongestSide * scaleFactor);
}

class MyApp extends StatelessWidget {

  // const MyApp({super.key});

  Color? _themeColor;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(child: ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) {
        return MultiProvider(providers: [
          ChangeNotifierProvider.value(value: AppInfoProvider())
        ],
        child: Consumer<AppInfoProvider>(
          builder: (context, vm, child) {
            String colorKey = vm.themeColor;
            if (Constants.themeColorMap[colorKey] != null) {
              _themeColor = Constants.themeColorMap[colorKey];
            }
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: _themeColor ?? Colors.purple),
                primaryColor: _themeColor,
                floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: _themeColor),
                useMaterial3: true,
              ),
              navigatorKey: RouteUtils.navigatorKey,
              onGenerateRoute: Routes.generateRoute,
              initialRoute: RoutePath.splash,
            );
          },
        ),);
      },
    ));
  }
}
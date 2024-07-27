import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rss/pages/auth/login_page.dart';
import 'package:flutter_rss/pages/auth/register_page.dart';
import 'package:flutter_rss/pages/feed/feed_page.dart';
import 'package:flutter_rss/pages/home_page.dart';
import 'package:flutter_rss/splash_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(const HomePage(), settings: settings);
      case RoutePath.splash:
        return pageRoute(const SplashPage(), settings: settings);
      case RoutePath.loginPage:
        return pageRoute(const LoginPage(), settings: settings);
      case RoutePath.registerPage:
        return pageRoute(const RegisterPage(), settings: settings);
      case RoutePath.feedPage:
        return pageRoute(const FeedPage(), settings: settings);
    }

    return pageRoute(Scaffold(
      body: SafeArea(
        child: Text('路由： ${settings.name} 不存在'),
      ),
    ));
  }

  static MaterialPageRoute pageRoute(Widget page,
      {RouteSettings? settings,
      bool? fullscreenDialog,
      bool? maintainState,
      bool? allowSnapshotting}) {
    return MaterialPageRoute(
        builder: (context) {
          return page;
        },
        settings: settings,
        fullscreenDialog: fullscreenDialog ?? true,
        maintainState: maintainState ?? true,
        allowSnapshotting: allowSnapshotting ?? true);
  }
}

class RoutePath {
  static const String splash = '/';
  static const String home = '/home';
  static const String loginPage = '/login_page';
  static const String registerPage = '/register_page';
  static const String feedPage = '/feed_page';
}

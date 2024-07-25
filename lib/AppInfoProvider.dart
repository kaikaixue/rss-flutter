import 'package:flutter/cupertino.dart';

class AppInfoProvider with ChangeNotifier {
  String _themeColor = '';

  String get themeColor => _themeColor;

  setTheme(String themeColor) {
    _themeColor = themeColor;
    notifyListeners();
  }

/**
 * 修改主题色
 * setState(() {
    _colorKey = key;
    });
    SpUtil.putString('key_theme_color', key);
    Provider.of<AppInfoProvider>(context, listen: false)
    .setTheme(key);
 *
 *
 *
 */
}
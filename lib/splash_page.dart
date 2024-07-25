import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss/AppInfoProvider.dart';
import 'package:flutter_rss/pages/home_page.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  
  String? _colorKey;
  
  @override
  void initState() {
    super.initState();
    _initAsync();
  }
  
  Future<void> _initAsync() async {
    await SpUtil.getInstance();
    _colorKey = SpUtil.getString('key_theme_color', defValue: 'green');
    Provider.of<AppInfoProvider>(context, listen: false).setTheme(_colorKey ?? 'deepPurple');
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}
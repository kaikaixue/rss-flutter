import 'package:flutter/material.dart';
import 'package:flutter_rss/http/dio_instance.dart';
import 'app.dart';

void main() {
  DioInstance.instance().initDio(baseUrl: "http://localhost:8888/");
  runApp(MyApp());
}


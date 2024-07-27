import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rss/api/feed_api.dart';
import 'package:flutter_rss/repository/feed_model.dart';
import 'package:oktoast/oktoast.dart';

class FeedViewModel with ChangeNotifier {

  FeedModel? feedModel;

  Future<bool?> analysisRssUrl(String url) async {
    if (url.contains("http")) {
      feedModel = await FeedApi.instance.analysisRssUrl(url);
      return true;
    }
    showToast("请输入正确的订阅源地址");
    return false;
  }
}
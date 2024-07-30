import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rss/api/feed_api.dart';
import 'package:flutter_rss/repository/feed_model.dart';
import 'package:oktoast/oktoast.dart';

class FeedViewModel with ChangeNotifier {
  FeedModel? feedModel;
  RssInfo rssInfo = RssInfo();

  Future<RssInfo?> analysisRssUrl(String url) async {
    if (url.contains("http")) {
      feedModel = await FeedApi.instance.analysisRssUrl(url);
      setRssInfo(
          title: feedModel?.feedTitle,
          url: feedModel?.feedUrl,
          description: feedModel?.feedDescription,
          logoUrl: feedModel?.feedLogo);
      notifyListeners();
      return rssInfo;
    }
    showToast("请输入正确的订阅源地址");
    return null;
  }

Future<bool?> addSubscription(int feedId) async {
  dynamic callback = await FeedApi.instance.addSubscriptions(feedId);
  if (callback is bool) {
    return callback;
  } else {
    return true;
  }
}

  void setRssInfo(
      {String? title, String? url, String? description, String? logoUrl}) {
    rssInfo.title = title;
    rssInfo.url = url;
    rssInfo.description = description;
    rssInfo.logoUrl = logoUrl;
  }
}

class RssInfo {
  String? title;
  String? url;
  String? description;
  String? logoUrl;
}

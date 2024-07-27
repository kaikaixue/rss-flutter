import 'package:dio/dio.dart';
import 'package:flutter_rss/http/dio_instance.dart';

import '../repository/feed_model.dart';

class FeedApi {
  static FeedApi instance = FeedApi._();

  FeedApi._();

  Future<FeedModel?> analysisRssUrl(String? url) async {
    Response response = await DioInstance.instance().get(path: "/app/feed/analysis", params: {
      "url": url
    });
    FeedModel model = FeedModel.fromJson(response.data);
    return model;
  }
}
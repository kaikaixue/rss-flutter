import 'package:dio/dio.dart';
import 'package:flutter_rss/http/dio_instance.dart';

import '../repository/feed_model.dart';

class FeedApi {
  static FeedApi instance = FeedApi._();

  FeedApi._();

  /// 解析订阅源链接
  Future<FeedModel?> analysisRssUrl(String? url) async {
    Response response = await DioInstance.instance().get(path: "/app/feed/analysis", params: {
      "url": url
    });
    FeedModel model = FeedModel.fromJson(response.data);
    return model;
  }

  Future<dynamic> addSubscriptions(int? feedId) async {
    Response response = await DioInstance.instance().post(path: "app/subscription/add", queryParameters: {
      "feedId": feedId
    });
    return response.data;
  }

  Future<List<FeedModel>?> listByFeed(int pageNum, {int? pageSize = 10}) async {
    Response response = await DioInstance.instance().post(path: "app/feed/listPage", queryParameters: {
      "pageNum": pageNum,
      "pageSize": pageSize
    });
    FeedModelList feedList = FeedModelList.fromJson(response.data);
    return feedList.rows;
  }
}
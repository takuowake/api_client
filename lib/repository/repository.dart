import 'dart:convert';

import 'package:api_client/service/api_client.dart';
import '../model/news.dart';

class Repository {
  Future<List<News>> getNews() {
    return ApiClient.create().getNews().then((value) {
      final list = json.decode(value.body) as List<dynamic>;
      final result = List<News>.from(list.map((e) => News.fromJson(e)));
      return result;
    });
  }
}
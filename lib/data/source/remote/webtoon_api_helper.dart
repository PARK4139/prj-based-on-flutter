// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Webtoon {
  final String title;
  final String thumb;
  final String id;

  Webtoon.fromJson(Map<String, dynamic> webtoons)
      : title = webtoons['title'],
        thumb = webtoons['thumb'],
        id = webtoons['id'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{};
    user["id"] = id;
    user["title"] = title;
    user["thumb"] = thumb;
    return user;
  }
}

class WebtoonApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<Webtoon>> getTodaysToons() async {
    final Uri url = Uri.parse('$baseUrl/$today');
    final Response response = await http.get(url); // 동기처리로 url로 요청을 보내고 결과를 받아온다.
    List<Webtoon> webtoons_ = [];
    if (response.statusCode == 200) {
      // debugSomething(response.body);
      final List<dynamic> responseBody = jsonDecode(response.body); //decode 'body data from API' as json
      for (Map<String, dynamic> webtoon in responseBody) {
        // debugSomething(webtoon);
        webtoons_.add(Webtoon.fromJson(webtoon));
      }
      // debugSomething(webtoons_);
      return webtoons_;
    }
    throw Error();
  }
}

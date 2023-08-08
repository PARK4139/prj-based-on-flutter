// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiDto {
  late final String title;
  late final String thumb;
  late final String id;

  ApiDto({required Map<String, dynamic> model}) {
    title = model['title'];
    thumb = model['thumb'];
    id = model['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> model = <String, dynamic>{}; //빈 맵 초기화 ..?   final 붙였는데 ?... 되나?
    model["id"] = id;
    model["title"] = title;
    model["thumb"] = thumb;
    return model;
  }
}

class ApiServiceHelper {
  static const String apiBaseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String uniqueSuffix = "today";

  static Future<List<ApiDto>> getWebToons() async {
    final Uri url = Uri.parse('$apiBaseUrl/$uniqueSuffix');
    final Response response = await http.get(url); // 동기처리로 url로 요청을 보내고 response 를 가져와 response 인스턴스에 저장
    List<ApiDto> modelSerialized = []; // initialization null->[]
    // print(response.statusCode);
    // print(response.body);//response.body 의 data type 은 String 이고  jsonString 을 의미
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(response.body);
      for (var model in responseBody) {
        //responseBody 에는 models 가 들어있다.
        modelSerialized.add(ApiDto(model: model));
      }
      return modelSerialized;
    }
    throw Error();
  }
}

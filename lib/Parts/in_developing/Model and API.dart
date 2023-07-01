import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//니콜라스의 webtoonAPI 호출 결과를 저장할 model 생성, 이게 혹시 fetch 작업인가?
//data fetch with stateful wiget
class ModelWebToon {
  final String title;
  final String thumb;
  final String id;

  // ModelWebToon({required this.title, required this.thumb, required this.id});

  ModelWebToon.fromJson(Map<String, dynamic> webtoons)
      : this.title = webtoons['title'],
        this.thumb = webtoons['thumb'],
        this.id = webtoons['id'];
}

class ApiService {
  static final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static final String today = "today";

  // 니콜라스 API 를 통하여 today webtoon datas 호출
  static Future<List<ModelWebToon>> getTodaysToons() async {
    // static Future<List<ModelWebToon>> getTodaysToons() async {
    final Uri url = Uri.parse('$baseUrl/$today');
    final Response response = await http.get(url); // 동기처리로 url로 요청을 보내고 결과를 받아온다.
    List<ModelWebToon> modelWebToonInstance = [];
    if (response.statusCode == 200) {
      // var DummyApiBodyDatas = [ //DEVELOPMENT
      //   {//DEVELOPMENT
      //     "thumb": "내가 가장 많이 연습한 FRAMEWORK 는 FLUTTER",//DEVELOPMENT
      //     "title": "내가 가장 많이 연습한 FRAMEWORK{{DATA SEPERATOR}}FLUTTER",//DEVELOPMENT
      //     "id": "gt5765LI*",//DEVELOPMENT
      //   },//DEVELOPMENT
      //   {//DEVELOPMENT
      //     "thumb": "내가 가장 많이 연습한 FRAMEWORK 는 FLUTTER",//DEVELOPMENT
      //     "title": "내가 가장 많이 연습한 FLUTTER",//DEVELOPMENT
      //     "id": "gt5765LI*",//DEVELOPMENT
      //   },//DEVELOPMENT
      //   {//DEVELOPMENT
      //     "thumb": "내가 가장 많이 연습한 FRAMEWORK 는 FLUTTER",//DEVELOPMENT
      //     "title": "내가 가장 많이 연습한 FLUTTER",//DEVELOPMENT
      //     "id": "gt5765LI*",//DEVELOPMENT
      //   },//DEVELOPMENT
      // ];//DEVELOPMENT
      // print(DummyApiBodyDatas);//DEVELOPMENT
      // for(var DummyApiBodyData in DummyApiBodyDatas){//DEVELOPMENT
      //   print(DummyApiBodyData);//DEVELOPMENT
      // }//DEVELOPMENT

      // print(response.body);  //DEVELOPMENT // API RESPONSE TEST
      final List<dynamic> responseBody = jsonDecode(response.body); //decode 'body data from API' as json
      // for (Map<String,dynamic> webtoons in response_body) {
      for (var webtoons in responseBody) {
        // print(webtoons); //DEVELOPMENT // DECODED FROM JSON STRING TO ________ TEST
        // final webtoons_ = ModelWebToon.fromJson(webtoons); // response.body 에 있는 data 를 modelWebToon 에 matching
        // print(webtoons_); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        // print(webtoons_.id); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        // print(webtoons_.title); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        // print(webtoons_.thumb); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        modelWebToonInstance.add(ModelWebToon.fromJson(webtoons));
      }
      return modelWebToonInstance;
    }
    throw Error();
  }
}

class User {
  var id;
  var name;
  var date_join;
  var date_login;


  User({
    required this.id,
    required this.name,
    required this.date_join,
    required this.date_login,
  });


  // User();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = Map<String, dynamic>();
    user["id"] = id;
    user["name"] = this.name;
    user["date_join"] = this.date_join;
    user["date_login"] = this.date_login;
    return user;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'],name: json['name'],date_join: json['date_join'], date_login: json['date_login']);
  }
}

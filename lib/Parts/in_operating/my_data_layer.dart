import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

/*model*/
class WebToon {
  final String title;
  final String thumb;
  final String id;

  // ModelWebToon({required this.title, required this.thumb, required this.id});

  WebToon.fromJson(Map<String, dynamic> webtoons)
      : this.title = webtoons['title'],
        this.thumb = webtoons['thumb'],
        this.id = webtoons['id'];
}

/*api & model connection*/
class ApiService {
  static final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static final String today = "today";

  static Future<List<WebToon>> getTodaysToons() async {
    // static Future<List<ModelWebToon>> getTodaysToons() async {
    final Uri url = Uri.parse('$baseUrl/$today');
    final Response response = await http.get(url); // 동기처리로 url로 요청을 보내고 결과를 받아온다.
    List<WebToon> webtoons_ = [];
    if (response.statusCode == 200) {
      // print(response.body);  // API RESPONSE TEST
      final List<dynamic> responseBody = jsonDecode(response.body); //decode 'body data from API' as json
      // for (Map<String,dynamic> webtoons in response_body) {
      for (var webtoons in responseBody) {
        // print(webtoons); //DEVELOPMENT // DECODED FROM JSON STRING TO ________ TEST
        // final webtoons_ = ModelWebToon.fromJson(webtoons); // response.body 에 있는 data 를 modelWebToon 에 matching
        // print(webtoons_); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        // print(webtoons_.id); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        // print(webtoons_.title); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        // print(webtoons_.thumb); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        webtoons_.add(WebToon.fromJson(webtoons)); //이거 맞나?  responsebody 가 webtoons 를 의미하고 webtoons 에서 webtoon 을 가져오는 거 아니고? 나중에 테스트 해보자
      }
      return webtoons_;
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      date_join: json['date_join'],
      date_login: json['date_login'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = Map<String, dynamic>();
    user["id"] = id;
    user["name"] = this.name;
    user["date_join"] = this.date_join;
    user["date_login"] = this.date_login;
    return user;
  }
}

class Carrot_user_card_infos {
  final String user_item_img_url;
  final String item_category;
  final String user_location;
  final String user_uploading_time;
  final int item_price;
  final int heart_count;
  final int chatting_request_count;

  Carrot_user_card_infos.fromMap(Map<String, dynamic> map)
      : user_item_img_url = map['user_item_img_url'],
        item_category = map['item_category'],
        user_location = map['user_location'],
        item_price = map['item_price'],
        user_uploading_time = map['user_uploading_time'],
        heart_count = map['heart_count'],
        chatting_request_count = map['chatting_request_count'];

  @override
  String toString() => "Carrot_user_card_datasets<$user_item_img_url:$item_category>";
}

class Carrot_user_card_for_activity_notification_infos {
  final String notification_img_url;
  final String notification_description1;
  final String notification_description2;
  final String notification_uploading_time;

  Carrot_user_card_for_activity_notification_infos.fromMap(Map<String, dynamic> map)
      : notification_img_url = map['notification_img_url'],
        notification_description1 = map['notification_description1'],
        notification_description2 = map['notification_description2'],
        notification_uploading_time = map['notification_uploading_time'];

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

class Movie {
  /*PRODUCTION*/
  final String title;
  final String kind;
  final String img_url;
  final bool like;

  /*PRODUCTION*/
  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        kind = map['kind'],
        img_url = map['img_url'],
        like = map['like'];

// @override
// String toString() => "Movie<$title:$kind>";
}

/*DEVELOPMENT*/
List<Movie> movies_dummy = [
  Movie.fromMap({
    'title': 'Ozark',
    'kind': '스릴러/공포/판타지',
    'img_url': 'assets/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromMap({
    'title': '사랑의 불시착',
    'kind': '사랑/로맨스/판타지',
    'img_url': 'assets/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromMap({'title': '보헤미안 랩소디', 'kind': '음악/드라마/인물', 'img_url': 'https://movie-phinf.pstatic.net/20181213_264/1544692854634ss65r_JPEG/movie_image.jpg', 'like': false}),
  Movie.fromMap({'title': '사랑의 불시착', 'kind': '가슴 뭉클/로맨스/코미디/금지된 사랑/정반대 캐릭터', 'img_url': 'https://file.mk.co.kr/meet/neds/2019/12/image_readtop_2019_1046822_15762744634013454.jpg', 'like': false}),
  Movie.fromMap({'title': '포레스트 검프', 'kind': '드라마/외국', 'img_url': 'https://movie-phinf.pstatic.net/20160901_187/1472711688297YP2jH_JPEG/movie_image.jpg', 'like': false}),
  Movie.fromMap({'title': '쇼생크 탈출', 'kind': '추리/반전/서스펜스', 'img_url': 'https://movie-phinf.pstatic.net/20160119_278/14531650465287bcuk_JPEG/movie_image.jpg', 'like': false}),
  Movie.fromMap({'title': '라이언 일병 구하기', 'kind': '드라마/전쟁/역사', 'img_url': 'https://movie-phinf.pstatic.net/20111222_4/1324498435937yqCYm_JPEG/movie_image.jpg', 'like': false}),
  Movie.fromMap({'title': '????', 'kind': '????', 'img_url': 'assets/app_netflix_movie_poster_1.png', 'like': false}),
];

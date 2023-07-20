import 'dart:async';
import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

/*model class & json connection*/
class SerializationHelper{
  late final String title;
  late final String thumb;
  late final String id;

  SerializationHelper({required Map<String, dynamic> model}){
    title = model['title'];
    thumb = model['thumb'];
    id = model['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> model = <String, dynamic>{};  //빈 맵 초기화 ..?   final 붙였는데 ?... 되나?
    model["id"] = id;
    model["title"] = title;
    model["thumb"] = thumb;
    return model;
  }
}

/*api service class & model class connection*/
class ApiServiceHelper {
  static const String apiBaseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String uniqueSuffix = "today";

  static Future<List<SerializationHelper>> getTodaysToons() async {
    final Uri url = Uri.parse('$apiBaseUrl/$uniqueSuffix');
    final Response response = await http.get(url); // 동기처리로 url로 요청을 보내고 response 를 가져와 response 인스턴스에 저장
    List<SerializationHelper> modelSerialized = [];//initialization null->[]
    /*API RESPONSE TEST*/
    // print(response.statusCode);
    // print(response.body);//response.body 의 data type 은 String 이고  jsonString 을 의미
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(response.body);
      for (var model in responseBody) {  //responseBody 에는 models 가 들어있다.
        modelSerialized.add(SerializationHelper(model: model));
      }
      return modelSerialized;
    }
    throw Error();
  }
}



/*model class & json connection*/
class Webtoon {
   final String title;
   final String thumb;
   final String id;

  Webtoon.fromJson(Map<String, dynamic> webtoons)
      : title = webtoons['title'],
        thumb = webtoons['thumb'],
        id = webtoons['id'];

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> user = <String, dynamic>{};  //빈 맵 초기화 ..?   final 붙였는데 ?... 되나?
     user["id"] = id;
     user["title"] = title;
     user["thumb"] = thumb;
     return user;
   }
}
/*api service class & model class connection*/
class webtoonApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<Webtoon>> getTodaysToons() async {
    final Uri url = Uri.parse('$baseUrl/$today');
    final Response response = await http.get(url); // 동기처리로 url로 요청을 보내고 결과를 받아온다.
    List<Webtoon> webtoons_ = [];//initialization null->[]
    if (response.statusCode == 200) {
      // print(response.body);  // API RESPONSE TEST
      final List<dynamic> responseBody = jsonDecode(response.body); //decode 'body data from API' as json
      // for (Map<String,dynamic> webtoons in responseBody) {
      for (var webtoons in responseBody) {
        // print(webtoons); //DEVELOPMENT // DECODED FROM JSON STRING TO ________ TEST
        // final webtoons_ = ModelWebToon.fromJson(webtoons); // response.body 에 있는 data 를 modelWebToon 에 matching
        // print(webtoons_); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        // print(webtoons_.id); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        // print(webtoons_.title); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        // print(webtoons_.thumb); //DEVELOPMENT // MODEL AND CLASS BINDED TEST
        webtoons_.add(Webtoon.fromJson(webtoons)); //이거 맞나?  responsebody 가 webtoons 를 의미하고 webtoons 에서 webtoon 을 가져오는 거 아니고? 나중에 테스트 해보자
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
    final Map<String, dynamic> user = <String, dynamic>{};  //빈 맵 초기화 ..?   final 붙였는데 ?... 되나?
    user["id"] = id;
    user["name"] = name;
    user["date_join"] = date_join;
    user["date_login"] = date_login;
    return user;
  }
}

class CarrotUserCardInfos {
  final String user_item_imgUrl;
  final String item_category;
  final String user_location;
  final String user_uploading_time;
  final int item_price;
  final int heart_count;
  final int chatting_request_count;

  CarrotUserCardInfos.fromMap(Map<String, dynamic> map)
      : user_item_imgUrl = map['user_item_imgUrl'],
        item_category = map['item_category'],
        user_location = map['user_location'],
        item_price = map['item_price'],
        user_uploading_time = map['user_uploading_time'],
        heart_count = map['heart_count'],
        chatting_request_count = map['chatting_request_count'];

  @override
  String toString() => "Carrot_user_card_datasets<$user_item_imgUrl:$item_category>";
}

class CarrotUserCardForActivityNotificationInfos {
  final String notification_imgUrl;
  final String notification_description1;
  final String notification_description2;
  final String notification_uploading_time;

  CarrotUserCardForActivityNotificationInfos.fromMap(Map<String, dynamic> map)
      : notification_imgUrl = map['notification_imgUrl'],
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
  final String imgUrl;
  final bool like;
  // final DocumentReference reference;

  /*PRODUCTION*/
  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        kind = map['kind'],
        imgUrl = map['imgUrl'],
        like = map['like'];
  // Movie.fromMap(Map<String, dynamic> map, {required this.reference})
  //     : title = map['title'],
  //       kind = map['kind'],
  //       imgUrl = map['imgUrl'],
  //       like = map['like'];

  /*firebase 연동 작업 중*/
  // Movie.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data, reference: snapshot.reference);



// @override
// String toString() => "Movie<$title:$kind>";
}

/*DEVELOPMENT*/
List<Movie> movies_dummy = [
  // Movie.fromMap({
  //   'title': '????',
  //   'kind': '????',
  //   'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
  //   'like': false,
  // }),
  Movie.fromMap({
    'title': 'Ozark',
    'kind': '스릴러/공포/판타지',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromMap({
    'title': '사랑의 불시착',
    'kind': '사랑/로맨스/판타지',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromMap({
    'title': '보헤미안 랩소디',
    'kind': '음악/드라마/인물',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromMap({
    'title': '안녕, 모니카',
    'kind': '가슴 뭉클/로맨스/코미디/금지된 사랑/정반대 캐릭터',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromMap({
    'title': '포레스트 검프',
    'kind': '드라마/외국',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromMap({
    'title': '쇼생크 탈출',
    'kind': '추리/반전/서스펜스',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromMap({
    'title': '라이언 일병 구하기',
    'kind': '드라마/전쟁/역사',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
];

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SerializationAndReverseSerializationHelper {
  late final String title;
  late final String thumb;
  late final String id;

  SerializationAndReverseSerializationHelper({required Map<String, dynamic> model}) {
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

  static Future<List<SerializationAndReverseSerializationHelper>> getTodaysToons() async {
    final Uri url = Uri.parse('$apiBaseUrl/$uniqueSuffix');
    final Response response = await http.get(url); // 동기처리로 url로 요청을 보내고 response 를 가져와 response 인스턴스에 저장
    List<SerializationAndReverseSerializationHelper> modelSerialized = []; // initialization null->[]
    // print(response.statusCode);
    // print(response.body);//response.body 의 data type 은 String 이고  jsonString 을 의미
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(response.body);
      for (var model in responseBody) {
        //responseBody 에는 models 가 들어있다.
        modelSerialized.add(SerializationAndReverseSerializationHelper(model: model));
      }
      return modelSerialized;
    }
    throw Error();
  }
}

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

class User {
  String id;
  String name;
  DateTime dateJoin;
  DateTime dateLogin;

  User({
    required this.id,
    required this.name,
    required this.dateJoin,
    required this.dateLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      dateJoin: json['date_join'],
      dateLogin: json['date_login'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{}; //빈 맵 초기화 ..?   final 붙였는데 ?... 되나?
    user["id"] = id;
    user["name"] = name;
    user["date_join"] = dateJoin;
    user["date_login"] = dateLogin;
    return user;
  }
}

class CarrotUserCardInfos {
  final String userItemImgUrl;
  final String itemCategory;
  final String userLocation;
  final String userUploadingTime;
  final int itemPrice;
  final int heartCount;
  final int chattingRequestCount;

  CarrotUserCardInfos.fromMap(Map<String, dynamic> map)
      : userItemImgUrl = map['userItemImgUrl'],
        itemCategory = map['itemCategory'],
        userLocation = map['userLocation'],
        itemPrice = map['itemPrice'],
        userUploadingTime = map['userUploadingTime'],
        heartCount = map['heartCount'],
        chattingRequestCount = map['chattingRequestCount'];

  @override
  String toString() => "CarrotUserCardDatasets<$userItemImgUrl:$itemCategory>";
}

class CarrotUserCardForActivityNotificationInfos {
  final String notificationImgUrl;
  final String notificationDescription1;
  final String notificationDescription2;
  final String notificationUploadingTime;

  CarrotUserCardForActivityNotificationInfos.fromMap(Map<String, dynamic> map)
      : notificationImgUrl = map['notificationImgUrl'],
        notificationDescription1 = map['notificationDescription1'],
        notificationDescription2 = map['notificationDescription2'],
        notificationUploadingTime = map['notificationUploadingTime'];

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

class Movie {
  late final String title;
  late final String kind;
  late final String imgUrl;
  late final bool like;

  // final String title;
  // final String kind;
  // final String imgUrl;
  // final bool like;
  // final DocumentReference reference;

  Movie({required Map<String, dynamic> model}) {
    title = model['title'];
    kind = model['kind'];
    imgUrl = model['imgUrl'];
    like = model['like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{};
    user["kind"] = kind;
    user["title"] = title;
    user["imgUrl"] = imgUrl;
    user["like"] = like;
    return user;
  }

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


/*firebase 용 named constructor 연동 작업 중*/
// Movie.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data, reference: snapshot.reference);

// @override
// String toString() => "Movie<$title:$kind>";
}

List<Movie> moviesDummy = [
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

import 'dart:async';
import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import '../../../helpers/super_helper.dart';

class Movie {
  final String title;
  final String kind;
  final String imgUrl;
  final bool like;

  // final DocumentReference reference;

  Movie.fromJson(Map<String, dynamic> map)
      : title = map['title'],
        kind = map['kind'],
        imgUrl = map['imgUrl'],
        like = map['like'];

  // Movie.fromJson(Map<String, dynamic> map, {required this.reference})
  //     : title = map['title'],
  //       kind = map['kind'],
  //       imgUrl = map['imgUrl'],
  //       like = map['like'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{};
    user['itle'] = title;
    user['kind'] = kind;
    user['imgUrl'] = imgUrl;
    user['like'] = like;
    return user;
  }

/*firebase 연동 작업 중*/
// Movie.fromSnapshot(DocumentSnapshot snapshot) : this.fromJson(snapshot.data, reference: snapshot.reference);

// @override
// String toString() => "Movie<$title:$kind>";
}

List<Movie> moviesDummy = [
  Movie.fromJson({
    'title': 'Ozark',
    'kind': '스릴러/공포/판타지',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromJson({
    'title': '사랑의 불시착',
    'kind': '사랑/로맨스/판타지',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromJson({
    'title': '보헤미안 랩소디',
    'kind': '음악/드라마/인물',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromJson({
    'title': '안녕, 모니카',
    'kind': '가슴 뭉클/로맨스/코미디/금지된 사랑/정반대 캐릭터',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromJson({
    'title': '포레스트 검프',
    'kind': '드라마/외국',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromJson({
    'title': '쇼생크 탈출',
    'kind': '추리/반전/서스펜스',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
  Movie.fromJson({
    'title': '라이언 일병 구하기',
    'kind': '드라마/전쟁/역사',
    'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
    'like': false,
  }),
];

class MovieApiService {
  static const String baseUrl = "https://Movie-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  /*GET 요청*/
  static Future<List<Movie>> getMoviesAsList() async {
    final Uri uri = Uri.parse('$baseUrl/$today');
    var dio = Dio();
    var response = await dio.getUri(uri); // 동기처리로 url로 요청을 보내고 결과를 받아온다.
    debugSomething(response.data);

    List<Movie> Movies_ = [];
    if (response.statusCode == 200) {
      // debugSomething(response.body);
      final List<dynamic> responseBody = jsonDecode(response.data); //decode 'body data from API' as json
      for (Map<String, dynamic> Movie in responseBody) {
        // debugSomething(Movie);
        Movies_.add(Movie.fromJson(Movie));
      }
      // debugSomething(Movies_);
      return Movies_;
    }
    throw Error();
  }

  /*POST 요청*/
  void postMoviesAsList() async {
    var dio = Dio();
    final Uri uri = Uri.parse('$baseUrl/$today');
    var response = await dio.post('<https://jsonplaceholder.typicode.com/posts>', data: {'title': 'foo', 'body': 'foofoo', 'userId': '1'});
    print(response.statusCode);
  }


}

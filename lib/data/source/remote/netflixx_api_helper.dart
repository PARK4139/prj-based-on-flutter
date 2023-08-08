// import 'package:cloud_firestore/cloud_firestore.dart';



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

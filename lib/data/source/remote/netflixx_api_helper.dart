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

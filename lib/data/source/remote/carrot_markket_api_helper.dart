// import 'package:cloud_firestore/cloud_firestore.dart';



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

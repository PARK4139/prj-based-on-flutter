import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../utils/security_helper.dart';
import '../../../utils/super_helper.dart';

class Pm10 {
  final String daegu;
  final String chungnam;
  final String incheon;
  final String daejeon;
  final String gyeongbuk;
  final String sejong;
  final String gwangju;
  final String jeonbuk;
  final String gangwon;
  final String ulsan;
  final String jeonnam;
  final String seoul;
  final String busan;
  final String jeju;
  final String chungbuk;
  final String gyeongnam;
  final String gyeonggi;
  String dataTime;
    String dataGubun;
    String itemCode;

  Pm10.fromJson(Map<String, dynamic> json)
      : daegu = json['daegu'] ?? "-9999",
        chungnam = json['chungnam'] ?? "-9999",
        incheon = json['incheon'] ?? "-9999",
        daejeon = json['daejeon'] ?? "-9999",
        gyeongbuk = json['gyeongbuk'] ?? "-9999",
        sejong = json['sejong'] ?? "-9999",
        gwangju = json['gwangju'] ?? "-9999",
        jeonbuk = json['jeonbuk'] ?? "-9999",
        gangwon = json['gangwon'] ?? "-9999",
        ulsan = json['ulsan'] ?? "-9999",
        jeonnam = json['jeonnam'] ?? "-9999",
        seoul = json['seoul'] ?? "-9999",
        busan = json['busan'] ?? "-9999",
        jeju = json['jeju'] ?? "-9999",
        chungbuk = json['chungbuk'] ?? "-9999",
        gyeongnam = json['gyeongnam'] ?? "-9999",
        dataTime = json['dataTime'] ?? "-9999",
        dataGubun = json['dataGubun'] ?? "-9999",
        gyeonggi = json['gyeonggi'] ?? "-9999",
        itemCode = json['itemCode'] ?? "-9999";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['daegu'] = daegu;
    json['chungnam'] = chungnam;
    json['incheon'] = incheon;
    json['daejeon'] = daejeon;
    json['gyeongbuk'] = gyeongbuk;
    json['sejong'] = sejong;
    json['gwangju'] = gwangju;
    json['jeonbuk'] = jeonbuk;
    json['gangwon'] = gangwon;
    json['ulsan'] = ulsan;
    json['jeonnam'] = jeonnam;
    json['seoul'] = seoul;
    json['busan'] = busan;
    json['jeju'] = jeju;
    json['chungbuk'] = chungbuk;
    json['gyeongnam'] = gyeongnam;
    json['gyeonggi'] = gyeonggi;
    json['dataGubun'] = dataGubun;
    json['dataTime'] = dataTime;
    json['itemCode'] = itemCode;
    return json;
  }
}

class Pm10ApiService {
  static const String baseUrl = "https://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst";
  static String serviceKey = SecurityHelper.pm10ApiKey;
  static const String etcApiSetting = ""
      "&returnType=json"
      "&numOfRows=30"
      "&pageNo=1"
      "&itemCode=PM10"
      "&dataGubun=HOUR"
      "&searchCondition=WEEK";

  /*GET 요청*/
  static Future<List<Pm10>> getPm10s() async {
    final Uri uri = Uri.parse('$baseUrl?serviceKey=$serviceKey$etcApiSetting');
    var dio = Dio();
    var response = await dio.getUri(uri); // 동기처리로 url로 요청을 보내고 결과를 받아온다.
    // debugSomething(response.data);
    List<Pm10> pm10s_ = [];
    debugSomething(response.statusCode, troubleShootingId: "202308050149");
    if (response.statusCode == 200) {
      // debugSomething(response.data );
      final List<dynamic> responseBody = response.data["response"]["body"]["items"];
      // debugSomething(responseBody);

      /*노마드코더 방식*/
      // for (Map<String, dynamic> pm10 in responseBody) {
      //   // debugSomething(pm10);
      //   // debugSomething(pm10["daegu"]);
      //   pm10s_.add(Pm10.fromJson(pm10));
      // }

      /*코드팩토리 방식*/
      pm10s_ = responseBody.map((pm10) => Pm10.fromJson(pm10)).toList().reversed.toList();

      // debugSomething(pm10s_);
      return pm10s_;
    }
    throw Error();
  }

/*POST 요청*/
// void postMoviesAsList() async {
//   var dio = Dio();
//   final Uri uri = Uri.parse('$baseUrl?serviceKey=$serviceKey&$etcApiSetting');
//   var response = await dio.post('<https://jsonplaceholder.typicode.com/posts>', data: {'title': 'foo', 'body': 'foofoo', 'userId': '1'});
//   print(response.statusCode);
// }
}













class Pm25 {
  final String daegu;
  final String chungnam;
  final String incheon;
  final String daejeon;
  final String gyeongbuk;
  final String sejong;
  final String gwangju;
  final String jeonbuk;
  final String gangwon;
  final String ulsan;
  final String jeonnam;
  final String seoul;
  final String busan;
  final String jeju;
  final String chungbuk;
  final String gyeongnam;
  String dataTime;
  final String dataGubun;
  final String gyeonggi;
  final String itemCode;

  Pm25.fromJson(Map<String, dynamic> json)
      : daegu = json['daegu'] ?? "-9999",
        chungnam = json['chungnam'] ?? "-9999",
        incheon = json['incheon'] ?? "-9999",
        daejeon = json['daejeon'] ?? "-9999",
        gyeongbuk = json['gyeongbuk'] ?? "-9999",
        sejong = json['sejong'] ?? "-9999",
        gwangju = json['gwangju'] ?? "-9999",
        jeonbuk = json['jeonbuk'] ?? "-9999",
        gangwon = json['gangwon'] ?? "-9999",
        ulsan = json['ulsan'] ?? "-9999",
        jeonnam = json['jeonnam'] ?? "-9999",
        seoul = json['seoul'] ?? "-9999",
        busan = json['busan'] ?? "-9999",
        jeju = json['jeju'] ?? "-9999",
        chungbuk = json['chungbuk'] ?? "-9999",
        gyeongnam = json['gyeongnam'] ?? "-9999",
        dataTime = json['dataTime'] ?? "-9999",
        dataGubun = json['dataGubun'] ?? "-9999",
        gyeonggi = json['gyeonggi'] ?? "-9999",
        itemCode = json['itemCode'] ?? "-9999";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['daegu'] = daegu;
    json['chungnam'] = chungnam;
    json['incheon'] = incheon;
    json['daejeon'] = daejeon;
    json['gyeongbuk'] = gyeongbuk;
    json['sejong'] = sejong;
    json['gwangju'] = gwangju;
    json['jeonbuk'] = jeonbuk;
    json['gangwon'] = gangwon;
    json['ulsan'] = ulsan;
    json['jeonnam'] = jeonnam;
    json['seoul'] = seoul;
    json['busan'] = busan;
    json['jeju'] = jeju;
    json['chungbuk'] = chungbuk;
    json['gyeongnam'] = gyeongnam;
    json['dataTime'] = dataTime;
    json['dataGubun'] = dataGubun;
    json['gyeonggi'] = gyeonggi;
    json['itemCode'] = itemCode;
    return json;
  }
}

class Pm25ApiService {
  static const String baseUrl = "https://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst";
  static String serviceKey = SecurityHelper.pm10ApiKey;
  static const String etcApiSetting = ""
      "&returnType=json"
      "&numOfRows=30"
      "&pageNo=1"
      "&itemCode=PM25"
      "&dataGubun=HOUR"
      "&searchCondition=WEEK";

  /*GET 요청*/
  static Future<List<Pm25>> getPm25s() async {
    final Uri uri = Uri.parse('$baseUrl?serviceKey=$serviceKey$etcApiSetting');
    var dio = Dio();
    var response = await dio.getUri(uri);
    // debugSomething(response.data);
    List<Pm25> pm25s_ = [];
    debugSomething(response.statusCode, troubleShootingId: "202308050214 ${Platform.script.toString()}");
    if (response.statusCode == 200) {
      // debugSomething(response.data );
      final List<dynamic> responseBody = response.data["response"]["body"]["items"];
      // debugSomething(responseBody, troubleShootingId: "202308050216");


      pm25s_ = responseBody.map((pm25) => Pm25.fromJson(pm25)).toList().reversed.toList();


      return pm25s_;
    }
    throw Error();
  }

}

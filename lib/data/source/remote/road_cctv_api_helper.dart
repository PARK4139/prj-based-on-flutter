import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:xml2json/xml2json.dart';

import '../../../utils/security_helper.dart';
import '../../../utils/super_helper.dart';
import "dart:math" show pi;
import "dart:math";

class RoadCctv {
  final String roadsectionid; //도로 구간 ID
  final String coordx; //경도 좌표
  final String coordy; //위도 좌표
  // final String coordtype; //좌표타입        //.... 실제 데이터 받은 것을 확인해보니 return 된 데이터 자체가 없었음...
  final String cctvresolution; //CCTV 해상도
  final String filecreatetime; //파일 생성 시간(YYYYMMDDHH24MISS)
  final String cctvtype; //CCTV 유형(1: 실시간 스트리밍(HLS) / 2: 동영상 파일 / 3: 정지 영상)
  final String cctvformat; //CCTV 형식
  final String cctvname; //CCTV 설치 장소명
  final String cctvurl; //CCTV 영상 주소
  // final int datacount; //CCTV 개수        //.... 실제 데이터 받은 것을 확인해보니 return 된 데이터 자체가 없었음...

  // String dataTime;
  // String dataGubun;
  // String itemCode;



  RoadCctv.fromJson(Map<String, dynamic> json)
      :
        // coordtype = json['coordtype'] ?? "-9999",
        // datacount = json['datacount'] ?? -9999,
        roadsectionid = json['roadsectionid'] ?? "-9999",
        filecreatetime = json['filecreatetime'] ?? "-9999",
        cctvtype = json['cctvtype'] ?? "-9999",
        cctvurl = json['cctvurl'] ?? "-9999",
        cctvresolution = json['cctvresolution'] ?? "-9999",
        coordx = json['coordx'] ?? "-9999",
        coordy = json['coordy'] ?? "-9999",
        cctvformat = json['cctvformat'] ?? "-9999",
        cctvname = json['cctvname'] ?? "-9999";
        // dataTime = json['dataTime'] ?? "-9999",
        // dataGubun = json['dataGubun'] ?? "-9999",
        // itemCode = json['itemCode'] ?? "-9999";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    // json['coordtype'] = coordtype;
    // json['datacount'] = datacount;
    json['roadsectionid'] = roadsectionid;
    json['filecreatetime'] = filecreatetime;
    json['cctvtype'] = cctvtype;
    json['cctvurl'] = cctvurl;
    json['cctvresolution'] = cctvresolution;
    json['coordx'] = coordx;
    json['coordy'] = coordy;
    json['cctvformat'] = cctvformat;
    json['cctvname'] = cctvname;
    // json['dataTime'] = dataGubun;
    // json['dataGubun'] = dataTime;
    // json['itemCode'] = itemCode;
    return json;
  }

  String getId() => cctvname + cctvurl;
}

class RoadCctvApiService {
  /*GET 요청*/
  static Future<List<RoadCctv>> getRoadCctvs() async {
    const String baseUrl = "https://openapi.its.go.kr:9443/cctvInfo";

    determineUserLocationUsingPermission();

    var deviceCurrentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // debugSomething(SecurityHelper.cctvApiKey, troubleShootingId: "202308221536");
    String queryUrl = ''
        '?apiKey=${SecurityHelper.cctvApiKey}'
        '&type=ex' //도로 유형(ex: 고속도로 / its: 국도)
        '&cctvType=1' //CCTV 유형(1: 실시간 스트리밍(HLS) / 2: 동영상 파일 / 3: 정지 영상)
        '&minX=127.100000' // x : 경도
        '&maxX=128.890000'
        '&minY=34.100000' // y : 위도
        '&maxY=39.100000'
        '&minX=${127}' // x : 경도
        '&maxX=${128}'
        '&minY=${34}' // y : 위도
        '&maxY=${39}'
        // '&minX=${deviceCurrentPosition.longitude+0.8}' // x : 경도
        // '&maxX=${deviceCurrentPosition.longitude-0.8}'
        // '&minY=${deviceCurrentPosition.latitude+2.5}' // y : 위도
        // '&maxY=${deviceCurrentPosition.latitude-2.5}'
        // '&getType=xml'; //xml, json    대세는 json 이고 지원도 되지만 xml 처리를 연습해 보자
        '&getType=json';
    final String requestUrl = '$baseUrl$queryUrl';
    debugSomething(requestUrl, troubleShootingId: "202308221536");

    final Uri uri = Uri.parse(requestUrl);
    var dio = Dio();
    var response = await dio.getUri(uri);
    List<RoadCctv> roadCctvs_ = [];
    debugSomething(response.statusCode, troubleShootingId: "20230822031637");
    if (response.statusCode == 200) {
      // debugSomething(response.data, troubleShootingId: "20230822031642");
      // debugSomething(response.data["response"], troubleShootingId: "20230822031643");
      //  debugSomething(response.data["response"]["data"], troubleShootingId: "20230822031643");
       debugSomething(response.data["response"]["data"][0], troubleShootingId: "20230822031643");



      // xml
      // final xml = response.data;
      // debugSomething('xml:$xml', troubleShootingId: "20230822031643");

      //List<dynamic>
      // final Xml2Json xml2json = Xml2Json()..parse(xml);
      // debugSomething('xml2json:$xml2json', troubleShootingId: "20230822031644");
      // final string = xml2json.toParker();
      // // debugSomething(jsonDecode(string), troubleShootingId: "20230822031711");
      // // debugSomething(jsonDecode(string)["response"], troubleShootingId: "20230822031637");
      // debugSomething(jsonDecode(string)["response"]["data"], troubleShootingId: "20230822031637");
      // debugSomething(string, troubleShootingId: "20230822031640");
      // final List<dynamic> responseBody = jsonDecode(string)["response"]["data"];
      // debugSomething(responseBody, troubleShootingId: "20230822031638");


      //json
      // List<dynamic>
      // final List<dynamic> responseBody = response.data["response"]["data"];
      final List<dynamic> responseBody = response.data["response"];
      // debugSomething(responseBody, troubleShootingId: "20230822031638");
      // debugSomething(responseBody[0], troubleShootingId: "20230822031638");
      // debugSomething(responseBody[0]["cctvurl"], troubleShootingId: "20230822031638");
      // roadCctvs_= [RoadCctv.fromJson(responseBody[0])];
      // debugSomething(roadCctvs_, troubleShootingId: "202308221746");



       // android plug in 을 통해서 직렬화 재시도해보자...



      // List<RoacCctv>
      roadCctvs_ = responseBody.map((roadCctv) => RoadCctv.fromJson(roadCctv)).toList().reversed.toList();
      debugSomething(roadCctvs_, troubleShootingId: "202308221746");
      // debugSomething(roadCctvs_[0].cctvurl, troubleShootingId: "202308221746");
      return roadCctvs_;
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

convertCoordinatesFromEpsg4326ToEpsg3857(double lon, double lat) {
  var x = (lon * 20037508.34) / 180;
  var y = log(tan(((90 + lat) * pi) / 360)) / (pi / 180);
  y = (y * 20037508.34) / 180;
  return [x, y];
}

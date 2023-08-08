import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../utils/security_helper.dart';
import '../../../utils/super_helper.dart';


class ApiDto {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final String ipoDate;
  final String delistingDate;
  final String status;

  ApiDto.fromJson(Map<String, dynamic> json)
      : symbol = json['daegu'] ?? "-9999",
        name = json['chungnam'] ?? "-9999",
        exchange = json['incheon'] ?? "-9999",
        assetType = json['daejeon'] ?? "-9999",
        ipoDate = json['gyeongbuk'] ?? "-9999",
        delistingDate = json['sejong'] ?? "-9999",
        status = json['gwangju'] ?? "-9999";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['symbol'] = symbol;
    json['name'] = name;
    json['exchange'] = exchange;
    json['assetType'] = assetType;
    json['ipoDate'] = ipoDate;
    json['delistingDate'] = delistingDate;
    json['status'] = status;
    return json;
  }
}

class ApiDtoServiceHelper {
  static const String baseUrl = "https://www.alphavantage.co/query?function=LISTING_STATUS";
  static String apiKey = SecurityHelper.americanStockMarketListingDelistingApiServiceServiceKeyDecoded;
  static String requiredApiSetting = "$baseUrl&apikey=${apiKey}";
  static const String optionalApiSetting = ""
      "&date=2010-01-02"
      "&state=active"
  // "&state=delisted"
      "";
  static String assembledApiUrl = '$requiredApiSetting$optionalApiSetting';

  /*GET 요청*/
  static Future<List<ApiDto>> getApiDtos() async {
    final Uri uri = Uri.parse(assembledApiUrl);
    var dio = Dio();
    var response = await dio.getUri(uri); // 동기처리로 url로 요청을 보내고 결과를 받아온다.
    // debugSomething(response.data);
    List<ApiDto> americanStockMarketListingDelistings_ = [];
    debugSomething(response.statusCode, troubleShootingId: "202308050149");
    if (response.statusCode == 200) {
      // debugSomething(response.data );
      final List<dynamic> responseBody = response.data["response"]["body"]["items"];
      // debugSomething(responseBody);

      /*노마드코더 방식*/
      // for (Map<String, dynamic> americanStockMarketListingDelisting in responseBody) {
      //   // debugSomething(americanStockMarketListingDelisting);
      //   // debugSomething(americanStockMarketListingDelisting["daegu"]);
      //   americanStockMarketListingDelistings_.add(ApiDto.fromJson(americanStockMarketListingDelisting));
      // }

      /*코드팩토리 방식*/
      americanStockMarketListingDelistings_ = responseBody.map((americanStockMarketListingDelisting) => ApiDto.fromJson(americanStockMarketListingDelisting)).toList().reversed.toList();

      // debugSomething(americanStockMarketListingDelistings_);
      return americanStockMarketListingDelistings_;
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

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../utils/security_helper.dart';
import '../../../utils/super_helper.dart';

class AmericanStockMarketListingDelistingApiDto {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final String ipoDate;
  final String delistingDate;
  final String status;

  AmericanStockMarketListingDelistingApiDto.fromCsv(String csv)
      : symbol = csv.split(",")[0],
        name = csv.split(",")[1],
        exchange = csv.split(",")[2],
        assetType = csv.split(",")[3],
        ipoDate = csv.split(",")[4],
        delistingDate = csv.split(",")[5],
        status = csv.split(",")[6];

  String toCsv() {
    String csv = "";
    csv.split(",")[0] = symbol;
    csv.split(",")[1] = name;
    csv.split(",")[2] = exchange;
    csv.split(",")[3] = assetType;
    csv.split(",")[4] = ipoDate;
    csv.split(",")[5] = delistingDate;
    csv.split(",")[6] = status;
    return csv;
  }

  AmericanStockMarketListingDelistingApiDto.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'] ?? "-9999",
        name = json['name'] ?? "-9999",
        exchange = json['exchange'] ?? "-9999",
        assetType = json['assetType'] ?? "-9999",
        ipoDate = json['ipoDate'] ?? "-9999",
        delistingDate = json['delistingDate'] ?? "-9999",
        status = json['status'] ?? "-9999";

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

class AmericanStockMarketListingDelistingApiDtoServiceHelper {
  static const String baseUrl = "https://www.alphavantage.co/query?";
  static String apiKey = SecurityHelper.americanStockMarketListingDelistingApiServiceServiceKeyDecoded;
  static String funtion = "LISTING_STATUS";
  static String requiredApiSetting = "$baseUrl"
      "function=$funtion"
      "&apikey=${apiKey}";
  static const String optionalApiSetting = ""
      // "&date=2010-01-02"
      "&date=2023-08-07"
      "&state=active"
      // "&state=delisted"
      "";
  static String assembledApiUrl = '$requiredApiSetting$optionalApiSetting';

  /*GET 요청*/
  static Future<List<AmericanStockMarketListingDelistingApiDto>> getAmericanStockMarketListingDelistingApiDtos() async {
    // debugSomething(assembledApiUrl,troubleShootingId: "assembledApiUrl202308071738");
    final Uri uri = Uri.parse(assembledApiUrl);
    var dio = Dio();
    var response = await dio.getUri(uri);
    // debugSomething(response.data);
    // debugSomething(response.data.runtimeType);

    List<AmericanStockMarketListingDelistingApiDto> americanStockMarketListingDelistingApiDtos_ = [];
    debugSomething(response.statusCode, troubleShootingId: "response.statusCode20230807085533");
    if (response.statusCode == 200) {
      // debugSomething(response.data.split("\n"), troubleShootingId: "mkr");
      // debugSomething(response.data.split("\n")[1].split(",")[0], troubleShootingId: "mkr");
      // debugSomething(response.data.toString().trim().split("\n").map((e) => AmericanStockMarketListingDelistingApiDto.fromCsv(e)).toList(), troubleShootingId: "0118");
      // debugSomething(response.data.toString().trim().split("\n").map((e) => AmericanStockMarketListingDelistingApiDto.fromCsv(e)).toList()[0].name, troubleShootingId: "0118");
      // debugSomething(response.data.toString().trim().split("\n").map((e) => AmericanStockMarketListingDelistingApiDto.fromCsv(e)).toList()[1].name, troubleShootingId: "0118");
      americanStockMarketListingDelistingApiDtos_ = response.data.toString().trim().split("\n").map((e) => AmericanStockMarketListingDelistingApiDto.fromCsv(e)).toList();
      // debugSomething(americanStockMarketListingDelistingApiDtos_);
      return americanStockMarketListingDelistingApiDtos_;
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

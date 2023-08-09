import 'dart:async';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';

import '../../../utils/security_helper.dart';
import '../../../utils/super_helper.dart';

class AmericanStockMarketListingDelistingApiDto {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final String ipoDate;
  /*IPODate는 Initial Public Offering Date의 약자로, 기업이 처음으로 주식을 공개적으로 발행하여 일반 투자자들에게 매각하는 날짜를 의미합니다.*/
  // ipoDate 화면시현 기능 불필요.
  final String delistingDate;
  // delistingDate 화면시현 기능 불필요.
  final String status;

  /*csv 라이브러리 없이 데이터직렬화 처리*/
  // AmericanStockMarketListingDelistingApiDto.fromCsv(String csv)
  //     : symbol = csv.split(",")[0],
  //       name = csv.split(",")[1],
  //       exchange = csv.split(",")[2],
  //       assetType = csv.split(",")[3],
  //       ipoDate = csv.split(",")[4],
  //       delistingDate = csv.split(",")[5],
  //       status = csv.split(",")[6];

  /*csv 라이브러리 없이 데이터역직렬화 처리*/
  // String toCsv() {
  //   String csv = "";
  //   csv.split(",")[0] = symbol;
  //   csv.split(",")[1] = name;
  //   csv.split(",")[2] = exchange;
  //   csv.split(",")[3] = assetType;
  //   csv.split(",")[4] = ipoDate;
  //   csv.split(",")[5] = delistingDate;
  //   csv.split(",")[6] = status;
  //   return csv;
  // }

  /*csv 라이브러리 통한 데이터직렬화 처리*/
  AmericanStockMarketListingDelistingApiDto.fromCsv(List<dynamic> csvRow)
      : symbol = csvRow[0]??"null20230809123100000", // "null20230809123100000" 로 처리했지만. 고객 요구사항에 때라 "" 로 처리하는 것이 나은것 같다.
        name = csvRow[1]??"null20230809123100000",
        exchange = csvRow[2]??"null20230809123100000",
        assetType = csvRow[3]??"null20230809123100000",
        ipoDate = csvRow[4]??"null20230809123100000",
        delistingDate = csvRow[5]??"null20230809123100000",
        status = csvRow[6]??"null20230809123100000";


  AmericanStockMarketListingDelistingApiDto.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'] ?? "null20230809123100000",
        name = json['name'] ?? "null20230809123100000",
        exchange = json['exchange'] ?? "null20230809123100000",
        assetType = json['assetType'] ?? "null20230809123100000",
        ipoDate = json['ipoDate'] ?? "null20230809123100000",
        delistingDate = json['delistingDate'] ?? "null20230809123100000",
        status = json['status'] ?? "null20230809123100000";

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

      /*csv 라이브러리 없이 데이터직렬화 처리*/
      // americanStockMarketListingDelistingApiDtos_ = response.data.toString().trim().split("\n").map((e) => AmericanStockMarketListingDelistingApiDto.fromCsv(e)).toList();

      /*csv 라이브러리 통한 데이터직렬화 처리*/
      // CsvToListConverter().convert(response.data.toString());
      List <List<dynamic>> convetedCsv = CsvToListConverter().convert(response.data);
      convetedCsv.removeAt(0);//데이터의 첫행이 table header 가 들어간 경우 삭제처리.
      americanStockMarketListingDelistingApiDtos_ = convetedCsv.map((csvLow) => AmericanStockMarketListingDelistingApiDto.fromCsv(csvLow)).toList();



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

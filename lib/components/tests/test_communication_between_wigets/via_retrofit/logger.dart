import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'communication_helper.dart';

final logger = Logger();

void main(List<String> args) {
  
  final dio = Dio();
  dio.options.headers["Demo-Header"] = "demo header"; // config your dio headers globally
  final client = RestClient(dio);

  client.getTasksToDo().then((it) => logger.i(it)).catchError((Object obj) {
    // non-200 http state goes here.
    switch (obj.runtimeType) {
      case DioException:
        final res = (obj as DioException).response;
        logger.e("http state 묘사  : ${res!.statusCode} -> ${res.statusMessage}");
        break;
      default:
        break;
    }
  });
}

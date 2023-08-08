import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';

import '../data/source/remote/carrot_markket_api_helper.dart';
import 'hardcoding_stamp_maker.dart';

enum Job { paladin, worrior, magitian }

enum StudyLevel { begginer, intermediate, advanced }

enum ProgrammingProficiencyLevel { begginer, intermediate, pro }

class IteralbleNatureNumbersMaker {
  List<int> itemsHistory = [];
  List<int> itemsCurrent = [];
  int index = 1;

  IteralbleNatureNumbersMaker({required int endLimit}) {
    while (index != endLimit + 1) {
      itemsCurrent.add(index);
      itemsHistory.add(index);
      index++;
    }
  }

  // void push(int item) {
  //   items.add(item);
  // }
  //
  // int pop() {
  //   return items.removeLast();
  // }
  //
  // bool isEmpty() {
  //   return items.isEmpty;
  // }
  //
  // int get size {
  //   return items.length;
  // }

  int first() => itemsHistory.first;

  int last() => itemsHistory.last;

  int next() {
    var firstThing = itemsCurrent.first;
    itemsCurrent.removeAt(0);
    return firstThing;
  }

  List<int> all() => itemsCurrent;

  List<int> allHistory() => itemsHistory;
}

class IterableAlphabetsMaker {
  final List<String> alpabetsSnapshotAtFirstInitialization = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  late List<String> alpabets;
  late int length;

  IterableAlphabetsMaker() {
    reload();
    length = alpabetsSnapshotAtFirstInitialization.length;
  }

  // void push(int item) {
  //   items.add(item);
  // }
  //
  // String pop() {
  //   return items.removeLast();
  // }
  //
  // bool isEmpty() {
  //   return items.isEmpty;
  // }
  //
  // String get size {
  //   return items.length;
  // }

  String first() => alpabets.first;

  String last() => alpabets.last;

  String next() {
    var firstThing = alpabets.first;
    alpabets.removeAt(0);
    return firstThing;
  }

  List<String> currentAlphabets() => alpabets;

  List<String> alphabetSnapshotAtFirstInitialization() => alpabetsSnapshotAtFirstInitialization;

  void reload() {
    alpabets = alpabetsSnapshotAtFirstInitialization;
  }
}

void printWithoutError(var txt) {
  /*배포 시 : Don't invoke 'print' in production code. 에러 제거를 위해 내부 주석처리*/
  print(txt.toString());
}

void debugSomething(dynamic something, {String troubleShootingId = "Not Assigned"}) {
  /*배포 시 내부 주석처리*/
  if (something == null) {
    printWithoutError("__________________________________________________________________________________________________________________________ debug s");
    printWithoutError("troubleShootingId : $troubleShootingId");
    printWithoutError("data type : null");

    printWithoutError("__________________________________________________________________________________________________________________________ debug e");
  } else if (something is bool) {
    printWithoutError("__________________________________________________________________________________________________________________________ debug s");
    printWithoutError("troubleShootingId : $troubleShootingId");
    printWithoutError("data type : ${something.runtimeType}");
    printWithoutError(something.toString());

    printWithoutError("__________________________________________________________________________________________________________________________ debug e");
  } else if (something is String) {
    printWithoutError("__________________________________________________________________________________________________________________________ debug s");
    printWithoutError("troubleShootingId : $troubleShootingId");
    printWithoutError("data type : ${something.runtimeType}");
    printWithoutError(something.toString());

    printWithoutError("__________________________________________________________________________________________________________________________ debug e");
  } else if (something is List<dynamic>) {
    printWithoutError("__________________________________________________________________________________________________________________________ debug s");
    printWithoutError("troubleShootingId : $troubleShootingId");
    printWithoutError("data type : ${something.runtimeType}");
    for (dynamic item in something) {
      printWithoutError(item.toString());
    }

    printWithoutError("__________________________________________________________________________________________________________________________ debug e");
  } else if (something is int) {
    printWithoutError("__________________________________________________________________________________________________________________________ debug s");
    printWithoutError("troubleShootingId : $troubleShootingId");
    printWithoutError("data type : ${something.runtimeType}");
    printWithoutError(something.toString());

    printWithoutError("__________________________________________________________________________________________________________________________ debug e");
  } else if (something is Set<dynamic>) {
    printWithoutError("__________________________________________________________________________________________________________________________ debug s");
    printWithoutError("troubleShootingId : $troubleShootingId");
    printWithoutError("data type : ${something.runtimeType}");
    for (dynamic element in something) {
      printWithoutError(element);
    }

    printWithoutError("__________________________________________________________________________________________________________________________ debug e");
    // } else if (something is Map<String, Map<String, dynamic>>) {
    //   printWithoutErrorOrPrintWithError("__________________________________________________________________________________________________________________________ debug s");
    //   printWithoutErrorOrPrintWithError("data type : ${something.runtimeType}");
    //   for (var key in something.keys) {
    //     printWithoutErrorOrPrintWithError("$key: ${something[key]}");
    //   }
    //   printWithoutErrorOrPrintWithError("__________________________________________________________________________________________________________________________ debug e");
  } else if (something is Map<String, dynamic>) {
    printWithoutError("__________________________________________________________________________________________________________________________ debug s");
    if (something is Map<String, Map<String, dynamic>>) {
      printWithoutError("troubleShootingId : $troubleShootingId");
      printWithoutError("data type : ${something.runtimeType}");
      for (var key in something.keys) {
        printWithoutError("$key: {");
        debugSomethingWithoutMent(something[key]);
        String properIndentation = "";
        for (int i = 0; i <= key.toString().length + 1; i++) {
          properIndentation = "$properIndentation ";
        }
        printWithoutError("$properIndentation{");
      }
    } else {
      printWithoutError("troubleShootingId : $troubleShootingId");
      printWithoutError("data type : ${something.runtimeType}");
      for (var key in something.keys) {
        printWithoutError("$key: ${something[key]}");
      }
    }

    printWithoutError("__________________________________________________________________________________________________________________________ debug e");
  } else {
    printWithoutError("__________________________________________________________________________________________________________________________ debugDynamic exception s");
    printWithoutError("troubleShootingId : $troubleShootingId");
    printWithoutError("data type : ${something.runtimeType}");
    // for (var key in something.keys) {
    //   printWithoutErrorOrPrintWithError(key);
    // }
    // something.forEach((key, value) {
    //   printWithoutErrorOrPrintWithError("$key: $value");
    // });
    for (var entry in something.entries) {
      printWithoutError("$entry.key: $entry.value");
    }

    printWithoutError("__________________________________________________________________________________________________________________________ debugDynamic exception e");
  }
}

void debugSomethingWithoutMent(dynamic something, {String troubleShootingId = "Not Assigned"}) {
  /*배포 시 성능을 위해 해당메소드 내부 주석처리*/
  if (something == null) {
    printWithoutError("__________________________________________________________________________________________________________________________ debug s");

    printWithoutError("troubleShootingId : $troubleShootingId");
    printWithoutError("data type : null");
    printWithoutError("__________________________________________________________________________________________________________________________ debug e");
  } else if (something is String) {
    printWithoutError(something.toString());
  } else if (something is List<dynamic>) {
    for (dynamic item in something) {
      printWithoutError(item.toString());
    }
  } else if (something is int) {
    printWithoutError(something.toString());
  } else if (something is Set<dynamic>) {
    for (dynamic element in something) {
      printWithoutError(element);
    }
  } else if (something is Map<String, Map<String, dynamic>>) {
    for (var key in something.keys) {
      printWithoutError("$key: ${something[key]}");
    }
  } else if (something is Map<String, dynamic>) {
    if (something is Map<String, Map<String, dynamic>>) {
      for (var key in something.keys) {
        printWithoutError("$key: {");
        debugSomethingWithoutMent(something[key]);
        String properIndentation = "";
        for (int i = 0; i <= key.toString().length + 1; i++) {
          properIndentation = "$properIndentation ";
        }
        printWithoutError("$properIndentation{");
      }
    } else {
      for (var key in something.keys) {
        printWithoutError("        $key: ${something[key]}");
      }
    }
  } else {
    printWithoutError("__________________________________________________________________________________________________________________________ debugDynamic exception s");
    printWithoutError("troubleShootingId : $troubleShootingId");
    printWithoutError("data type : ${something.runtimeType}");
    printWithoutError("__________________________________________________________________________________________________________________________ debugDynamic exception e");
  }
}

void debugSomethingSimple(String string) {
  printSeparatorWithMkr();
  printWithoutError(string);
  printSeparatorWithMkr();
}

void printSeparatorWithMkr({String txt = ''}) => printWithoutError("__________________________________________________________________________________________________________________________ $txt mkr");

void printSeperatorWithoutMkr({String txt = ''}) => printWithoutError("__________________________________________________________________________________________________________________________ $txt ");

void printSeperatorWithS({String txt = ''}) => printWithoutError("__________________________________________________________________________________________________________________________ $txt s");

void printSeperatorWithE({String txt = ''}) => printWithoutError("__________________________________________________________________________________________________________________________ $txt e");

String textCuttingHelper(String text, {int cuttingPosition = 10}) {
  String result = '';
  if (text.length >= cuttingPosition) {
    result = "${text.substring(0, 9)}...";
  } else {
    result = text;
  }
  return result;
}

String timeFormattingHelper(int seconds) {
  var duration = Duration(seconds: seconds); // duration.toString()  ==  '0:00:02.000000'
  if (duration.toString().split(".").first.split(":").first == '0') {
    return duration.toString().split(".").first.substring(2, 7);
  } else {
    return duration.toString().split(".").first; //PRODUCTION
  }
}

class MyIcons {
  static Icon icon_1 = const Icon(Icons.adb, color: Colors.red);
  static Icon icon_2 = const Icon(Icons.check_box, color: Colors.red);
  static Icon icon_3 = const Icon(Icons.checklist_outlined, color: Colors.red);
  static Icon icon_4 = const Icon(Icons.checklist_rtl, color: Colors.red);
  static Icon icon_5 = const Icon(Icons.check, color: Colors.red);
  static Icon icon_6 = const Icon(Icons.fact_check, color: Colors.red);
  static Icon icon_7 = const Icon(Icons.library_add_check_outlined, color: Colors.red);
  static Icon icon_8 = const Icon(Icons.adb);
  static Icon icon_9 = const Icon(Icons.all_inclusive);
  static Icon icon_10 = const Icon(Icons.add_reaction);
  static Icon icon_11 = const Icon(Icons.add_reaction);
  static Icon icon_12 = const Icon(Icons.airplay);
  static Icon icon_13 = const Icon(Icons.animation);
  static Icon icon_14 = const Icon(Icons.announcement_rounded);
  static Icon icon_15 = const Icon(Icons.radio_button_on);
  static Icon icon_16 = const Icon(Icons.radio_button_off);
  static Icon icon_17 = const Icon(Icons.arrow_drop_down);
  static Icon icon_18 = const Icon(Icons.arrow_downward);
  static Icon icon_23 = const Icon(Icons.dark_mode);
  static Icon icon_19 = const Icon(Icons.laptop_windows);
  static Icon icon_20 = const Icon(Icons.laptop_mac);
  static Icon icon_21 = const Icon(Icons.monitor_heart);
  static Icon icon_22 = const Icon(Icons.favorite);
  static Icon icon_24 = const Icon(Icons.set_meal_outlined);
  static Icon icon_25 = const Icon(Icons.settings_ethernet);
}

class MyColors {
  static Color blackUndefined = const Color(0xFF181818);
  static Color blackBackground = Colors.black12;
  static Color blackClear = Colors.black.withOpacity(0.5);
  static Color greyClear = Colors.grey.withOpacity(0.9);
  static Color whiteClear = Colors.white.withOpacity(0.6);
  static Color whilteGeneral = Colors.white;
  static Color redWarning = Colors.red;
  static Color orangeCaution = Colors.orange;

  static const darkGreen2023080622041 = Color(0xff009688);
  static const darkGreen2023080622042 = Color(0xff00675b);
  static const darkGreen2023080622043 = Color(0xff52c7b8);
  static const white2023080622041 = Colors.white;
  static const green2023080622041 = Colors.green;
  static const lightGreenAccent2023080622041 = Colors.lightGreenAccent;
  static const black2023080622041 = Colors.black;
}

class MyTextStyles {
  //리펙토링 진행 예정. 정렬우선순위=[fontSize,fontWeight,color]
  static TextStyle textStyle1 = const TextStyle(fontSize: 18, color: Colors.lightBlueAccent, fontWeight: FontWeight.w900);
  static TextStyle textStyle2 = const TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.w900);
  static TextStyle textStyle3 = const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100);
  static TextStyle textStyle4 = const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100);
  static TextStyle textStyle5 = const TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w100);
  static TextStyle textStyle20230719 = TextStyle(fontSize: 9, color: Colors.grey.shade600, fontWeight: FontWeight.w500);
  static TextStyle textStyle20230722_1842 = textStyle1.copyWith(fontWeight: FontWeight.w900); //copyWith()를 사용하여 파라미터를 overwrite 해서 쓸 수있다.
  static TextStyle textStyle20230722_1841 = const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w300);
  static const TextStyle titleTextStyle202308062043 = TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'sunFlower', fontWeight: FontWeight.w700);
}

class MySeperators {
  static Widget withChildLess({double height = 50}) {
    return SizedBox(height: height);
  }

  static Widget withId({required String positionId}) {
    return SizedBox(
        height: 50,
        child: HardCodingStampMaker(
          txt: positionId,
          color: Colors.grey,
          backgroundColor: Colors.black,
        ));
  }
}

class MySnackBars {
  static SnackBar notReadySnackBar = SnackBar(
    duration: const Duration(seconds: 1),
    content: Text(MyMents.notReadyYet),
  );

  static SnackBar mySnackBar({required String ment, int seconds = 1}) {
    return SnackBar(
      duration: Duration(seconds: seconds),
      content: Text(ment),
      action: SnackBarAction(
        label: MyMents.yes,
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }
}

class MyUris {
  //Uri 여기에 넣자
  Uri testuri = Uri(host: "localhost", port: 9090, path: "/test/test");
}

class MyUrls {
  static String documentOfFlutterOfficial = 'https://flutter.dev';
  static String libraryOfFlutterOfficial = 'https://pub.dev';
  static String myGithub = 'https://github.com/PARK4139';
  static String naver = 'https://m.naver.com/'; //일반주소 안되면 모바일 주소로 시도해보자
  static String naverWeather = 'https://weather.naver.com/';
  static String google = 'https://www.google.com/';
  static String youtube = 'https://www.youtube.com/';
  static String networkImageTest = 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif';
  static String errorImageTest = 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif';
}

class MyMents {
  static String notReadyYet = '해당 기능은 아직 준비되지 않은 서비스입니다.\n다음에 만나요!';
  static String inTesting = '테스트 중 입니다.';
  static String inPop = '이전화면으로 이동합니다.';
  static String yes = '네';
  static String no = '아니요';
  static String sorry = '죄송합니다.';
  static String helloWorld="Hello World";
  static String hello = "안녕하세요! 반갑습니다!";

  static String occuredError = "에러가 발생했습니다";

  static String descriptionAboutPomodoroService = '해당 스크린에서는 pomodoro를 서비스를 제공합니다 \n\n'
      '＊"pomodoro" : 포모도로 기법은 프란체스코 시릴로가 고안한 시간 관리 기법입니다.\n 25분 동안 집중해서 일을 한 다음 5분간 휴식을 취하는 것을 반복하는 방식입니다.\n 이 기법은 25분을 토마토 모양의 요리용 타이머로 측정한 데서 이름이 유래했습니다.\n 포모도로 기법은 집중력 향상과 생산성 향상에 도움이 될 수 있습니다.';

  static String descriptionAboutScreenDeveloperHelper = '해당 스크린에서는 개발하는데 도움이 되는 기능들을 제공해주는 서비스를 제공합니다 \n';

  static String referToConsoleLog = '콘솔에서 출력되는 데이터를 비교하세요';

  static String thisAppServeCurrentTime = '해당 스크린에서는 오늘 날짜와 현재 시간을 제공하는 서비스를 제공합니다.';

  static String descriptionAboutAreaCalculatingService = '평형 계산기는 *"평" 과 ㎡(제곱미터) 간 단위변환 한 결과를 제공해주는 서비스를 제공합니다 \n\n'
      '＊"평" : 한국에서 사용하는 집의 면적에 대한 단위입니다.\n               해당 단위는 점차 ㎡ 로 대체되고 있습니다.';

  static String inLoading({String title = "해당기능"}) => "$title 을(를) 로딩 중입니다";
}

class MySuperHelpers {
  late bool isCounterZero;

  void pause() {
    exit(0); //이 코드는 앱을 종료하고 시스템으로 돌아갑니다.
    SystemNavigator.pop(); //이 코드는 앱을 백그라운드에서 종료하고 시스템으로 돌아갑니다.
  }

  // MyTool() {
  // var logger = Logger();
  // var logger = Logger(printer: PrettyPrinter());
  // var loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0));
  // logger.d("Logger is working!");
  // logger.d('Log message with 2 methods');
  // loggerNoStack.i('Info message');
  // loggerNoStack.w('Just a warning!');
  // logger.e('Error! Something bad happened', 'Test Error');
  // loggerNoStack.v({'key': 5, 'value': 'something'});
  // Logger(printer: SimplePrinter(colors: true)).v('boom');
  // }

  Future<void> downloadMp3File({required String path}) async {
    String url = path;
    debugSomething(url);

    Uri url_ = Uri(
      // Create a URI without encryption.
      scheme: path.split("://").first,
      host: path.split("//").last.split("/").first.split(":").first,
      port: int.parse(path.split("//").last.split("/").first.split(":").last),
      path: 'test.mp3',
      query: '',
    );
    debugSomething(url_.toString());

    // Download the MP3 file.
    Response response = await get(url_);
    debugSomething(response.toString());

    // pause();//DEVELOPMENT

    // Save the MP3 file to the device's storage.
    // File file = File('song.mp3');
    // await file.writeAsBytes(response.bodyBytes);
  }

  Future<void> speak({required String text}) async {
    // // Create an AudioPlayer instance.
    // AudioPlayer player = AudioPlayer();
    //
    // // Download the MP3 file.
    // await player.play('http://172.30.1.31:9090/' + text + '.wav');
    //
    // // Listen for the player's state changes.
    // player.onPlayerStateChanged.listen(
    //   (state) {
    //     print(state);
    //     print(player.state);
    //   },
    // );

// // 오디오 재생을 중지합니다.
//     player.stop();
//
// // 오디오 재생을 일시 중지합니다.
//     player.pause();
//
// // 일시 중지된 오디오 재생을 재개합니다.
//     player.resume();
//
// // 오디오 재생의 재생 위치를 이동합니다.
//     player.seek(1000);
  }

  void processProperly({required String somthing}) {
    if (somthing.split(".").last == 'mp3') {
      // AudioPlayer player = AudioPlayer();
      // player.setVolume(1.0);
      // player.play(somthing);
      //  print(player.getDuration()); //재생 시간
      // print(player.getCurrentPosition()); //남은 시간
    }
    if (somthing.split(".").last == 'wav') {}
    if (somthing.split(".").last == 'jpeg') {}
    if (somthing.split(".").last == 'png') {}
    if (somthing.split(".").last == 'mkv') {}
    if (somthing.split(".").last == 'mp4') {}
  }

  String? _getPlatformInfoUsingDartIo() {
    String? hostPlatform;

    if (kIsWeb) {
      hostPlatform = 'Web';
    } else if (Platform.isAndroid) {
      hostPlatform = 'Android';
    } else if (Platform.isIOS) {
      hostPlatform = 'iOS';
    } else if (Platform.isFuchsia) {
      hostPlatform = 'Fuchsia';
    } else if (Platform.isLinux) {
      hostPlatform = 'Linux';
    } else if (Platform.isWindows) {
      hostPlatform = 'Windows';
    } else if (Platform.isMacOS) {
      hostPlatform = 'macOS';
    }
    return hostPlatform;
  }

  String? _getPlatformInfoUsingFlutterFoundation() {
    String? platform;

    if (kIsWeb) {
      platform = 'Web';
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      platform = 'Android';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      platform = 'iOS';
    } else if (defaultTargetPlatform == TargetPlatform.fuchsia) {
      platform = 'Fuchsia';
    } else if (defaultTargetPlatform == TargetPlatform.linux) {
      platform = 'Linux';
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      platform = 'Windows';
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      platform = 'macOS';
    }

    return platform;
  }

  String? _getPlatformUsingThemeData(BuildContext context) {
    String? platform;

    if (kIsWeb) {
      platform = 'Web';
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      platform = 'Android';
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      platform = 'iOS';
    } else if (Theme.of(context).platform == TargetPlatform.fuchsia) {
      platform = 'Fuchsia';
    } else if (Theme.of(context).platform == TargetPlatform.linux) {
      platform = 'Linux';
    } else if (Theme.of(context).platform == TargetPlatform.windows) {
      platform = 'Windows';
    } else if (Theme.of(context).platform == TargetPlatform.macOS) {
      platform = 'macOS';
    }

    return platform;
  }

  String? _getCurrentOperatingEnvironment() {
    String? currentOperatingEnvironment;

    if (kIsWeb) {
      currentOperatingEnvironment = 'Web';
    } else {
      currentOperatingEnvironment = Platform.operatingSystem;
    }

    return currentOperatingEnvironment;
  }

  Future<void> countdown(int couter) async {
    isCounterZero = false;
    while (true) {
      printWithoutError('$couter 초...');
      sleep(const Duration(seconds: 1));
      couter = couter - 1;
      if (couter == 0) {
        isCounterZero = true;
        break;
      }
    }
  }

  Map<String, dynamic> hostEnvironmentInfo() {
    // final String? platform = _getPlatformInfoUsingDartIo();
    final String? platform = _getPlatformInfoUsingFlutterFoundation();
    // final String? platform = _getPlatformUsingThemeData(context);
    final String? currentOperatingEnvironment = _getCurrentOperatingEnvironment();

    Map<String, dynamic> result = {
      'Platform': platform ?? '-',
      'Operating Environment': currentOperatingEnvironment ?? '-',
    };
    return result;
  }

  //특정 텍스트를 포함한 줄만 추출 해서 결과 반환해주는 기능
  //dart 특정 리스트 문자열의 요소들을 포함하는 리스트 문자열의 요소만 출력
  List<String> getLinesThatContainAboutSpecificTexts({required List<String> origin, required List<String> textsThatIWantToContain}) {
    textsThatIWantToContain.removeWhere((e) => e.isEmpty); // list<String> 에서 공백인 요소 모두 제거
    List<String> textsThatIWantToContain_ = List<String>.from(Set<String>.from(textsThatIWantToContain)); //list<String> 중복인 요소 모두 제거

    var list1 = origin;
    var list2 = textsThatIWantToContain_;
    var thatIWant = list1.where((element) => list2.contains(element));

    List<String> thatIWant_ = thatIWant.toList(); //dart iterable string 에서 list string 으로 변환
    return thatIWant_;
  }

//특정 단어를 포함한 줄 제거해서 결과 반환해주는 기능
  List<String> getLinesThatRemovedAboutSpecificTexts({required List<String> origin, required List<String> textsThatIWantToContain}) {
    textsThatIWantToContain.removeWhere((e) => e.isEmpty); // list<String> 에서 공백인 요소 모두 제거
    List<String> textsThatIWantToContain_ = List<String>.from(Set<String>.from(textsThatIWantToContain)); //list<String> 중복인 요소 모두 제거

    var list1 = origin;
    var list2 = textsThatIWantToContain_;
    var thatIWant = list1.where((element) => !(list2.contains(element)));

    List<String> thatIWant_ = thatIWant.toList(); //dart iterable string 에서 list string 으로 변환
    return thatIWant_;
  }

  /*특정 단어를 포함한 줄만 들여쓰기 하는 기능*/
  List<String> getTextsThatReindetedAtSpecificText({required List<String> origin, required List<String> specificText}) {
    specificText = specificText.toSet().toList();

    List<String> result = [];
    for (String element in origin) {
      if (specificText.contains(element)) {
        result.add(element);
      } else {
        result.add('    $element');
      }
    }
    return result;
  }

  /*테스트*/
  void testListStringHandlingFunctions() {
    printWithoutError('__________________________________________________________________________________________________________________________ text control s');
    List<String> textsOrigin = [
      "!",
      "2",
      "3",
    ];
    List<String> textsToRemove = [
      "2",
    ];
    List<String> textsToReindent = [
      "!",
    ];
    // List<String> texts_to_contain = [
    //   "1",
    // ];

    List<String> resultsRemoved = MySuperHelpers().getLinesThatRemovedAboutSpecificTexts(origin: textsOrigin, textsThatIWantToContain: textsToRemove);
    // print(results_removed.toString());//DEVELOPMENT

    List<String> resultsReindented = MySuperHelpers().getTextsThatReindetedAtSpecificText(origin: resultsRemoved, specificText: textsToReindent);
    // print(results_reindented.toString()); //DEVELOPMENT

    // List<String> results_contained = MyFunctions().get_lines_that_contain_about_specific_texts(origin: results_reindented, texts_that_i_want_to_contain: texts_to_contain);
    // print(results_selected.toString()); //DEVELOPMENT

    //List<String> results_final= results_removed;
    List<String> resultsFinal = resultsReindented;
    // List<String> results_final= results_contained;

    for (String result in resultsFinal) {
      printWithoutError(result); //DEVELOPMENT
    }
    printWithoutError('__________________________________________________________________________________________________________________________ text control e');

    printWithoutError('__________________________________________________________________________________________________________________________ iterable nature number s');
    printWithoutError('naturalNumbers 사용 s');
    var naturalNumbers = IteralbleNatureNumbersMaker(endLimit: 100);
    printWithoutError(naturalNumbers.next());
    printWithoutError(naturalNumbers.next());
    printWithoutError(naturalNumbers.next());
    printWithoutError(naturalNumbers.next());
    printWithoutError(naturalNumbers.next());
    printWithoutError('naturalNumbers 사용 e');
    printWithoutError('__________________________________________________________________________________________________________________________ iterable nature number e');
  }

  Future<void> setMySession() async {
    //set
    // var sessionManager = SessionManager();
    // await sessionManager.set("name", "cool user");
    // await sessionManager.set("id", 3);
    // await sessionManager.set("measure", 23.2);
    // await sessionManager.set("isLoggedIn", true);
    // await sessionManager.set("user", new Data_package_user());

    //set
    User user = User(id: "1", name: "박정훈", dateJoin: DateTime(2023, 06, 05), dateLogin: DateTime(2023, 06, 05));
    /*DEVELOPMENT*/
    // Map<String, dynamic> json = {

    //   'user': user,
    // };
    await SessionManager().set('user', user);

    //set
    User user2 = User(id: "2", name: "박정훈", dateJoin: DateTime(2023, 06, 05), dateLogin: DateTime(2023, 06, 05));
    await SessionManager().set('user', user2);
  }

  Future<void> getMySession(String sessionKey) async {
    //get
    final User user = User.fromJson(await SessionManager().get('user'));
    printWithoutError(user.name); // John Doe
    printWithoutError(user.id); // 30
  }

  Future<void> setMyCookie() async {
    // final dio = Dio();
    // final cookieJar = CookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));
    // await dio.get('https://baidu.com/');
    // // Print cookies
    // print(cookieJar.loadForRequest(Uri.parse('https://baidu.com/')));
    // // second request with the cookie
    // await dio.get('https://baidu.com/');
  }

//줄간격을 일정하게 만들어 주는 기능
//replaceAll 을 활용하면 될듯.
}

class CommonTextData {
  static const String code0000 = "CODE_COMMON";
  static const String code1000 = "CODE_BIZMEKA";
  static const Map<String, dynamic> stamps = {
    "0000": 'CODE_COMMON',
    "0001": '',
    "0100": "CODE_TIME_DATE",
    "1000": 'CODE_BIZMEKA',
    "1001": '비즈메카 일일업무보고로 이동',
    "1002":
        "https://ezgroupware.bizmeka.com/groupware/todo/listMenuStoredTaskView.do?folderId=1263453&folderName=&#37;EC&#37;9D&#37;BC&#37;EC&#37;9D&#37;BC&#37;EC&#37;97&#37;85&#37;EB&#37;AC&#37;B4&#37;EB&#37;B3&#37;B4&#37;EA&#37;B3&#37;A0&#37;EC&#37;84&#37;9C_&#37;EC&#37;86&#37;94&#37;EB&#37;A3&#37;A8&#37;EC&#37;85&#37;98&#37;ED&#37;8C&#37;80",
    "1003": "pjh*****",
    "1004": "s2*******s2@",
    "2000": "CODE_KUL",
    "3000": "CODE_DGI",
    "4000": "CODE_SG",
    "5000": "CODE_GON",
    "6000": "CODE_ITC",
    "7000": "CODE_ID",
    "8000": "CODE_PW",
    "X000": "CODE_Y",
    "00000": "CODE_ETC",
    "시작": "시작",
    "종료": '종료',
  };
}

import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../data/source/remote/carrot_markket_api_helper.dart';
import 'hardcoding_stamp_maker.dart';

enum MyPlatforms {
  web,
  android,
  fuchsia,
  iOS,
  linux,
  macOS,
  windows,
}

class MyRoutes {
  static String indexRoute = "/index-route";
  static String testRoute = "/test-route";
  static String fooRoute = "/foo-route";
  static String mainRoute = "/main-route";
  static String errorRoute = "/error-route";
  static String notReadyYetRoute = "/not-ready-yet-route";
}

enum Job { paladin, worrior, magitian }

enum StudyLevel { begginer, intermediate, advanced }

enum ProgrammingProficiencyLevel { begginer, intermediate, pro }

List<int> naturalNumbersMaker(int min, int max) {
  List<int> naturalNumbers = [];
  for (int i = min; i <= max; i++) {
    naturalNumbers.add(i);
  }
  return naturalNumbers;
}

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

void printWithoutWarning(var txt) {
  /*배포 시 : Don't invoke 'print' in production code. 에러 제거를 위해 내부 주석처리*/
  print(txt.toString());
}

void debugSomething(dynamic something, {String author = "Jung hoon park", String troubleShootingId = "Not Assigned"}) {
  /*배포 시 내부 주석처리*/
  printWithoutWarning("__________________________________________________________________________________________________________________________ debug s");
  // printWithoutWarning("author: $author");
  printWithoutWarning("troubleShootingId: $troubleShootingId");
  if (something == null) {
    printWithoutWarning("data runtimeType: null");
  } else {
    printWithoutWarning("data runtimeType: ${something.runtimeType}");
  }
  if (something == null) {
    printWithoutWarning(something.toString());
  } else if (something is bool) {
    printWithoutWarning(something.toString());
  } else if (something is String) {
    printWithoutWarning(something.toString());
  } else if (something is List<dynamic>) {
    for (dynamic item in something) {
      printWithoutWarning(item.toString());
    }
  } else if (something is int) {
    printWithoutWarning(something.toString());
  } else if (something is Set<dynamic>) {
    for (dynamic element in something) {
      printWithoutWarning(element);
    }

    // } else if (something is Map<String, Map<String, dynamic>>) {

    //   printWithoutErrorOrPrintWithError("data type : ${something.runtimeType}");
    //   for (var key in something.keys) {
    //     printWithoutErrorOrPrintWithError("$key: ${something[key]}");
    //   }
  } else if (something is Map<String, dynamic>) {
    if (something is Map<String, Map<String, dynamic>>) {
      for (var key in something.keys) {
        printWithoutWarning("$key: {");
        debugSomethingWithoutMent(something[key]);
        String properIndentation = "";
        for (int i = 0; i <= key.toString().length + 1; i++) {
          properIndentation = "$properIndentation ";
        }
        printWithoutWarning("$properIndentation{");
      }
    } else {
      printWithoutWarning("troubleShootingId : $troubleShootingId");

      for (var key in something.keys) {
        printWithoutWarning("$key: ${something[key]}");
      }
    }
  } else {
    printWithoutWarning("__________________________________________________________________________________________________________________________ debugSomething exception s");

    // for (var key in something.keys) {
    //   printWithoutErrorOrPrintWithError(key);
    // }
    // something.forEach((key, value) {
    //   printWithoutErrorOrPrintWithError("$key: $value");
    // });
    for (var entry in something.entries) {
      printWithoutWarning("${entry.key}: ${entry.value}");
    }
    printWithoutWarning("__________________________________________________________________________________________________________________________ debugSomething exception e");
  }
  printWithoutWarning("__________________________________________________________________________________________________________________________ debug e");
}

void debugSomethingWithoutMent(dynamic something, {String troubleShootingId = "Not Assigned"}) {
  /*배포 시 성능을 위해 해당메소드 내부 주석처리*/
  if (something == null) {
    printWithoutWarning("__________________________________________________________________________________________________________________________ debug s");

    printWithoutWarning("troubleShootingId : $troubleShootingId");
    printWithoutWarning("data type : null");
    printWithoutWarning("__________________________________________________________________________________________________________________________ debug e");
  } else if (something is String) {
    printWithoutWarning(something.toString());
  } else if (something is List<dynamic>) {
    for (dynamic item in something) {
      printWithoutWarning(item.toString());
    }
  } else if (something is int) {
    printWithoutWarning(something.toString());
  } else if (something is Set<dynamic>) {
    for (dynamic element in something) {
      printWithoutWarning(element);
    }
  } else if (something is Map<String, Map<String, dynamic>>) {
    for (var key in something.keys) {
      printWithoutWarning("$key: ${something[key]}");
    }
  } else if (something is Map<String, dynamic>) {
    if (something is Map<String, Map<String, dynamic>>) {
      for (var key in something.keys) {
        printWithoutWarning("$key: {");
        debugSomethingWithoutMent(something[key]);
        String properIndentation = "";
        for (int i = 0; i <= key.toString().length + 1; i++) {
          properIndentation = "$properIndentation ";
        }
        printWithoutWarning("$properIndentation{");
      }
    } else {
      for (var key in something.keys) {
        printWithoutWarning("        $key: ${something[key]}");
      }
    }
  } else {
    printWithoutWarning("__________________________________________________________________________________________________________________________ debugDynamic exception s");
    printWithoutWarning("troubleShootingId : $troubleShootingId");
    printWithoutWarning("data type : ${something.runtimeType}");
    printWithoutWarning("__________________________________________________________________________________________________________________________ debugDynamic exception e");
  }
}

void debugSomethingSimple(String string) {
  printSeparatorWithMkr();
  printWithoutWarning(string);
  printSeparatorWithMkr();
}

void printSeparatorWithMkr({String txt = ''}) => printWithoutWarning("__________________________________________________________________________________________________________________________ $txt mkr");

void printSeperatorWithoutMkr({String txt = ''}) => printWithoutWarning("__________________________________________________________________________________________________________________________ $txt ");

void printSeperatorWithS({String txt = ''}) => printWithoutWarning("__________________________________________________________________________________________________________________________ $txt s");

void printSeperatorWithE({String txt = ''}) => printWithoutWarning("__________________________________________________________________________________________________________________________ $txt e");

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

class _MyIconData {
  IconData iconData_1 = Icons.adb;
  IconData icon_Data12 = Icons.airplay;
  IconData icon_Data19 = Icons.laptop_windows;
  IconData icon_Data20 = Icons.laptop_mac;
  IconData iconData_2 = Icons.check_box;
  IconData iconData_3 = Icons.checklist_outlined;
  IconData iconData_4 = Icons.checklist_rtl;
  IconData iconData_5 = Icons.check;
  IconData iconData_9 = Icons.all_inclusive;
  IconData iconData_6 = Icons.fact_check;
  IconData iconData_7 = Icons.library_add_check_outlined;
  IconData icon_Data17 = Icons.arrow_drop_down;
  IconData icon_Data18 = Icons.arrow_downward;
  IconData icon_Data23 = Icons.dark_mode;
  IconData icon_Data10 = Icons.add_reaction;
  IconData icon_Data13 = Icons.animation;
  IconData icon_Data14 = Icons.announcement_rounded;
  IconData icon_Data15 = Icons.radio_button_on;
  IconData icon_Data16 = Icons.radio_button_off;
  IconData icon_Data21 = Icons.monitor_heart;
  IconData icon_Data22 = Icons.favorite;
  IconData icon_Data24 = Icons.set_meal_outlined;
  IconData icon_Data25 = Icons.settings_ethernet;
  IconData iconDataMenu = Icons.menu;
  IconData iconDataMoreVert = Icons.more_vert;
  IconData iconDataMoreHoriz = Icons.more_horiz;
}

class MyColors {
  static const Color black = Colors.black;
  static const Color black12 = Colors.black12;
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color orange = Colors.orange;
  static const Color green = Colors.green;
  static const Color black0xff181818 = Color(0xFF181818);
  static const Color darkGreen2023080622041 = Color(0xff009688);
  static const Color darkGreen2023080622042 = Color(0xff00675b);
  static const Color darkGreen2023080622043 = Color(0xff52c7b8);
  static final Color greenShade900 = Colors.green.shade900;
  static final Color greenShade600 = Colors.green.shade600;
  static final Color greenShade400 = Colors.green.shade400;
  static const Color lightGreenAccent = Colors.lightGreenAccent;
  static Color blackWithOpacity50Percent = Colors.black.withOpacity(0.5);
  static Color greyWithOpacity90Percent = Colors.grey.withOpacity(0.9);
  static Color whiteWithOpacity90Percent = Colors.white.withOpacity(0.9);
  static Color whiteWithOpacity60Percent = Colors.white.withOpacity(0.6);
  static Color whiteWithOpacity40Percent = Colors.white.withOpacity(0.4);
  static Color lightBlueShade50 = Colors.lightBlue.shade50;
  static Color blackWithOpacity40Percent = Colors.black.withOpacity(0.4);
  static Color blackWithOpacity20Percent = Colors.black.withOpacity(0.2);
  static const color0xff009688 = Color(0xff009688);
  static const color0xff00675b = Color(0xff00675b);
  static const color0xff52c7b8 = Color(0xff52c7b8);
}

class MyTextStyles {
  //리펙토링 진행 예정. 정렬우선순위=[fontSize,fontWeight,color]
  static const TextStyle textStyle1 = TextStyle(fontSize: 18, color: Colors.lightBlueAccent, fontWeight: FontWeight.w900);
  static const TextStyle textStyle2 = TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.w900);
  static const TextStyle textStyle3 = TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100);
  static const TextStyle textStyle4 = TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100);
  static const TextStyle textStyle5 = TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w100);
  static const TextStyle textStyle20230722_1841 = TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w300);
  static const TextStyle sunFlower = TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'sunFlower', fontWeight: FontWeight.w700);
  static TextStyle textStyle20230719 = TextStyle(fontSize: 9, color: Colors.grey.shade600, fontWeight: FontWeight.w500);
  static TextStyle textStyle20230722_1842 = textStyle1.copyWith(fontWeight: FontWeight.w900); //copyWith()를 사용하여 파라미터를 overwrite 해서 쓸 수있다.
  static TextStyle googleLato = GoogleFonts.lato();
  static TextStyle googleAclonica = GoogleFonts.aclonica();
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

class MyBehaviorHelper extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyMents {
  static String notReadyYet = '해당 기능은 아직 준비되지 않은 서비스입니다.\n다음에 만나요!';
  static String inTesting = '테스트 중 입니다.';
  static String inPop = '이전화면으로 이동합니다.';
  static String yes = '네';
  static String no = '아니요';
  static String sorry = '죄송합니다.';
  static String helloWorld = "Hello World";
  static String hello = "안녕하세요! 반갑습니다!";

  static String occuredError = "에러가 발생했습니다";

  static String descriptionAboutPomodoroService = '해당 스크린에서는 pomodoro를 서비스를 제공합니다 \n\n'
      '＊"pomodoro" : 포모도로 기법은 프란체스코 시릴로가 고안한 시간 관리 기법입니다.\n 25분 동안 집중해서 일을 한 다음 5분간 휴식을 취하는 것을 반복하는 방식입니다.\n 이 기법은 25분을 토마토 모양의 요리용 타이머로 측정한 데서 이름이 유래했습니다.\n 포모도로 기법은 집중력 향상과 생산성 향상에 도움이 될 수 있습니다.';

  static String descriptionAboutScreenDeveloperHelper = '해당 스크린에서는 개발하는데 도움이 되는 기능들을 제공해주는 서비스를 제공합니다 \n';

  static String referToConsoleLog = '콘솔에서 출력되는 데이터를 비교하세요';

  static String thisAppServeCurrentTime = '해당 스크린에서는 오늘 날짜와 현재 시간을 제공하는 서비스를 제공합니다.';

  static String descriptionAboutAreaCalculatingService = '평형 계산기는 *"평" 과 ㎡(제곱미터) 간 단위변환 한 결과를 제공해주는 서비스를 제공합니다 \n\n＊"평" : 한국에서 사용하는 집의 면적에 대한 단위입니다.\n 해당 단위는 점차 ㎡ 로 대체되고 있습니다.';

  static String didOpenLeftDrawer = '왼쪽서랍버튼을 열었습니다.';
  static String didOpenRightDrawer = '오른쪽서랍버튼을 열었습니다.';

  static String thisFunctionScheduleManagementService = '해당 기능은 반드시 확인하고 싶은 개인의 반복적인 일정을 작성해 두고 check를 함으로서 계획을 관리하는 습관을 기르도록 돕는 서비스를 제공합니다 \n\n';

  static String inLoading({String title = "해당기능"}) => "$title 을(를) 로딩 중입니다";
}

class MySuperHelpers {
  late bool isCounterZero;

  void pause() {
    exit(0); //이 코드는 앱을 종료하고 시스템으로 돌아갑니다.
    SystemNavigator.pop(); //이 코드는 앱을 백그라운드에서 종료하고 시스템으로 돌아갑니다.
  }

  // MyLogger() {
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
      printWithoutWarning('$couter 초...');
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
    printWithoutWarning('__________________________________________________________________________________________________________________________ text control s');
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
      printWithoutWarning(result); //DEVELOPMENT
    }
    printWithoutWarning('__________________________________________________________________________________________________________________________ text control e');
    printWithoutWarning('__________________________________________________________________________________________________________________________ iterable nature number s');
    printWithoutWarning('naturalNumbers 사용 s');
    var naturalNumbers = IteralbleNatureNumbersMaker(endLimit: 100);
    printWithoutWarning(naturalNumbers.next());
    printWithoutWarning(naturalNumbers.next());
    printWithoutWarning(naturalNumbers.next());
    printWithoutWarning('naturalNumbers 사용 e');
    printWithoutWarning('__________________________________________________________________________________________________________________________ iterable nature number e');
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
    printWithoutWarning(user.name); // John Doe
    printWithoutWarning(user.id); // 30
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

class MyCodes {
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

class MyLinearProgressIndicatorSimple extends StatefulWidget {
  const MyLinearProgressIndicatorSimple();

  @override
  State<MyLinearProgressIndicatorSimple> createState() => _MyLinearProgressIndicatorSimpleState();
}

class _MyLinearProgressIndicatorSimpleState extends State<MyLinearProgressIndicatorSimple> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(value: controller.value, semanticsLabel: 'Linear progress indicator202308102259');
  }
}

class MyProgressIndicatorWithSwitch extends StatefulWidget {
  const MyProgressIndicatorWithSwitch();

  @override
  State<MyProgressIndicatorWithSwitch> createState() => MyProgressIndicatorWithSwitchState();
}

class MyProgressIndicatorWithSwitchState extends State<MyProgressIndicatorWithSwitch> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LinearProgressIndicator(
          value: controller.value,
          semanticsLabel: 'Linear progress indicator',
        ),
        Switch(
          value: determinate,
          onChanged: (bool value) {
            setState(() {
              determinate = value;
              if (determinate) {
                controller.stop();
              } else {
                controller
                  ..forward(from: controller.value)
                  ..repeat();
              }
            });
          },
        ),
      ],
    );
  }
}

enum Regions {
  daegu,
  chungnam,
  incheon,
  daejeon,
  gyeongbuk,
  sejong,
  gwangju,
  jeonbuk,
  gangwon,
  ulsan,
  jeonnam,
  seoul,
  busan,
  jeju,
  chungbuk,
  gyeongnam,
  dataTime,
  dataGubun,
  gyeonggi,
  itemCode,
}

Map<Regions, String> ourRegions = {
  Regions.daegu: '대구',
  Regions.chungnam: '충남',
  Regions.incheon: '인천',
  Regions.daejeon: '대전',
  Regions.gyeongbuk: '경북',
  Regions.sejong: '세종',
  Regions.gwangju: '광주',
  Regions.jeonbuk: '전북',
  Regions.gangwon: '강원',
  Regions.ulsan: '울산',
  Regions.jeonnam: '전남',
  Regions.seoul: '서울',
  Regions.busan: '부산',
  Regions.jeju: '제주',
  Regions.chungbuk: '충북',
  Regions.gyeongnam: '경남',
  Regions.gyeonggi: '경기',
};

class RefactoringModule202307152216 extends StatefulWidget {
  late String txt;

  late Widget destination;

  RefactoringModule202307152216({required this.txt, required this.destination});

  @override
  State<RefactoringModule202307152216> createState() => _RefactoringModule202307152216State();
}

class _RefactoringModule202307152216State extends State<RefactoringModule202307152216> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => widget.destination));
          },
          child: SizedBox(
            height: 50 - 17,
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 0 + 5),
                  // child: const FlutterLogo(size: 30),
                  child: const FlutterLogo(size: 30),
                ),
              ],
            ),
          ),
        ),
        Text(
          widget.txt,
          style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 9, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

Future<void> alertHelper(BuildContext context, String something) async {
  showDialog<String>(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.height * 0.7,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.bug_report,
                color: Colors.red,
                size: 20,
              ),
              const SizedBox(height: 15),
              Text(something, style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    ),
  );
}

class WificonnectingHelper {
  Future<void> checkInternetConnection() async {
    var result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.none) {
      throw const SocketException("인터넷 연결 상태를 확인해 주세요.");
    }
    if (result == ConnectivityResult.mobile) {
      // I am connected to a mobile network. 모바일 데이터 사용
    } else if (result == ConnectivityResult.wifi) {
      // I am connected to a wifi network. 와이파이 사용
    }
  }
}

// class BluetoothConnectingHelper {
//   final String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
//   final String CHARACTERISTIC_UUID_RX = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
//   final String CHARACTERISTIC_UUID_TX = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";
//   final String TARGET_DEVICE_NAME = "ESP32 TEST";
//
// //   late List<ScanResult> scanResult; // Bluetooth Device Scan List
// //   late BluetoothDevice targetDevice;
// //   late BluetoothCharacteristic targetCharacteristicRx;
// //   late BluetoothCharacteristic targetCharacteristicTx;
// //
// // // Scan을 시작함. List에 넣기만 하는 함수.
// //   Future<void> startScan() async {
// //     print("Start Scan!");
// //
// //     // Start scanning 3초간 진행됨.
// //     flutterBlue.startScan(timeout: const Duration(seconds:3), allowDuplicates: false);
// //
// //     // Scan이 시작되는 동안에 받는 listener 관련 액션을 수행함.
// //     flutterBlue.scanResults.listen((results) {
// //     },onError: (e) =>print(e)
// //     ).onData((data) {print(data.length); scanResult=data;});
// //     // Stop scanning
// //     flutterBlue.stopScan();
// //     Future.delayed(const Duration(seconds: 5) , (){scanDevice();});
// //   }
// //
// // // Scan List에 있는 Device들 중, 내가 원하는 Device를 찾는 함수
// //   Future<void> scanDevice() async {
// //     for (ScanResult r in scanResult) {
// //       if (r.device.name == TARGET_DEVICE_NAME)
// //       {
// //         print("Target : ${r.device.name} Found!");
// //         if (!isConnected) {
// //           targetDevice = r.device;
// //           // Device Connect를 여기서 함.
// //           await connectToDevice(targetDevice);
// //         }
// //       }
// //     }
// //   }
//
//   void checkBluetooth() {
//     FlutterBlue flutterBlue = FlutterBlue.instance;
//
//     //장치검색
//     // Start scanning
//     flutterBlue.startScan(timeout: Duration(seconds: 4));
//
// // Listen to scan results
//     var subscription = flutterBlue.scanResults.listen((results) {
//       for (ScanResult r in results) {
//         print('${r.device.name} found! rssi: ${r.rssi}');
//       }
//     });
//
//     // Stop scanning
//     flutterBlue.stopScan();
//
//
//     // Connect to the device
//     await BluetoothDevice.connect();
//
//     // Disconnect from device
//     BluetoothDevice.disconnect();
//   }
// }


Future<Position> determineUserLocationUsingPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

// Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('_________________________________ Location services are disabled._________________________________');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('_________________________________ Location permissions are denied _________________________________ ');
    }
  }
  if (permission == LocationPermission.deniedForever) {
// Permissions are denied forever, handle appropriately.
    return Future.error('_________________________________ Location permissions are permanently denied, we cannot request permissions. _________________________________ ');
  }

  print("_________________________________ location permissions are granted _________________________________");
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

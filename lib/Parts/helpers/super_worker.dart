import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';

import '../data_layer/my_data_layer.dart';

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


void printWithoutErrorOrPrintWithError(var txt) {
  /*배포 시 내부 주석처리*/
  print(txt.toString());
}

// void debugList({required List<dynamic> items}) {
//   /*배포 시 내부 주석처리*/
//   print("__________________________________________________________________________ debug s");
//   for (dynamic item in items) {
//     print(item.toString());
//   }
//    print("__________________________________________________________________________ debug e");
// }
// void debugString(var txt) {
//   /*배포 시 내부 주석처리*/
//   print("__________________________________________________________________________ debug s");
//   print(txt.toString());
//   print("__________________________________________________________________________ debug e");
// }

void debugDynamic(dynamic subjectToAnalize) {
  /*배포 시 내부 주석처리*/
  if(subjectToAnalize is String){
    print("__________________________________________________________________________ debug s");
    print(subjectToAnalize.toString());
    print("__________________________________________________________________________ debug e");
  }
  if(subjectToAnalize is List<dynamic>){
    print("__________________________________________________________________________ debug s");
    for (dynamic item in subjectToAnalize) {
      print(item.toString());
    }
    print("__________________________________________________________________________ debug e");
  }
}


void printWithMkr({String txt = ''}) {
  /*배포 시 내부 주석처리*/
  // print("_____________________________________________________________ $txt mkr");
}

void printWithoutMkr({String txt = ''}) {
  /*배포 시 내부 주석처리*/
  // print("_____________________________________________________________ $txt ");
}

void printWithS(String txt) {
  /*배포 시 내부 주석처리*/
  // print("_____________________________________________________________ $txt s");
}

void printWithE(String txt) {
  /*배포 시 내부 주석처리*/
  // print("_____________________________________________________________ $txt e");
}

String textCutter(String text, {int cuttingPosition = 10}) {
  String result = '';
  if (text.length >= cuttingPosition) {
    result = "${text.substring(0, 9)}...";
  } else {
    result = text;
  }
  return result;
}

class MyIcons {
  static Icon icon_1 = const Icon(Icons.adb, color: Colors.yellowAccent);
  static Icon icon_2 = const Icon(Icons.check_box, color: Colors.yellowAccent);
  static Icon icon_3 = const Icon(Icons.checklist_outlined, color: Colors.yellowAccent);
  static Icon icon_4 = const Icon(Icons.checklist_rtl, color: Colors.yellowAccent);
  static Icon icon_5 = const Icon(Icons.check, color: Colors.yellowAccent);
  static Icon icon_6 = const Icon(Icons.fact_check, color: Colors.yellowAccent);
  static Icon icon_7 = const Icon(Icons.library_add_check_outlined, color: Colors.yellowAccent);
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
}

class MyTextStyles {
  static TextStyle textStyle1 = const TextStyle(fontSize: 18, color: Colors.lightBlueAccent, fontWeight: FontWeight.w900);
  static TextStyle textStyle2 = const TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.w900);
  static TextStyle textStyle3 = const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100);
  static TextStyle textStyle4 = const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100);
  static TextStyle textStyle5 = const TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w100);
  static TextStyle textStyle202307191452 = TextStyle(fontSize: 9, color: Colors.grey.shade600, fontWeight: FontWeight.w500);
}

class MySnackBars {
  static SnackBar notReadySnackBar = SnackBar(
    duration: const Duration(seconds: 1),
    content: const Text('해당 기능은 아직 준비되지 않은 서비스입니다.다음에 만나요!'),
    action: SnackBarAction(
      label: '네',
      onPressed: () {},
    ),
  );

  static SnackBar basicSnackBar() {
    return SnackBar(
      duration: const Duration(seconds: 1),
      content: const Text("안녕하세요! 반갑습니다!"),
      action: SnackBarAction(
        label: '네',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }

  static SnackBar alertSnackBar() {
    return SnackBar(
      backgroundColor: Colors.red[400],
      duration: const Duration(seconds: 1),
      content: const Text("에러가 발생했습니다"),
      action: SnackBarAction(
        label: '네',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }

  static SnackBar loadingSnackBar() {
    return SnackBar(
      duration: const Duration(seconds: 2),
      content: Row(
        children: [
          const Text("SnackBar 공부 중"),
          Expanded(child: Container(height: 0)),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  static SnackBar greetingSnackBar = const SnackBar(
    duration: Duration(milliseconds: 4000),
    content: Text('\n\n눌러주셔서 감사합니다.\n오늘도 좋은 하루가 되시길 바랍니다.^^\n\n'),
  );
}

class MySuperworkers {
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
    // Get the URL of the MP3 file.
    String url = path;
    printWithoutErrorOrPrintWithError(url);

    // final Uri url_ = Uri.parse(path);//Create a URI with encryption
    Uri url_ = Uri(
      // Create a URI without encryption.
      scheme: path.split("://").first,
      host: path.split("//").last.split("/").first.split(":").first,
      port: int.parse(path.split("//").last.split("/").first.split(":").last),
      path: 'test.mp3',
      query: '',
    );
    printWithoutErrorOrPrintWithError(url_.toString());

    // // Download the MP3 file.
    Response response = await get(url_);

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
    bool isCounterZero = false;
    while (true) {
      printWithoutErrorOrPrintWithError('$couter 초...');
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
    printWithoutErrorOrPrintWithError('_______________________________________________________________________ text control s');
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

    List<String> resultsRemoved = MySuperworkers().getLinesThatRemovedAboutSpecificTexts(origin: textsOrigin, textsThatIWantToContain: textsToRemove);
    // print(results_removed.toString());//DEVELOPMENT

    List<String> resultsReindented = MySuperworkers().getTextsThatReindetedAtSpecificText(origin: resultsRemoved, specificText: textsToReindent);
    // print(results_reindented.toString()); //DEVELOPMENT

    // List<String> results_contained = MyFunctions().get_lines_that_contain_about_specific_texts(origin: results_reindented, texts_that_i_want_to_contain: texts_to_contain);
    // print(results_selected.toString()); //DEVELOPMENT

    //List<String> results_final= results_removed;
    List<String> resultsFinal = resultsReindented;
    // List<String> results_final= results_contained;

    for (String result in resultsFinal) {
      printWithoutErrorOrPrintWithError(result); //DEVELOPMENT
    }
    printWithoutErrorOrPrintWithError('_______________________________________________________________________ text control e');

    printWithoutErrorOrPrintWithError('_______________________________________________________________________ iterable nature number s');
    printWithoutErrorOrPrintWithError('naturalNumbers 사용 s');
    var naturalNumbers = IteralbleNatureNumbersMaker(endLimit: 100);
    printWithoutErrorOrPrintWithError(naturalNumbers.next());
    printWithoutErrorOrPrintWithError(naturalNumbers.next());
    printWithoutErrorOrPrintWithError(naturalNumbers.next());
    printWithoutErrorOrPrintWithError(naturalNumbers.next());
    printWithoutErrorOrPrintWithError(naturalNumbers.next());
    printWithoutErrorOrPrintWithError('naturalNumbers 사용 e');
    printWithoutErrorOrPrintWithError('_______________________________________________________________________ iterable nature number e');
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
    User user = User(id: 1, name: "박정훈", date_join: "2023-06-05", date_login: "2023-06-05");
    Map<String, dynamic> json = {
      //DEVELOPMENT
      'user': user, //DEVELOPMENT'
    }; //DEVELOPMENT
    await SessionManager().set('user', user);

    //set
    User user2 = User(id: 2, name: "박정훈", date_join: "2023-06-05", date_login: "2023-06-05");
    await SessionManager().set('user', user2);
  }

  Future<void> getMySession(String sessionKey) async {
    //get
    final User user = User.fromJson(await SessionManager().get('user'));
    printWithoutErrorOrPrintWithError(user.name); // John Doe
    printWithoutErrorOrPrintWithError(user.id); // 30
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
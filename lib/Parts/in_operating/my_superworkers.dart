import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';

import 'my_data_layer.dart';

enum job { paladin, worrior, magitian }

enum study_level { begginer, intermediate, advanced }

enum programming_proficiency_level { begginer, intermediate, pro }

class My_superworkers {
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
    print(url);

    // final Uri url_ = Uri.parse(path);//Create a URI with encryption
    Uri url_ = Uri(
      // Create a URI without encryption.
      scheme: path.split("://").first,
      host: path.split("//").last.split("/").first.split(":").first,
      port: int.parse(path.split("//").last.split("/").first.split(":").last),
      path: 'test.mp3',
      query: '',
    );
    print(url_.toString());

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

  void process_properly({required String somthing}) {
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

  Future<void> Countdown(int couter) async {
    bool isCounterZero = false;
    while (true) {
      print('' + couter.toString() + ' 초...');
      sleep(const Duration(seconds: 1));
      couter = couter - 1;
      if (couter == 0) {
        isCounterZero = true;
        break;
      }
    }
  }

  Map<String, dynamic> host_environment_info() {
    // final String? platform = _getPlatformInfoUsingDartIo();
    final String? platform = _getPlatformInfoUsingFlutterFoundation();
    // final String? platform = _getPlatformUsingThemeData(context);
    final String? current_operating_environment = _getCurrentOperatingEnvironment();

    Map<String, dynamic> result = {
      'Platform': platform ?? '-',
      'Operating Environment': current_operating_environment ?? '-',
    };
    return result;
  }

  //특정 텍스트를 포함한 줄만 추출 해서 결과 반환해주는 기능
  //dart 특정 리스트 문자열의 요소들을 포함하는 리스트 문자열의 요소만 출력
  List<String> get_lines_that_contain_about_specific_texts({required List<String> origin, required List<String> texts_that_i_want_to_contain}) {
    texts_that_i_want_to_contain.removeWhere((e) => e.isEmpty); // list<String> 에서 공백인 요소 모두 제거
    List<String> texts_that_i_want_to_contain_ = new List<String>.from(new Set<String>.from(texts_that_i_want_to_contain)); //list<String> 중복인 요소 모두 제거

    var list1 = origin;
    var list2 = texts_that_i_want_to_contain_;
    var that_i_want = list1.where((element) => list2.contains(element));

    List<String> that_i_want_ = that_i_want.toList(); //dart iterable string 에서 list string 으로 변환
    return that_i_want_;
  }

//특정 단어를 포함한 줄 제거해서 결과 반환해주는 기능
  List<String> get_lines_that_removed_about_specific_texts({required List<String> origin, required List<String> texts_that_i_want_to_contain}) {
    texts_that_i_want_to_contain.removeWhere((e) => e.isEmpty); // list<String> 에서 공백인 요소 모두 제거
    List<String> texts_that_i_want_to_contain_ = new List<String>.from(new Set<String>.from(texts_that_i_want_to_contain)); //list<String> 중복인 요소 모두 제거

    var list1 = origin;
    var list2 = texts_that_i_want_to_contain_;
    var that_i_want = list1.where((element) => !(list2.contains(element)));

    List<String> that_i_want_ = that_i_want.toList(); //dart iterable string 에서 list string 으로 변환
    return that_i_want_;
  }

//특정 단어를 포함한 줄만 들여쓰기 하는 기능
  List<String> get_texts_that_reindeted_at_specific_text({required List<String> origin, required List<String> specific_text}) {
    specific_text = specific_text.toSet().toList();

    List<String> result = [];
    for (String element in origin) {
      if (specific_text.contains(element)) {
        result.add(element);
      } else {
        result.add('    ' + element);
      }
    }
    return result;
  }

  //테스트
  void test_list_string_handling_functions() {
    print('_______________________________________________________________________ text control s');
    List<String> texts_origin = [
      "!",
      "2",
      "3",
    ];
    List<String> texts_to_remove = [
      "2",
    ];
    List<String> texts_to_reindent = [
      "!",
    ];
    // List<String> texts_to_contain = [
    //   "1",
    // ];

    List<String> results_removed = My_superworkers().get_lines_that_removed_about_specific_texts(origin: texts_origin, texts_that_i_want_to_contain: texts_to_remove);
    // print(results_removed.toString());//DEVELOPMENT

    List<String> results_reindented = My_superworkers().get_texts_that_reindeted_at_specific_text(origin: results_removed, specific_text: texts_to_reindent);
    // print(results_reindented.toString()); //DEVELOPMENT

    // List<String> results_contained = MyFunctions().get_lines_that_contain_about_specific_texts(origin: results_reindented, texts_that_i_want_to_contain: texts_to_contain);
    // print(results_selected.toString()); //DEVELOPMENT

    //List<String> results_final= results_removed;
    List<String> results_final = results_reindented;
    // List<String> results_final= results_contained;

    for (String result in results_final) {
      print(result); //DEVELOPMENT
    }
    print('_______________________________________________________________________ text control e');

    print('_______________________________________________________________________ iterable nature number s');
    print('naturalNumbers 사용 s');
    var naturalNumbers = IteralbleNatureNumber(EndLimit: 100);
    print(naturalNumbers.next());
    print(naturalNumbers.next());
    print(naturalNumbers.next());
    print(naturalNumbers.next());
    print(naturalNumbers.next());
    print('naturalNumbers 사용 e');
    print('_______________________________________________________________________ iterable nature number e');
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

  Future<void> getMySession(String session_key) async {
    //get
    final User user = User.fromJson(await SessionManager().get('user'));
    print(user.name); // John Doe
    print(user.id); // 30
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

class MyIcons {
  static Icon icon_1 = Icon(Icons.adb, color: Colors.yellowAccent);
  static Icon icon_2 = Icon(Icons.check_box, color: Colors.yellowAccent);
  static Icon icon_3 = Icon(Icons.checklist_outlined, color: Colors.yellowAccent);
  static Icon icon_4 = Icon(Icons.checklist_rtl, color: Colors.yellowAccent);
  static Icon icon_5 = Icon(Icons.check, color: Colors.yellowAccent);
  static Icon icon_6 = Icon(Icons.fact_check, color: Colors.yellowAccent);
  static Icon icon_7 = Icon(Icons.library_add_check_outlined, color: Colors.yellowAccent);
  static Icon icon_8 = Icon(Icons.adb);
  static Icon icon_9 = Icon(Icons.all_inclusive);
  static Icon icon_10 = Icon(Icons.add_reaction);
  static Icon icon_11 = Icon(Icons.add_reaction);
  static Icon icon_12 = Icon(Icons.airplay);
  static Icon icon_13 = Icon(Icons.animation);
  static Icon icon_14 = Icon(Icons.announcement_rounded);
  static Icon icon_15 = Icon(Icons.radio_button_on);
  static Icon icon_16 = Icon(Icons.radio_button_off);
  static Icon icon_17 = Icon(Icons.arrow_drop_down);
  static Icon icon_18 = Icon(Icons.arrow_downward);
  static Icon icon_23 = Icon(Icons.dark_mode);
  static Icon icon_19 = Icon(Icons.laptop_windows);
  static Icon icon_20 = Icon(Icons.laptop_mac);
  static Icon icon_21 = Icon(Icons.monitor_heart);
  static Icon icon_22 = Icon(Icons.favorite);
  static Icon icon_24 = Icon(Icons.set_meal_outlined);
  static Icon icon_25 = Icon(Icons.settings_ethernet);
}

class MyColors {
  static Color black_undefined = Color(0xFF181818);
  static Color black_background = Colors.black12;
  static Color black_clear = Colors.black.withOpacity(0.5);
  static Color grey_clear = Colors.grey.withOpacity(0.9);
  static Color white_clear = Colors.white.withOpacity(0.6);
  static Color whilte_general = Colors.white;
  static Color red_warning = Colors.red;
  static Color orange_caution = Colors.orange;
}

class MyTextStyles {
  static TextStyle textStyle1 = const TextStyle(fontSize: 18, color: Colors.lightBlueAccent, fontWeight: FontWeight.w900);
  static TextStyle textStyle2 = const TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.w900);
  static TextStyle textStyle3 = const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100);
  static TextStyle textStyle4 = const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100, fontFamily: 'NanumSquareRegular');
  static TextStyle textStyle5 = const TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w100);
}
class IteralbleNatureNumber {
  List<int> itemsHistory = [];
  List<int> itemsCurrent = [];
  int index = 1;

  IteralbleNatureNumber({required int EndLimit}) {
    while (index != EndLimit + 1) {
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

  List<int> All() => itemsCurrent;

  List<int> All_History() => itemsHistory;
}

class IterableAlphabets {
  final List<String> Alpabets_snapshot_at_first_initialization = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  late List<String> Alpabets;
  late int length;

  IterableAlphabets() {
    reload();
    length = Alpabets_snapshot_at_first_initialization.length;
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

  String first() => Alpabets.first;

  String last() => Alpabets.last;

  String next() {
    var firstThing = Alpabets.first;
    Alpabets.removeAt(0);
    return firstThing;
  }

  List<String> current_alphabets() => Alpabets;

  List<String> alphabet_snapshot_at_first_initialization() => Alpabets_snapshot_at_first_initialization;

  void reload() {
    Alpabets = Alpabets_snapshot_at_first_initialization;
  }
}

class RainbowContainerMaker extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  bool? isRainbow;
  var alignment;
  var width;
  var height;
  var decoration;
  var clipBehavior;
  var padding;
  var margin;
  var child;

  RainbowContainerMaker({
    Key? key,
    required this.text,
    required this.color,
    this.font_size,
    this.font_weight,
    this.alignment,
    this.width,
    this.height,
    this.decoration,
    this.clipBehavior,
    this.padding,
    this.margin,
    this.isRainbow,
    required this.child,
  }) : super(key: key);

  @override
  State<RainbowContainerMaker> createState() => _RainbowContainerMakerState();
}

class _RainbowContainerMakerState extends State<RainbowContainerMaker> {
  int buildMethodCounter = 0;
  late Color color;
  List<Color> colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple];

  late Timer timer;

  var alignment;
  var width;
  var height;
  var decoration;
  var clipBehavior;
  var padding;
  var margin;

  var child;

  void changeTextColor(Timer timer) {
    if (buildMethodCounter == colors.length) {
      buildMethodCounter = 0;
    }
    color = colors[buildMethodCounter];
    buildMethodCounter = buildMethodCounter + 1;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    color = widget.color!;
    if (widget.isRainbow == false) {
    } else {
      // timer = Timer.periodic(Duration(milliseconds: 1000), changeTextColor);
      // timer = Timer.periodic(Duration(milliseconds: 100), changeTextColor);
      // timer = Timer.periodic(Duration(milliseconds: 50), changeTextColor);
      // timer = Timer.periodic(Duration(milliseconds: 25), changeTextColor);
      timer = Timer.periodic(Duration(milliseconds: 20), changeTextColor);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: alignment,
      width: width,
      height: height,
      decoration: decoration,
      clipBehavior: clipBehavior,
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}

// Text blackTextMaker1({required String text}) {
//   return Text(
//     text,
//     style: TextStyle(color: Colors.black, fontSize: 5, fontWeight: FontWeight.w400),
//   );
// }

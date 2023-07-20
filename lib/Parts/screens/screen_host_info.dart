import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../helpers/super_helper.dart';

class ScreenHostInfo extends StatefulWidget {
  const ScreenHostInfo({Key? key}) : super(key: key);

  @override
  State<ScreenHostInfo> createState() => _ScreenHostInfoState();
}

class _ScreenHostInfoState extends State<ScreenHostInfo> {
  int counter = 0;
  List<int> inputs = [];
  bool showDecision = true;
  dynamic foo;

  void onClicked() {
    setState(() {
      counter = counter + 1;
      inputs.add(counter);
    });
  }

  @override
  void initState() {
    super.initState();
    foo = 0;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreenHostInfoSub(),
    );
  }
}

class ScreenHostInfoSub extends StatefulWidget {
  const ScreenHostInfoSub({Key? key}) : super(key: key);

  @override
  State<ScreenHostInfoSub> createState() => _ScreenHostInfoSubState();
}

class _ScreenHostInfoSubState extends State<ScreenHostInfoSub> {
  final ment = '해당 스크린에서는 DEVICE HOST INFO를 제공하는 서비스를 제공합니다. \n\n'
      '＊"" : .';

  late Timer timer; //Dart 의 표준 built in library 중의 하나

  late final String? platform;

  late final String? currentOperatingEnvironment;

  @override
  void initState() {
    super.initState();
    initHostPlatformInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackUndefined,
      body: ListView(
        children: [
          ElevatedButton(
            child: Text('go to index'.toUpperCase()),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Column(
            children: <Widget>[
              const Icon(Icons.android, color: Colors.lightBlueAccent),
              Text(ment, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ENVIRONMENT INFO OF THIS PROGRAM', style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 30),
                    Text('Platform: ${platform ?? '-'}', style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w500)),
                    Text('Current Operating Environment: ${currentOperatingEnvironment ?? '-'}', style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w500)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void initHostPlatformInfo() {
    //  platform = _getPlatformInfoUsingDartIo();
    platform = _getPlatformInfoUsingFlutterFoundation();
    // platform = _getPlatformUsingThemeData(context);
    currentOperatingEnvironment = _getCurrentOperatingEnvironment();
  }

  // String? _getPlatformInfoUsingDartIo() {
  //   String? hostPlatform;
  //
  //   if (kIsWeb) {
  //     hostPlatform = 'Web';
  //   } else if (Platform.isAndroid) {
  //     hostPlatform = 'Android';
  //   } else if (Platform.isIOS) {
  //     hostPlatform = 'iOS';
  //   } else if (Platform.isFuchsia) {
  //     hostPlatform = 'Fuchsia';
  //   } else if (Platform.isLinux) {
  //     hostPlatform = 'Linux';
  //   } else if (Platform.isWindows) {
  //     hostPlatform = 'Windows';
  //   } else if (Platform.isMacOS) {
  //     hostPlatform = 'macOS';
  //   }
  //   return hostPlatform;
  // }

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

  // String? _getPlatformUsingThemeData(BuildContext context) {
  //   String? platform;
  //   if (kIsWeb) {
  //     platform = 'Web';
  //   } else if (Theme.of(context).platform == TargetPlatform.android) {
  //     platform = 'Android';
  //   } else if (Theme.of(context).platform == TargetPlatform.iOS) {
  //     platform = 'iOS';
  //   } else if (Theme.of(context).platform == TargetPlatform.fuchsia) {
  //     platform = 'Fuchsia';
  //   } else if (Theme.of(context).platform == TargetPlatform.linux) {
  //     platform = 'Linux';
  //   } else if (Theme.of(context).platform == TargetPlatform.windows) {
  //     platform = 'Windows';
  //   } else if (Theme.of(context).platform == TargetPlatform.macOS) {
  //     platform = 'macOS';
  //   }
  //   return platform;
  // }

  String? _getCurrentOperatingEnvironment() {
    String? currentOperatingEnvironment;

    if (kIsWeb) {
      currentOperatingEnvironment = 'Web';
    } else {
      currentOperatingEnvironment = Platform.operatingSystem;
    }
    return currentOperatingEnvironment;
  }
}

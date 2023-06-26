import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:clipboard/clipboard.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

import 'package:flutter/material.dart';

import '../in_operating/Button_to_submit_daily_report_at_bizmeka.dart';
import '../in_developing/Buttons.dart';

// late String requester_date;
// late String requester_summary;
// late String requester_ment;
// late String request_school_name;
// late String dgist_dorms_type;
// late String requester_name;
// late String request_year;
// late String request_code;
// late String std_no;
// late String std_name;
// late String request_context;

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SampleToggle());
}
class SampleToggle extends StatefulWidget {
  @override
  State<SampleToggle> createState() => _SampleToggleState();
}

class _SampleToggleState extends State<SampleToggle> {
  final LocalStorage storage = LocalStorage('foo.foo');
  late bool isChecked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
initCheckState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('${isChecked.toString() ?? '아직 로컬스토리지에서 값을 가져오지 못했습니다.'}'),
        // 혹시 ?? 하기 싫으면 futureBuilder 사용하면 되는게 아닌가 싶다.
        //future에 Build되기 전까지는 rotary indicator 시현되도록 할수 있는 기능이 있는 futureBuilder.
        //테스트 해보자.
        onPressed: () {
          setState(() {
            onToogleIsChecked();
          });
        },
      ),
    );
  }

  void onToogleIsChecked() {
setState(() {
  if (isChecked == true) {
    isChecked = false;
  } else {
    isChecked = true;
  }
  storage.setItem('isChecked', isChecked);
});
  }
  void initCheckState() {
setState(() {
  if (storage.getItem('isChecked') == null) {
    isChecked = false;
    storage.setItem('isChecked', isChecked);
  } else {
    isChecked = storage.getItem('isChecked');
  }
});
  }
}

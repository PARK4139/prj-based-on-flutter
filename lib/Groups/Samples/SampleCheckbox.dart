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

import '../MyFavoriteThings/Button_to_submit_daily_report_at_bizmeka.dart';
import '../inDeveloping/Buttons.dart';

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
  runApp(SampleCheckbox());
}

class SampleCheckbox extends StatefulWidget {
  @override
  State<SampleCheckbox> createState() => _SampleCheckboxState();
}

class _SampleCheckboxState extends State<SampleCheckbox> {

  final LocalStorage storage = LocalStorage('foo.foo');
  late bool isChecked;
  final Color lightBlueAccent= Colors.lightBlueAccent;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(storage.getItem('isChecked')==null){
      isChecked=false;
      storage.setItem('isChecked', false);
    }else{
      isChecked=storage.getItem('isChecked');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IconButton(
            icon: isChecked? Icon(Icons.check_box_outlined,color: lightBlueAccent):Icon(Icons.check_box_outline_blank,color: lightBlueAccent),
            onPressed: () {
              setState(() {
                if (isChecked == true) {
                  isChecked = false;
                } else {
                  isChecked = true;
                }
                storage.setItem('isChecked', isChecked);
              });
            },
          ),
        ),
      ),
    );
  }
}

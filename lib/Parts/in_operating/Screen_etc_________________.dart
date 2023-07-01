import 'package:flutter/material.dart';


import 'Button_to_move_button_name_into_clipboard.dart';
import 'Buttons_for_kakaotalk.dart';
import 'My_functions.dart';
import 'Rainbow_text.dart';
import 'Screen_checklist.dart';

class Screen_etc_________________ extends StatefulWidget {
  const Screen_etc_________________({Key? key}) : super(key: key);

  @override
  State<Screen_etc_________________> createState() => _Screen_etc_________________State();
}

class _Screen_etc_________________State extends State<Screen_etc_________________> {
  late String requester_date;
  late String requester_summary;
  late String requester_ment;
  late String request_school_name;
  late String dgist_dorms_type;
  late String requester_name;
  late String request_year;
  late String request_code;
  late String std_no;
  late String std_name;
  late String request_context;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requester_summary = '{{요청요약}}';
    requester_date = '{{작업수행일자}}';
    requester_ment = '{{요청자멘트}}';
    request_school_name = '{{요청학교명}}';
    requester_name = '{{요청자명}}';
    request_year = '{{모집년도}}';
    request_code = '{{모집구분}}';
    std_no = '{{학번}}';
    std_name = '{{학생이름}}';
    request_context = '{{요청내용}}';
    dgist_dorms_type = '{{대구과기대기숙사타입}}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black_background,
      body: ListView(
        children: [

        ],
        // mainAxisAlignment: MainAxisAlignment.start,
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
      ),
    );
  }
}

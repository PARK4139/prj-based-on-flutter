import 'package:flutter/material.dart';


import 'Screen_area_calculation.dart';
import 'Screen_checklist.dart';
import 'Screen_db_maintennace.dart';
import 'Screen_code_sniffets.dart';
import 'Screen_promodo.dart';
import 'Screen_web_maintennace.dart';

class Screen_index extends StatefulWidget {
  const Screen_index({Key? key}) : super(key: key);

  @override
  State<Screen_index> createState() => _Screen_indexState();
}

class _Screen_indexState extends State<Screen_index> {
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
  String folder_name1 = 'CODE SNIFFETS'.toUpperCase();
  String folder_name2 = 'web maintennance'.toUpperCase();
  String folder_name3 = 'DB maintennance'.toUpperCase();
  String folder_name4 = 'pomodoro'.toUpperCase();
  String folder_name5 = 'area calculator'.toUpperCase();
  String folder_name6 = 'check list'.toUpperCase();

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
    return ListView(children: [
      Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Screen_area_calculator()),
              );
            },
            icon: Icon(Icons.folder),
            tooltip: folder_name5,
            splashColor: Colors.blue,
            // hoverColor: Colors.red,
            focusColor: Colors.orange,
            color: Colors.blueAccent,
            disabledColor: Colors.purpleAccent,
          ),
          Text(
            folder_name5,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Screen_promodo()),
              );
            },
            icon: Icon(Icons.folder),
            tooltip: folder_name4,
            splashColor: Colors.blue,
            // hoverColor: Colors.red,
            focusColor: Colors.orange,
            color: Colors.blueAccent,
            disabledColor: Colors.purpleAccent,
          ),
          Text(
            folder_name4,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Screen_code_sniffets()),
              );
            },
            icon: Icon(Icons.folder),
            tooltip: folder_name1,
            splashColor: Colors.blue,
            // hoverColor: Colors.red,
            focusColor: Colors.orange,
            color: Colors.blueAccent,
            disabledColor: Colors.purpleAccent,
          ),
          Text(
            folder_name1,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Screen_web_maintennace()),
              );
            },
            icon: Icon(Icons.folder),
            tooltip: folder_name2,
            splashColor: Colors.blue,
            // hoverColor: Colors.red,
            focusColor: Colors.orange,
            color: Colors.blueAccent,
            disabledColor: Colors.purpleAccent,
          ),
          Text(
            folder_name2,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Screen_db_maintennace()),
              );
            },
            icon: Icon(Icons.folder),
            tooltip: folder_name3,
            splashColor: Colors.blue,
            // hoverColor: Colors.red,
            focusColor: Colors.orange,
            color: Colors.blueAccent,
            disabledColor: Colors.purpleAccent,
          ),
          Text(
            folder_name3,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Screen_checklist()),
              );
            },
            icon: Icon(Icons.folder),
            tooltip: folder_name6,
            splashColor: Colors.blue,
            // hoverColor: Colors.red,
            focusColor: Colors.orange,
            color: Colors.blueAccent,
            disabledColor: Colors.purpleAccent,
          ),
          Text(
            folder_name6,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),

    ]);
  }
}

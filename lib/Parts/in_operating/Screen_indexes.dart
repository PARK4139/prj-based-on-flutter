import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/simple_samples/SampleGridSystem.dart';

import '../../Index.dart';
import '../simple_samples/SampleGridSystem.dart';
import '../simple_samples/SampleCheckBox.dart';
import 'Screen_area_calculator.dart';
import 'Screen_area_calculation_ver_orange_android.dart';
import 'Screen_checklist.dart';

import 'Screen_to_control_text.dart';
import 'Screen_promodo.dart';
import 'Screen_promodo_version_pink.dart';
import 'Screen_samples.dart';
import 'Screen_to_maintain_edorm.dart';
import 'Screen_to_tts.dart';
import 'Screen_web_maintennace.dart';

class Screen_indexes extends StatefulWidget {
  const Screen_indexes({Key? key}) : super(key: key);

  @override
  State<Screen_indexes> createState() => _Screen_indexesState();
}

class _Screen_indexesState extends State<Screen_indexes> {
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

  late String folder_development;

  late String folder_text_customization;

  late String folder_dorm_maintennace;

  late String folder_pomodoro;

  late String folder_area_calculator;

  late String folder_checklist;

  late String folder_tts;

  late List<Widget> items_as_folder;
  late List<Widget> items_as_icon_only;
  late List<Widget> items_as_text_only;
  late List<Widget> column_4_items;

  late bool isDevelopingMode;

  late AppState appState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFolderNames();
    initItems();
  }

  void initFolderNames() {
    folder_development = 'DEVELOPMENT'.toUpperCase();
    folder_text_customization = 'text customization'.toUpperCase();
    folder_dorm_maintennace = 'dorm'.toUpperCase();
    folder_pomodoro = 'pomodoro'.toUpperCase();
    folder_area_calculator = 'area calculator'.toUpperCase();
    folder_tts = 'TTS'.toUpperCase();
    folder_checklist = 'check list'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: <Widget>[
        for (var column_1_item in items_as_folder) column_1_item,
        for (var column_2_item in items_as_icon_only) column_2_item,
        for (var column_3_item in items_as_text_only) column_3_item,
      ],
      // scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 5,
        mainAxisSpacing: 0,
      ),
    );
  }

  void initItems() {
    setState(() {
      items_as_folder = [
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_checklist()));
              },
              icon: Icon(Icons.folder),
              tooltip: folder_checklist,
              splashColor: Colors.blue,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folder_checklist, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_area_calculator()));
              },
              icon: Icon(Icons.folder),
              tooltip: folder_area_calculator,
              splashColor: Colors.blue,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folder_area_calculator,
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.9),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_promodo()));
              },
              icon: Icon(Icons.folder),
              tooltip: folder_pomodoro,
              splashColor: Colors.blue,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folder_pomodoro, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_to_control_text()));
              },
              icon: Icon(Icons.folder),
              tooltip: folder_development,
              splashColor: Colors.blue,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folder_development, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
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
              tooltip: folder_text_customization,
              splashColor: Colors.blue,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folder_text_customization, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_to_maintain_dorm()));
              },
              icon: Icon(Icons.folder),
              tooltip: folder_dorm_maintennace,
              splashColor: Colors.blue,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folder_dorm_maintennace, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen_tts()));
              },
              icon: Icon(Icons.folder),
              tooltip: folder_tts,
              splashColor: Colors.blue,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folder_tts, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Container(),//PRODUCTION
        Container(),//PRODUCTION
        Container(),//PRODUCTION
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
        Placeholder(),//DEVELOPMENT
      ];
      // Container(),
      items_as_icon_only = [
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_promodo_version_pink()));
              },
              icon: Icon(Icons.timer_outlined),
              color: Colors.pinkAccent,
              tooltip: folder_pomodoro,
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),

      ];
      items_as_text_only = [
        Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen_samples()));
              },
              child: Text('Screen_samples', style: TextStyle(color: Colors.blueAccent)),

            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ];
      column_4_items = [];
    });
  }
}

import 'package:flutter/material.dart';

import '../../main.dart';
import 'screen_area_calculator.dart';
import 'screen_checklist.dart';
import 'screen_pomodo.dart';
import 'screen_to_control_text.dart';
import 'screen_to_maintain_edorm.dart';
import 'screen_to_tts.dart';

class Screen_index_blue extends StatefulWidget {
  const Screen_index_blue({Key? key}) : super(key: key);

  @override
  State<Screen_index_blue> createState() => _Screen_index_blueState();
}

class _Screen_index_blueState extends State<Screen_index_blue> {
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_plan_excuter()));
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_pomodo()));
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
        Container(), //PRODUCTION
        Container(), //PRODUCTION
        Container(), //PRODUCTION
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
        Placeholder(), //DEVELOPMENT
      ];
      // Container(),
      items_as_icon_only = [
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
      ];
      items_as_text_only = [
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
      ];
      column_4_items = [];
    });
  }
}

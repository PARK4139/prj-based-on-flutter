import 'package:flutter/material.dart';

import '../../Index.dart';
import 'Screen_area_calculation_ver_orange_android.dart';
import 'Screen_promodo_version_pink.dart';
import 'Screen_samples.dart';

class Screen_colorful extends StatefulWidget {
  const Screen_colorful({Key? key}) : super(key: key);

  @override
  State<Screen_colorful> createState() => _Screen_colorfulState();
}

class _Screen_colorfulState extends State<Screen_colorful> {
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
    initItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView(
        children: <Widget>[
          for (var item in items_as_icon_only) item,
        ],
        // scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 5, mainAxisSpacing: 0),
      ),
    );
  }

  void initItems() {
    setState(() {
      items_as_icon_only = [
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_promodo_version_pink()));
              },
              icon: Icon(Icons.timer_outlined),
              color: Colors.pinkAccent,
              tooltip: 'POMODORO'.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_area_calculation_ver_orange_android()));
              },
              icon: Icon(Icons.calculate_outlined),
              color: Colors.orangeAccent,
              tooltip: 'calculator'.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_samples()));
              },
              icon: Icon(Icons.code),
              color: Colors.lightBlueAccent,
              tooltip: 'ui sample'.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ];
    });
  }
}

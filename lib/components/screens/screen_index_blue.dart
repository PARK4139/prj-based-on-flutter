import 'package:flutter/material.dart';

import 'screen_area_calculator.dart';
import 'screen_developer_helper.dart';
import 'screen_pomodoro.dart';
import 'screen_to_maintain_edorm.dart';
import 'screen_tts_test.dart';
import '../../main.dart';

class ScreenIndexBlue extends StatefulWidget {
  const ScreenIndexBlue({Key? key}) : super(key: key);

  @override
  State<ScreenIndexBlue> createState() => _ScreenIndexBlueState();
}

class _ScreenIndexBlueState extends State<ScreenIndexBlue> {


  late String folderDevelopment;

  late String folderTextCustomization;

  late String folderDormMaintennace;

  late String folderPomodoro;


  late String folderChecklist;

  late String folderTts;

  late List<Widget> itemsAsFolder;
  late List<Widget> itemsAsIcon;
  late List<Widget> itemsAsText;

  late bool isDevelopingMode;

  late AppState appState;

  @override
  void initState() {
    super.initState();
    initFolderNames();
    initItems();
  }

  void initFolderNames() {
    folderDevelopment = 'DEVELOPMENT'.toUpperCase();
    folderTextCustomization = 'text customization'.toUpperCase();
    folderDormMaintennace = 'dorm'.toUpperCase();
    folderPomodoro = 'pomodoro'.toUpperCase();

    folderTts = 'TTS'.toUpperCase();
    folderChecklist = 'check list'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 5,
        mainAxisSpacing: 0,
      ),
      children: <Widget>[
        for (var itemOfColumn1 in itemsAsFolder) itemOfColumn1,
        for (var itemOfColumn2 in itemsAsIcon) itemOfColumn2,
        for (var itemOfColumn3 in itemsAsText) itemOfColumn3,
      ],
    );
  }

  void initItems() {
    setState(() {
      itemsAsFolder = [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenAreaCalculator()));
              },
              icon: const Icon(Icons.folder),
              tooltip: "Calculator",
              splashColor: Colors.white,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text("Calculator",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.9),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenPomodoro()));
              },
              icon: const Icon(Icons.folder),
              tooltip: folderPomodoro,
              splashColor: Colors.white,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folderPomodoro, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenDeveloperHelper()));
              },
              icon: const Icon(Icons.folder),
              tooltip: folderDevelopment,
              splashColor: Colors.white,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folderDevelopment, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenToMaintainDorm()));
              },
              icon: const Icon(Icons.folder),
              tooltip: folderDormMaintennace,
              splashColor: Colors.white,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folderDormMaintennace, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenTtsTest()));
              },
              icon: const Icon(Icons.folder),
              tooltip: folderTts,
              splashColor: Colors.white,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(folderTts, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600))
          ],
        ),
        Container(), //PRODUCTION
        Container(), //PRODUCTION
        Container(), //PRODUCTION
        // const Placeholder(), //DEVELOPMENT
        // const Placeholder(), //DEVELOPMENT
        // const Placeholder(), //DEVELOPMENT
        // const Placeholder(), //DEVELOPMENT OPMENT
      ];
      // Container(),
      itemsAsIcon = [
        // const Placeholder(),
        // const Placeholder(),
        // const Placeholder(),
        // const Placeholder(),
        // const Placeholder(),
      ];
      itemsAsText = [
        // const Placeholder(),
        // const Placeholder(),
        // const Placeholder(),
        // const Placeholder(),
        // const Placeholder(),
      ];

    });
  }
}

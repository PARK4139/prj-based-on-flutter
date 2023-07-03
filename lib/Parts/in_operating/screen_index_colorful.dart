import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_carrot_market.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_digital_clock.dart';

import '../../Index.dart';
import 'screen_area_calculation_ver_orange.dart';
import 'screen_netflix.dart';
import 'screen_pomodo_version_pink.dart';
import 'screen_samples.dart';

class Screen_index_colorful extends StatefulWidget {
  const Screen_index_colorful({Key? key}) : super(key: key);

  @override
  State<Screen_index_colorful> createState() => _Screen_index_colorfulState();
}

class _Screen_index_colorfulState extends State<Screen_index_colorful> {
  late List<Widget> items_as_icon_only;

  String index_name_netflixx = '넷플리쓰';
  String index_name_carrot_markket = '당근마껫';
  String index_name_pomodoro = '포모도로';
  String index_name_digital_clock = '시계';
  String index_name_area_calculator = '평 계산기';
  String index_name_flutter_samples = '플러터 샘플';
  String index_name_ = '';

  late bool isDevelopingMode;

  String indexNameCutter(String indexName) {
    String result = '';
    if (indexName.length >= 10) {
      result = indexName.substring(0, 9) + "...";
    } else {
      result = indexName;
    }
    return result;
    // return indexName;
  }

  @override
  void initState() {
    super.initState();
    initItems();
    isDevelopingMode = context.findAncestorStateOfType<AppState>()!.isDevelopingMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDevelopingMode?Colors.white:Colors.blue,
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 5, mainAxisSpacing: 10),
        children: <Widget>[
          for (var item in items_as_icon_only) item,
        ],
      ),
    );
  }

  void initItems() {
    setState(() {
      items_as_icon_only = [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen_pomodo_ver_pink(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(scale: 1.8, child: const Icon(Icons.timer_outlined)),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 9),
                      child: Text(
                        indexNameCutter(index_name_pomodoro),
                        style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.pinkAccent,
              tooltip: index_name_pomodoro.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen_area_calculation_ver_orange_android(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(scale: 1.8,child: const Icon(Icons.calculate_outlined)),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 9),
                      child: Text(
                        indexNameCutter(index_name_area_calculator),
                        style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.orangeAccent,
              tooltip: index_name_area_calculator.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen_samples(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(scale: 1.8,child: const Icon(Icons.code)),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 9),
                      child: Text(
                        indexNameCutter(index_name_flutter_samples),
                        style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.lightBlueAccent,
              tooltip: index_name_flutter_samples.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen_digital_clock(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(scale: 1.8, child: const Icon(Icons.access_time_filled_rounded)),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 9),
                      child: Text(
                        indexNameCutter(index_name_digital_clock).toUpperCase(),
                        style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.purpleAccent,
              tooltip: index_name_digital_clock.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen_carrot_market(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(
                    scale: 1.8,
                    child: Image.asset('assets/app_carrot_market_logo.png', height: 25),
                  ),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 9),
                      child: Text(
                        indexNameCutter(index_name_carrot_markket),
                        style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.purpleAccent,
              tooltip: index_name_carrot_markket.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenNetFlix(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(
                    scale: 1.8,
                    child: Image.asset('assets/app_netflix_logo.png', height: 25),
                  ),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 9),
                      child: Text(indexNameCutter(index_name_netflixx), style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
              color: Colors.purpleAccent,
              tooltip: index_name_netflixx.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
        ),
      ];
    });
  }
}

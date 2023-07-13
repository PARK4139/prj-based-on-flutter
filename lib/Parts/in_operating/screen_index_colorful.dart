import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/rainbow_icon.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_area_calculator.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_carrot_market.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_checklist.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_digital_clock.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_pomodo.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_super_stamp.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_webtoon_v1.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_webtoon_v2.dart';

import '../samples/ScreenFlutterStudyNote.dart';
import 'screen_netflix.dart';
import 'screen_samples.dart';

class Screen_index_colorful extends StatefulWidget {
  bool isDarkMode;

  Screen_index_colorful({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<Screen_index_colorful> createState() => _Screen_index_colorfulState();
}

class _Screen_index_colorfulState extends State<Screen_index_colorful> {
  late List<Widget> items_as_icon_only;

  String index_name_netflixx = '넷플리쓰';
  String index_name_carrot_markket = '당근마껫';
  String index_name_pomodoro = '프로모도';
  String index_name_digital_clock = '시계';
  String index_name_area_calculator = '평형 계산기';
  String index_name_flutter_samples = '플러터 샘플';
  String index_name_plan_excuter = '계획집행기';
  String index_name_today_webtoon = '오늘의 웹툰';
  String index_name_super_stamp='슈퍼 스탬프';
  String index_name_screen_in_developing='XXXXXXXX';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black87 : Colors.white,
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
                    builder: (context) => const Screen_pomodo(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(scale: 1.8, child: Transform.scale(scale: 0.9, child: const Icon(Icons.timer_outlined))),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 10),
                      child: Text(
                        indexNameCutter(index_name_pomodoro),
                        style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.blueAccent,
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
                    builder: (context) => const Screen_area_calculator(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(scale: 1.8, child: const Icon(Icons.calculate_outlined)),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 10),
                      child: Text(
                        indexNameCutter(index_name_area_calculator),
                        style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.blueAccent,
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
                  Transform.scale(scale: 1.8, child: const Icon(Icons.code)),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 10),
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
        /*시계*/ Column(
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
                      offset: Offset(0, 10),
                      child: Text(
                        indexNameCutter(index_name_digital_clock),
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
        /*당근마껫*/ Column(
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
                    scale: 2.2,
                    child: Container(
                      width: 20,
                      clipBehavior: Clip.hardEdge, //borderRadius: BorderRadius.circular(100), 에 의존적이다.
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), //clipBehavior: Clip.hardEdge, 에 의존적이다.
                        color: Colors.white,
                      ),
                      child: Transform.scale(scale: 0.8, child: Image.asset('assets/app_carrot_market_logo.png', height: 20)),
                    ),
                  ),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 10),
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
        /*넷플릿쓰*/ Column(
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
                    scale: 2.2,
                    child: Container(
                        clipBehavior: Clip.hardEdge, //borderRadius: BorderRadius.circular(100), 에 의존적이다.
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), //clipBehavior: Clip.hardEdge, 에 의존적이다.
                          color: Colors.black,
                        ),
                        child: Transform.scale(scale: 1.3, child: Image.asset('assets/app_netflix_logo.png', height: 20, width: 20))),
                  ),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 10),
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
        /*계획집행기*/ Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen_plan_excuter(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(
                    scale: 1.8,
                    child: Container(
                        clipBehavior: Clip.hardEdge, //borderRadius: BorderRadius.circular(100), 에 의존적이다.
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), //clipBehavior: Clip.hardEdge, 에 의존적이다.
                          color: Colors.white,
                        ),
                        child: Transform.scale(scale: 0.8, child: Icon(Icons.rule_outlined))),
                  ),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 10),
                      child: Text(indexNameCutter(index_name_plan_excuter), style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
              color: Colors.blueAccent,
              tooltip: index_name_plan_excuter.toUpperCase(),
              splashColor: Colors.blue,
              focusColor: Colors.pinkAccent,
              disabledColor: Colors.purpleAccent,
            ),
          ],
        ),/*오늘의 웹툰*/ Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Screen_webtoon_v2(),
                  ),
                );
              },
              icon: Column(
                children: [
                  Transform.scale(
                    scale: 2.1,
                    child: Container(
                        clipBehavior: Clip.hardEdge, //borderRadius: BorderRadius.circular(100), 에 의존적이다.
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), //clipBehavior: Clip.hardEdge, 에 의존적이다.
                          color: Colors.white,
                        ),
                      child: Transform.scale(scale: 0.8, child: Image.asset('assets/app_webtoon_logo.jpg', height: 20)),
                  ),
                  ),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: Offset(0, 10),
                      child: Text(indexNameCutter(index_name_today_webtoon), style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 5, fontWeight: FontWeight.w600)),

                    ),
                  ),
                ],
              ),
              color: Colors.blueAccent,
              tooltip: index_name_today_webtoon.toUpperCase(),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenToHelpDeveloper()));
              },
              icon: Rainbow_icon(iconData: Icons.stars_outlined),
              tooltip: index_name_super_stamp,
              splashColor: Colors.blue,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(index_name_super_stamp, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenFlutterStudyNote()));
              },
              icon: Placeholder(),
              tooltip: index_name_screen_in_developing,
              splashColor: Colors.blue,
              // hoverColor: Colors.red,
              focusColor: Colors.orange,
              color: Colors.blueAccent,
              disabledColor: Colors.purpleAccent,
            ),
            Text(index_name_screen_in_developing, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
          ],
        ),
      ];
    });
  }
}

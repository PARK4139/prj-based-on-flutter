import 'package:flutter/material.dart';

import 'Button_to_move_button_name_into_clipboard.dart';
import 'Button_to_multi_case.dart';
import 'MyFunctions.dart';
import 'Rainbow_text_maker.dart';

class Screen_code_sniffets extends StatefulWidget {
  const Screen_code_sniffets({Key? key}) : super(key: key);

  @override
  State<Screen_code_sniffets> createState() => _Screen_code_sniffetsState();
}

class _Screen_code_sniffetsState extends State<Screen_code_sniffets> {
  final ment = '해당 스크린에서는 코드스니펫들을 제공해주는 서비스를 제공합니다 \n\n'
      '＊"주석" : 코드에서 자주 사용하는 코드스티펫 집합입니다.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Center(
              child: Container(
                color: Colors.black38,
                child: TextButton(
                  clipBehavior: Clip.hardEdge,
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(100, 50)),
                    maximumSize: MaterialStateProperty.all(Size(100, 50)),
                  ),
                  child: Text(
                      'go to index'.toUpperCase(),
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const Icon(Icons.android, color: Colors.lightBlueAccent),
            Center(
              child: Text(
                "$ment",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.9),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Center(child: Rainbow_text_maker(text: '멀티 케이스 메이커', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration:  TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false )),
            Multi_case_maker(text: '멀티 케이스 메이커', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '멀티 케이스 메이커', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '멀티 케이스 메이커', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '멀티 케이스 메이커', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '멀티 케이스 메이커', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '멀티 케이스 메이커', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '멀티 케이스 메이커', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '멀티 케이스 메이커', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),



            Center(child: Rainbow_text_maker(text: '주석', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration:  TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false )),

            SizedBox(
              height: 10,
            ),
            Button_to_move_button_name_into_clipboard(text: "//DEVELOPMENT", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            SizedBox(
              height: 20,
            ),

            Center(child: Rainbow_text_maker(text: 'flutter theme color reference', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration:  TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false )),
            Button_to_move_button_name_into_clipboard(text: "color: Theme.of(context).cardColor", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            SizedBox(
              height: 20,
            ),

            Center(child: Rainbow_text_maker(text: 'flutter collection for sample', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration:  TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false )),
            Button_to_move_button_name_into_clipboard(text: "for (String element in <String>['String1','String2','String3']) Text(element),", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            SizedBox(
              height: 20,
            ),


            Center(child: Rainbow_text_maker(text: '____________________', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration:  TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal,  isRainbowMode: false )),
            Button_to_move_button_name_into_clipboard(text: "____________________", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            SizedBox(
              height: 20,
            ),


            Center(child: Rainbow_text_maker(text: 'flutter shared_freference for using mobile local storage', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration:  TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, isRainbowMode: false )),
            Button_to_move_button_name_into_clipboard(text: """
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;
  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;
    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }
""", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: """ 
Center(
    child: FutureBuilder<int>(
        future: _counter,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
                return const CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
                if (snapshot.hasError) {
                return Text(
                    'Error: \${snapshot.error}',
                    style: TextStyle(color: MyColors.orange_caution),
                );
                } else {
                return Text(
                    'Button tapped \${snapshot.data} time\${스냅샷.데이터 == 1 ? '' : 's'}'
                    style: TextStyle(color: MyColors.orange_caution),
                );
                }
            }
        })),
IconButton(
    onPressed: _incrementCounter,
    tooltip: 'Increment',
    icon: const Icon(
        Icons.add,
        color: Colors.tealAccent,
    )),
            """, background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            SizedBox(
              height: 20,
            ),

            Center(child: Rainbow_text_maker(text: 'FLUTTER PAGE ROUTING', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration:  TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false )),
            SizedBox(
              height: 10,
            ),
            Button_to_move_button_name_into_clipboard(text: '''
ElevatedButton(
  child: const Text('go to ScreenSecond'),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScreenSecond()),
    );
  },
),
''', background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: '''
ElevatedButton(
  child: const Text('go to ScreenFirst'),
  onPressed: () {
    Navigator.pop(context);
  },
),
''', background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),





          ],
        ),
      ),
    );
  }
}

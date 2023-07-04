import 'package:flutter/material.dart';

import '../../main.dart';
import '../in_developing/buttons.dart';
import 'button_to_calmel_case.dart';
import 'button_to_make_multi_case.dart';
import 'button_to_move_button_name_into_clipboard.dart';
import 'button_to_snake_case.dart';
import 'buttons_for_kakaotalk.dart';
import 'my_superworkers.dart';
import 'rainbow_text.dart';

class Screen_to_control_text extends StatefulWidget {
  const Screen_to_control_text({Key? key}) : super(key: key);

  @override
  State<Screen_to_control_text> createState() => _Screen_to_control_textState();
}

class _Screen_to_control_textState extends State<Screen_to_control_text> {
  final ment = '해당 스크린에서는 개발하는데 도움이 되는 기능들을 제공해주는 서비스를 제공합니다 \n\n'
      '＊"" : .';

  // _AppState appState;
  // late bool isDevelopingMode;

  late bool isDevelopingMode;

  @override
  void initState() {
    super.initState();

    isDevelopingMode = context.findAncestorStateOfType<AppState>()!.isDarkMode;
  }

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
                  child: isDevelopingMode ? Text('') : Text('go to index'.toUpperCase(), style: TextStyle(color: Colors.blueAccent)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Icon(Icons.android, color: Colors.lightBlueAccent),
            Center(child: Text("$ment", style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600))),
            const SizedBox(height: 40),
            Button_to_move_button_name_into_clipboard(text: "caretELOPMENT", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caretqlwjs@202204^", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caret!0133", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caretistrator", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caretQAZ", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caret", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caretsion", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caretkul", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caretjan", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caretitc", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caretgon", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "caretdgi", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "___________", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "___________", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: "___________", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            const SizedBox(height: 20),
            Multi_case_maker(text: '.to_multi_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '.to_multi_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '.to_multi_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '.to_multi_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '.to_multi_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '.to_multi_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '.to_multi_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Multi_case_maker(text: '.to_multi_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            const SizedBox(height: 100),
            Center(child: Rainbow_text(text: "슈퍼 스탬프", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: true)),
            const SizedBox(height: 100),
            Center(child: Rainbow_text(text: "커스텀 스탬프", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click(text: '* stamp', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            const SizedBox(height: 100),
            Center(child: Rainbow_text(text: ".toCarmelCase()", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_calmel_case(text_place_holder: '.toCarmelCase()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_calmel_case(text_place_holder: '.toCarmelCase()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_calmel_case(text_place_holder: '.toCarmelCase()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_calmel_case(text_place_holder: '.toCarmelCase()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_calmel_case(text_place_holder: '.toCarmelCase()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_calmel_case(text_place_holder: '.toCarmelCase()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_calmel_case(text_place_holder: '.toCarmelCase()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            const SizedBox(height: 100),
            Center(child: Rainbow_text(text: ".to_snake_case()", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_snake_case(text_place_holder: '.to_snake_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_snake_case(text_place_holder: '.to_snake_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_snake_case(text_place_holder: '.to_snake_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_snake_case(text_place_holder: '.to_snake_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_snake_case(text_place_holder: '.to_snake_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_snake_case(text_place_holder: '.to_snake_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_snake_case(text_place_holder: '.to_snake_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            const SizedBox(height: 100),
            Buttons_for_kakaotalk(text: "카톡 보고 스탬프", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text(text: '주석', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration: TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false)),
            const SizedBox(height: 10),
            Button_to_move_button_name_into_clipboard(text: "//DEVELOPMENT", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            const SizedBox(height: 20),
            Center(child: Rainbow_text(text: 'flutter theme color reference', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration: TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "color: Theme.of(context).cardColor", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            SizedBox(height: 20),
            Center(child: Rainbow_text(text: 'flutter collection for sample', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration: TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "for (String element in <String>['String1','String2','String3']) Text(element),", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            SizedBox(height: 20),
            Center(child: Rainbow_text(text: '____________________', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration: TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "____________________", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            SizedBox(height: 20),
            Center(child: Rainbow_text(text: 'flutter shared_freference for using mobile local storage', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration: TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, isRainbowMode: false)),
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
            SizedBox(height: 20),
            Center(child: Rainbow_text(text: 'FLUTTER PAGE ROUTING', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration: TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false)),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../main.dart';
import '../in_developing/in_developing.dart';
import 'custom_stamp_maker.dart';
import 'button_to_make_multi_case.dart';
import 'button_to_manage_schedule.dart';
import 'my_superworkers.dart';
import 'rainbow_text.dart';

class ScreenToHelpDeveloper extends StatefulWidget {
  const ScreenToHelpDeveloper({Key? key}) : super(key: key);

  @override
  State<ScreenToHelpDeveloper> createState() => _ScreenToHelpDeveloperState();
}

class _ScreenToHelpDeveloperState extends State<ScreenToHelpDeveloper> {
  final ment = '해당 스크린에서는 개발하는데 도움이 되는 기능들을 제공해주는 서비스를 제공합니다 \n\n'
      '＊"" : .';
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          Center(
            child: Container(
              color: Colors.black38,
              child: TextButton(
                clipBehavior: Clip.hardEdge,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  maximumSize: MaterialStateProperty.all(const Size(100, 50)),
                ),
                child: isDevelopingMode ? const Text('') : Text('go to index'.toUpperCase(), style: const TextStyle(color: Colors.blueAccent)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          const Icon(Icons.android, color: Colors.lightBlueAccent),
          Center(child: Text(ment, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600))),
          const Center(child: Text('검색', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w600))),
          Center(child: Rainbow_text(text: "슈퍼 스탬프", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: true)),
          ButtonToExcuteSchedulePlaned(text: "frequecy", items: const [
            "caretELOPMENT",
            "caretqlwjs@202204^",
            "caret!0133",
            "caretistrator",
            "caretQAZ",
            "caret",
            "caretsion",
            "caretkul",
            "caretjan",
            "caretitc",
            "caretgon",
            "caretdgi",
          ]),
          for (int i = 0; i < 10; i++) MultiCaseMaker(text: '.to_multi_case()', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),

          for (int i = 0; i < 10; i++) CustomStampMaker(text: 'StampMaker', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
          //LOCAL STORAGE CUSTOM STAMP 도 있으면 좋겠다// CASH 데이터를 가져오기 때문에 지워지지 않는 대신 RESET 버튼이 필요.
          ButtonToExcuteSchedulePlaned(text: "카톡 보고 스탬프", items: const ['언제쯤 될것같아?', '언제까지 될것같아?', '확인해보고 말씀드리겠습니다', '확인해보겠습니다', '5분에서 10분 정도 걸릴것 같습니다', '15분 정도 걸릴것 같습니다', '30분 정도 걸릴것 같습니다', '1시간 정도 걸릴것 같습니다', '부장님 125번 접속 시도해도 되겠습니까?', '부장님 이거 먼저 처리할까요?', '유지보수 엑셀 업데이트 해두었습니다.\n수고하셨습니다', '넵! 부장님도 잘 쉬십시오\n다음주에 뵙겠습니다!', '네 부장님 오늘도 고생하셨습니다.\n다음주에 뵙겠습니다^^.', '수고하셨습니다', '처리하였습니다', '부장님 처리했습니다']),
          ButtonToExcuteSchedulePlaned(text: "주석", items: const ['//DEVELOPMENT', '#DEVELOPMENT', "<!--DEVELOPMENT-->"]),
          ButtonToExcuteSchedulePlaned(text: "flutter theme color reference", items: const ['color: Theme.of(context).cardColor']),
          ButtonToExcuteSchedulePlaned(text: "flutter collection for sample", items: const ["for (String element in <String>['String1','String2','String3']) Text(element),"]),
        ],
      ),
    );
  }
}

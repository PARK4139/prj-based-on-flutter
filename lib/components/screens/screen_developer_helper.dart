import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../../utils/DisposalMultilineWrappingStampMaker.dart';
import '../../utils/disposal_singleline_wrapping_stamp_maker.dart';
import '../../utils/disposal_stamp_maker.dart';
import '../../utils/hardcoding_stamp_maker.dart';
import '../../utils/multi_case_maker.dart';
import '../../utils/planed_schedule_management_helper.dart';
import '../../utils/super_helper.dart';
import '../../utils/text_shirikable_stamp_maker.dart';

class ScreenDeveloperHelper extends StatefulWidget {
  const ScreenDeveloperHelper({Key? key}) : super(key: key);

  @override
  State<ScreenDeveloperHelper> createState() => _ScreenDeveloperHelperState();
}

class _ScreenDeveloperHelperState extends State<ScreenDeveloperHelper> {
  late bool isDarkMode;

  final clearButtonKey = GlobalKey();
  late Timer autoClickScheduler;
  late bool isFirstBuild;

  late Timer tickTimer;

  late DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    // isDarkMode = context.findAncestorStateOfType<AppState>()!.isDarkMode;

    BlocBuilder<MyAppStateCubit, MyAppState>(
      builder: (context, MyAppState state) {
        isDarkMode= state.isDarkMode ;
        return const Placeholder();
      },
    );
    isFirstBuild = true;
    tickTimer = Timer.periodic(const Duration(seconds: 1), onTick);
  }



  @override
  void dispose() {
    autoClickScheduler.cancel();
    tickTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    autoClickScheduler = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (isFirstBuild == true) {
          autoClick();
          isFirstBuild = false;
        }
        autoClickScheduler.cancel();
      },
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            /*앱바*/
            Container(
              color: Colors.black87,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  /*뒤로가기 버튼*/ InkWell(
                    child: const Icon(Icons.chevron_left, size: 30, color: Colors.blueAccent),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            // 검색바
            // const Center(child: Text('검색', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w600))),
            //검색 될 수 있도록 검색바 UI 먼저 만들자.

            /*버튼(버튼 클릭 시 5초 뒤 사라질 팝업 실행)*/ InkWell(
              key: clearButtonKey,
              child: const Row(
                children: [
                  Text('사용자에게 보이지 않을 버튼', style: TextStyle(color: Colors.white, fontSize: 1)),
                ],
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 2000), content: Text(MyMents.descriptionAboutScreenDeveloperHelper)));
              },
            ),

            /*멀티케이스스탬프*/
            MultiCaseMaker(text: '멀티케이스스탬프', backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),

            ReplacingStampMaker(template: 'debugSomething(도태할문자열,troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss,'',SSS])}");', deprecated: "도태할문자열"),

            /*라이브스탬프*/
            PlanedScheduleManagementHelper(title: "라이브스탬프", items: [
              TextShirikableHardCodingStampMaker(template: "_RefactoringModule${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}"),
               ReplacingStampMaker(template: 'debugSomething(도태할문자열,troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss,'',SSS])}");', deprecated: "도태할문자열"),
              ReplacingStampMaker(template: 'debugSomething("도태할문자열:\${도태할문자열}");', deprecated: "도태할문자열"), //이거 결과 테스트해보자.이상하면 지우자
              ReplacingStampMaker(template: 'printWithoutError("도태할문자열:\${도태할문자열}");', deprecated: "도태할문자열"),
              ReplacingStampMaker(template: '''
printWithoutError("_________________________________________________________________ debug s " );
printWithoutError("도태할문자열:\${도태할문자열}"); 
printWithoutError("_________________________________________________________________ debug e " );
            ''', deprecated: "도태할문자열"),

              TextShirikableHardCodingStampMaker(template: '/*텍스트*/Text("텍스트", style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.w600)'),
              TextShirikableHardCodingStampMaker(template: "/*컬렉션포문법(collection for)코드샘플*/for (String element in <String>['String1','String2','String3']) Text(element),"),
              TextShirikableHardCodingStampMaker(template: "/*컬렉션포문법(collection for)코드샘플*/for (int i=1;i<=3;i++) Image.asset('asset/images/random_numbers/\$i.png'),"),
              TextShirikableHardCodingStampMaker(template: '/*상위위젯테마컬러참조코드샘플*/color: Theme.of(context).headline1,'),
              TextShirikableHardCodingStampMaker(template: '/*빈박스코드샘플*/const SizedBox(height: 50),'),
              TextShirikableHardCodingStampMaker(template: '/*빈박스코드샘플*/Container(),'),
              TextShirikableHardCodingStampMaker(template: '/*빈박스코드샘플*/PloaceHolder(),'),
              TextShirikableHardCodingStampMaker(template: '//DEVELOPMENT'),
              TextShirikableHardCodingStampMaker(template: '#DEVELOPMENT'),
              TextShirikableHardCodingStampMaker(template: "<!--DEVELOPMENT-->"),
              TextShirikableHardCodingStampMaker(template: formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])),
              TextShirikableHardCodingStampMaker(template: formatDate(now, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss])),
              TextShirikableHardCodingStampMaker(template: formatDate(now, [yyyy, '', mm, '', dd, '_', HH, ':', nn, ':', ss])),
              TextShirikableHardCodingStampMaker(template: formatDate(now, [yyyy, '', mm, '', dd, '_', HH, '', nn, '', ss])),
              TextShirikableHardCodingStampMaker(template: formatDate(now, [yyyy, '-', mm, '-', dd])),
              TextShirikableHardCodingStampMaker(template: formatDate(now, [HH, ':', nn, ':', ss])),

            ]),

            /*멀티라인랩핑스탬프*/
            PlanedScheduleManagementHelper(title: "멀티라인랩핑스탬프", items: [
              MultilineWrappingStampMaker(prefix: "printWithoutError(", deprecated: '도태할문자열', suffix: ");"),
              MultilineWrappingStampMaker(prefix: "printWithoutError('", deprecated: '도태할문자열', suffix: "');"),
              MultilineWrappingStampMaker(prefix: "printWithoutError(\"", deprecated: '도태할문자열', suffix: "\");"),
            ]),

            /*일회용스탬프*/
            PlanedScheduleManagementHelper(title: "일회용스탬프", items: [
              for (int i = 0; i < 5; i++) DisposalStampMaker(txt: '일회용스탬프'),
            ]),

            //다회용스탬프 LOCAL STORAGE CUSTOM STAMP 도 있으면 좋겠다// CASH 데이터를 가져오기 때문에 지워지지 않는 대신 RESET 버튼이 필요.

            /*카톡보고스탬프*/
            PlanedScheduleManagementHelper(title: "카톡보고스탬프", items: [
              HardCodingStampMaker(txt: '언제쯤 될것같아?'),
              HardCodingStampMaker(txt: '언제까지 될것같아?'),
              HardCodingStampMaker(txt: '확인해보고 말씀드리겠습니다'),
              HardCodingStampMaker(txt: '확인해보겠습니다'),
              HardCodingStampMaker(txt: '5분에서 10분 정도 걸릴것 같습니다'),
              HardCodingStampMaker(txt: '15분 정도 걸릴것 같습니다'),
              HardCodingStampMaker(txt: '30분 정도 걸릴것 같습니다'),
              HardCodingStampMaker(txt: '1시간 정도 걸릴것 같습니다'),
              HardCodingStampMaker(txt: '부장님 125번 접속 시도해도 되겠습니까?'),
              HardCodingStampMaker(txt: '부장님 이거 먼저 처리할까요?'),
              HardCodingStampMaker(txt: '유지보수 엑셀 업데이트 해두었습니다.\n수고하셨습니다'),
              HardCodingStampMaker(txt: '넵! 부장님도 잘 쉬십시오\n다음주에 뵙겠습니다!'),
              HardCodingStampMaker(txt: '네 부장님 오늘도 고생하셨습니다.\n다음주에 뵙겠습니다^^.'),
              HardCodingStampMaker(txt: '수고하셨습니다'),
              HardCodingStampMaker(txt: '처리하였습니다'),
              HardCodingStampMaker(txt: '부장님 처리했습니다'),
            ]),
          ],
        ),
      ),
    );
  }

  Future<void> autoClick() async {
    RenderBox renderbox = clearButtonKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = renderbox.localToGlobal(Offset.zero);
    double x = position.dx;
    double y = position.dy;

    GestureBinding.instance.handlePointerEvent(PointerDownEvent(
      position: Offset(x, y),
    ));

    await Future.delayed(const Duration(milliseconds: 500));
    //add delay between up and down button

    GestureBinding.instance.handlePointerEvent(PointerUpEvent(
      position: Offset(x, y),
    ));
  }

  void onTick(Timer timer) {
    setState(() {
      now = DateTime.now();
      // debugSomething(now.toString(),troubleShootingId: "now20230807090513");
    });
  }

}

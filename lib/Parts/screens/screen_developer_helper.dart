import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../helpers/disposal_stamp_maker.dart';
import '../helpers/disposal_wrapping_stamp_maker.dart';
import '../helpers/multi_case_maker.dart';
import '../helpers/planed_schedule_management_helper.dart';
import '../helpers/hardcoding_stamp_maker.dart';
import '../helpers/super_helper.dart';
import '../helpers/text_shirikable_stamp_maker.dart';

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
  late DateTime now;

  @override
  void initState() {
    super.initState();
    isDarkMode = context.findAncestorStateOfType<AppState>()!.isDarkMode;
    isFirstBuild = true;
    now = DateTime.now();
  }

  @override
  void dispose() {
    autoClickScheduler.cancel();
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

            /*카톡보고스탬프*/
            PlanedScheduleManagementHelper(title: "카톡보고스탬프", items: [
              hardCodingStampMaker(txt: '언제쯤 될것같아?'),
              hardCodingStampMaker(txt: '언제까지 될것같아?'),
              hardCodingStampMaker(txt: '확인해보고 말씀드리겠습니다'),
              hardCodingStampMaker(txt: '확인해보겠습니다'),
              hardCodingStampMaker(txt: '5분에서 10분 정도 걸릴것 같습니다'),
              hardCodingStampMaker(txt: '15분 정도 걸릴것 같습니다'),
              hardCodingStampMaker(txt: '30분 정도 걸릴것 같습니다'),
              hardCodingStampMaker(txt: '1시간 정도 걸릴것 같습니다'),
              hardCodingStampMaker(txt: '부장님 125번 접속 시도해도 되겠습니까?'),
              hardCodingStampMaker(txt: '부장님 이거 먼저 처리할까요?'),
              hardCodingStampMaker(txt: '유지보수 엑셀 업데이트 해두었습니다.\n수고하셨습니다'),
              hardCodingStampMaker(txt: '넵! 부장님도 잘 쉬십시오\n다음주에 뵙겠습니다!'),
              hardCodingStampMaker(txt: '네 부장님 오늘도 고생하셨습니다.\n다음주에 뵙겠습니다^^.'),
              hardCodingStampMaker(txt: '수고하셨습니다'),
              hardCodingStampMaker(txt: '처리하였습니다'),
              hardCodingStampMaker(txt: '부장님 처리했습니다'),
            ]),

            /*데드스탬프*/ /*하드코딩스탬프*/
            PlanedScheduleManagementHelper(title: "데드스탬프", items: [
              TextShirikableStampMaker(txt: '/*임시텍스트*/Text("임시텍스트", style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.w600)'),
              TextShirikableStampMaker(txt: "/*컬렉션포문법(collection for)코드샘플*/for (String element in <String>['String1','String2','String3']) Text(element),"),
              TextShirikableStampMaker(txt: "/*컬렉션포문법(collection for)코드샘플*/for (int i=1;i<=3;i++) Image.asset('asset/images/random_numbers/\$i.png'),"),
              TextShirikableStampMaker(txt: '/*상위위젯테마컬러참조코드샘플*/color: Theme.of(context).headline1,'),
              TextShirikableStampMaker(txt: '/*빈박스코드샘플*/const SizedBox(height: 50),'),
              TextShirikableStampMaker(txt: '/*빈박스코드샘플*/Container(),'),
              TextShirikableStampMaker(txt: '/*빈박스코드샘플*/PloaceHolder(),'),
              TextShirikableStampMaker(txt: '//DEVELOPMENT'),
              TextShirikableStampMaker(txt: '#DEVELOPMENT'),
              TextShirikableStampMaker(txt: "<!--DEVELOPMENT-->"),
            ]),

            /*라이브스탬프*/
            PlanedScheduleManagementHelper(title: "라이브스탬프", items: [
              Builder(
                builder: (context) {
                  now = DateTime.now();
                  return TextShirikableStampMaker(
                    txt: "_RefactoringModule${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}",
                  );
                },
              ),
              Builder(
                builder: (context) {
                  now = DateTime.now();
                  return TextShirikableStampMaker(
                    txt: formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss]),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  now = DateTime.now();
                  return TextShirikableStampMaker(
                    txt: formatDate(now, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  now = DateTime.now();
                  return TextShirikableStampMaker(
                    txt: formatDate(now, [yyyy, '', mm, '', dd, '_', HH, ':', nn, ':', ss]),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  now = DateTime.now();
                  return TextShirikableStampMaker(
                    txt: formatDate(now, [yyyy, '', mm, '', dd, '_', HH, '', nn, '', ss]),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  now = DateTime.now();
                  return TextShirikableStampMaker(
                    txt: formatDate(now, [yyyy, '-', mm, '-', dd]),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  now = DateTime.now();
                  return TextShirikableStampMaker(
                    txt: formatDate(now, [HH, ':', nn, ':', ss]),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  now = DateTime.now();
                  return TextShirikableStampMaker(
                    txt: "_RefactoringModule${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}",
                  );
                },
              ),
            ]),

            /*랩핑스탬프*/
            PlanedScheduleManagementHelper(title: "랩핑스탬프", items: [
              DisposalWrappingStampMaker(prefix: "printWithoutError(", txt: '랩핑스탬프', suffix: ");"),
              DisposalWrappingStampMaker(prefix: "printWithoutError('", txt: '랩핑스탬프', suffix: "');"),
              DisposalWrappingStampMaker(prefix: "printWithoutError(\"", txt: '랩핑스탬프', suffix: "\");"),
            ]),

            /*일회용스탬프*/
            PlanedScheduleManagementHelper(title: "일회용스탬프", items: [
              for (int i = 0; i < 5; i++) DisposalStampMaker(txt: '일회용스탬프'),
            ]),
            //다회용스탬프 LOCAL STORAGE CUSTOM STAMP 도 있으면 좋겠다// CASH 데이터를 가져오기 때문에 지워지지 않는 대신 RESET 버튼이 필요.
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
}

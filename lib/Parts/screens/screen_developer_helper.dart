import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../helpers/custom_stamp_maker.dart';
import '../helpers/multi_case_maker.dart';
import '../helpers/planed_schedule_management_helper2.dart';
import '../helpers/super_worker.dart';
import '../helpers/planed_schedule_management_helper.dart';
import '../in_developing/tmp.dart';

class ScreenDeveloperHelper extends StatefulWidget {
  const ScreenDeveloperHelper({Key? key}) : super(key: key);

  @override
  State<ScreenDeveloperHelper> createState() => _ScreenDeveloperHelperState();
}

class _ScreenDeveloperHelperState extends State<ScreenDeveloperHelper> {
  final ment = '해당 스크린에서는 개발하는데 도움이 되는 기능들을 제공해주는 서비스를 제공합니다 \n\n개발자를 위한 스탬프 모음'
      '＊"" : .';
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();

    isDarkMode = context.findAncestorStateOfType<AppState>()!.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            /*커스텀 앱바*/
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
            Center(child: Text(ment, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600))),


            // const Center(child: Text('검색', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w600))),
            //검색 될 수 있도록 검색바 UI 먼저 만들자.mkr 반드시


            /*멀티케이스스탬프*/
            MultiCaseMaker(text: '멀티케이스스탬프', backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
            /*플러터코드스탬프*/
            PlanedScheduleManagementHelper2(text: "플러터코드스탬프", items: const [
              '/*임시텍스트*/Text("임시텍스트", style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.w600)',
              "/*컬렉션포문법(collection for)코드샘플*/for (String element in <String>['String1','String2','String3']) Text(element),",
              "/*컬렉션포문법(collection for)코드샘플*/for (int i=1;i<=3;i++) Text(i),",
              '/*상위위젯테마컬러참조코드샘플*/color: Theme.of(context).headline1,',
              '/*빈박스코드샘플*/const SizedBox(height: 50),',
              '/*빈박스코드샘플*/Container(),',
              '/*빈박스코드샘플*/PloaceHolder(),',
            ]),
            /*카톡보고스탬프*/
            PlanedScheduleManagementHelper(text: "카톡보고스탬프", items: const ['언제쯤 될것같아?', '언제까지 될것같아?', '확인해보고 말씀드리겠습니다', '확인해보겠습니다', '5분에서 10분 정도 걸릴것 같습니다', '15분 정도 걸릴것 같습니다', '30분 정도 걸릴것 같습니다', '1시간 정도 걸릴것 같습니다', '부장님 125번 접속 시도해도 되겠습니까?', '부장님 이거 먼저 처리할까요?', '유지보수 엑셀 업데이트 해두었습니다.\n수고하셨습니다', '넵! 부장님도 잘 쉬십시오\n다음주에 뵙겠습니다!', '네 부장님 오늘도 고생하셨습니다.\n다음주에 뵙겠습니다^^.', '수고하셨습니다', '처리하였습니다', '부장님 처리했습니다']),
            /*주석스탬프*/
            PlanedScheduleManagementHelper(text: "주석스탬프", items: const ['//DEVELOPMENT', '#DEVELOPMENT', "<!--DEVELOPMENT-->"]),
            /*일회용스탬프*/
            for (int i = 0; i < 5; i++) DisposalStampMaker(text: '일회용스탬프', backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 5, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
            //일회용 스탬프 UI 를 일관성있게 수정하자
            //LOCAL STORAGE CUSTOM STAMP 도 있으면 좋겠다// CASH 데이터를 가져오기 때문에 지워지지 않는 대신 RESET 버튼이 필요.
            /*하드코딩스탬프*/
            PlanedScheduleManagementHelper(text: "하드코딩스탬프", items: const ["//DEVELOPMENT", "caretqlwjs@202204^", "caret!0133", "caretistrator", "caretQAZ", "caret", "caretsion", "caretkul", "caretjan", "caretitc", "caretgon", "caretdgi"]),
            /*라이브스탬프*/
            PlanedScheduleManagementHelper(text: "라이브스탬프", items: [
              "_RefactoringModule${formatDate(DateTime.now(), [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}",
            ]),
          ],
        ),
      ),
    );
  }
}

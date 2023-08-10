import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/source/remote/netflixx_api_helper.dart';
import '../../main.dart';
import '../../utils/AutoClipboardUpdatingStampMakingHelper.dart';
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
  final autoCopyScheduler20230810134516 = GlobalKey(debugLabel: "clearButtonKey20230810134516");

  late Timer autoClickScheduler;
  late Timer tickTimer;
  late DateTime now = DateTime.now();

  late bool isFirstBuild;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _serchText = "";
  late List<Movie> moviesSearched;
  late MyAppStateCubit cubit;

  late bool isShowSearchingUserHelpingBox;

  late bool isShowLiveStamp;

  late bool isShowAutoCopyStamp;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _serchText = _searchController.text;
        debugSomething(_serchText);
      });
    });

    /*로컬 스토리지 사용해서 상태 Read*/
    // isDarkMode = context.findAncestorStateOfType<AppState>()!.isDarkMode;

    /*Bloc cubit 사용해서 상태 Read*/
    MyAppStateCubit cubit = MyAppStateCubit();
    isDarkMode = cubit.state.isDarkMode;
    moviesSearched = cubit.state.moviesDummy;

    /*Bloc cubit 사용해서 상태 Update*/
    cubit.emit(cubit.state);

    isFirstBuild = true;
    tickTimer = Timer.periodic(const Duration(seconds: 1), onTick);

    isShowSearchingUserHelpingBox = false;
    isShowLiveStamp = false;
    isShowAutoCopyStamp = false;
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
      const Duration(milliseconds: 1000),
      (timer) {
        if (isFirstBuild == true) {
          autoClick();
          isFirstBuild = false;
        }
        // autoClickScheduler.cancel();
      },
    );


    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        isShowSearchingUserHelpingBox = true;
      } else {
        isShowSearchingUserHelpingBox = false;
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade900.withOpacity(1),
        body: ScrollConfiguration(
          behavior: MyBehaviorHelper(),
          child: ListView(
            // physics: BouncingScrollPhysics(),//ListView 의 끝단에 도달하면 바운스
            //  physics: ClampingScrollPhysics(),//별로 사용하지 않을 것 같다.
            //  physics: PageScrollPhysics(),//오 페이지화해서 아주 좋다.
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              /*앱바*/
              Container(
                // color: Colors.black87,
                color: Colors.black.withOpacity(0.3),
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // /*뒤로가기 버튼*/ InkWell(
                    //   child: const Icon(Icons.chevron_left, size: 30, color: Colors.blueAccent),
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 0.1),

              /*기능검색 바*/
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  focusNode: _focusNode,
                  style: const TextStyle(color: Colors.white, fontSize: 15, height: 1), //height: 1 는 cursor 의 높이를 설정.
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 0, top: 0, left: 0, right: 0),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.3),
                    prefixIcon: GestureDetector(
                      // onTap: () {},
                      onTap: null,
                      child: const Icon(Icons.search, color: Colors.white12, size: 20),
                    ),
                    suffixIcon: GestureDetector(
                        child: const Icon(Icons.cancel, color: Colors.white12, size: 20),
                        onTap: () {
                          setState(() {
                            _searchController.clear();
                            _serchText = "";
                            _focusNode.unfocus();
                          });
                        }),
                    hintText: '기능검색',
                    hintStyle: const TextStyle(color: Colors.white),
                    labelStyle: const TextStyle(color: Colors.white),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all((Radius.circular(7)))),
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all((Radius.circular(7)))),
                    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all((Radius.circular(7)))),
                  ),
                ),
              ),

              const SizedBox(height: 0.1),

              /*기능검색 반응확인 바*/
              if (isShowSearchingUserHelpingBox == true)
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.grey.shade900.withOpacity(0.4),
                          color: Colors.red.shade900.withOpacity(0.4),
                          borderRadius: const BorderRadius.all((Radius.circular(7))),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ],
                ),

              /*기능검색 사용자 가이드 바*/
              if (isShowSearchingUserHelpingBox == true)
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.grey.shade900.withOpacity(0.4),
                          color: Colors.red.shade900.withOpacity(0.4),
                          borderRadius: const BorderRadius.all((Radius.circular(7))),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ],
                ),

              /*Auto Schedule 실행 버튼*/ InkWell(
                key: autoCopyScheduler20230810134516,
                child: const Row(
                  children: [
                    Text('사용자에게 보이지 않을 버튼', style: TextStyle(color: Colors.white, fontSize: 1)),
                  ],
                ),
                onTap: ()   {

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 2000), content: Text(MyMents.descriptionAboutScreenDeveloperHelper)));

                  },
              ),

              const SizedBox(height: 1),

              /*멀티케이스스탬프*/
              MultiCaseMaker(text: '멀티케이스스탬프', backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),

              /*스냅샷스탬프*/
              PlanedScheduleManagementHelper(title: "스냅샷스탬프", items: [
                TextShirikableHardCodingStampMaker(txt: "_RefactoringModule${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}"),
                ReplacingStampMaker(template: 'debugSomething(도태할문자열,troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss, '', SSS])}");', deprecated: "도태할문자열"),
                ReplacingStampMaker(template: 'debugSomething("도태할문자열:\${도태할문자열}");', deprecated: "도태할문자열"), //이거 결과 테스트해보자.이상하면 지우자
                ReplacingStampMaker(template: 'printWithoutError("도태할문자열:\${도태할문자열}");', deprecated: "도태할문자열"),
                ReplacingStampMaker(template: '''
printWithoutError("_________________________________________________________________ debug s " );
printWithoutError("도태할문자열:\${도태할문자열}"); 
printWithoutError("_________________________________________________________________ debug e " );
                ''', deprecated: "도태할문자열"),

                TextShirikableHardCodingStampMaker(txt: '/*텍스트*/Text("텍스트", style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.w600)'),
                TextShirikableHardCodingStampMaker(txt: "/*컬렉션포문법(collection for)코드샘플*/for (String element in <String>['String1','String2','String3']) Text(element),"),
                TextShirikableHardCodingStampMaker(txt: "/*컬렉션포문법(collection for)코드샘플*/for (int i=1;i<=3;i++) Image.asset('asset/images/random_numbers/\$i.png'),"),
                TextShirikableHardCodingStampMaker(txt: '/*상위위젯테마컬러참조코드샘플*/color: Theme.of(context).headline1,'),
                TextShirikableHardCodingStampMaker(txt: '/*빈박스코드샘플*/const SizedBox(height: 50),'),
                TextShirikableHardCodingStampMaker(txt: '/*빈박스코드샘플*/Container(),'),
                TextShirikableHardCodingStampMaker(txt: '/*빈박스코드샘플*/PloaceHolder(),'),
                TextShirikableHardCodingStampMaker(txt: '//DEVELOPMENT'),
                TextShirikableHardCodingStampMaker(txt: '#DEVELOPMENT'),
                TextShirikableHardCodingStampMaker(txt: "<!--DEVELOPMENT-->"),
                TextShirikableHardCodingStampMaker(txt: formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])),
                TextShirikableHardCodingStampMaker(txt: formatDate(now, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss])),
                TextShirikableHardCodingStampMaker(txt: formatDate(now, [yyyy, '', mm, '', dd, '_', HH, ':', nn, ':', ss])),
                TextShirikableHardCodingStampMaker(txt: formatDate(now, [yyyy, '', mm, '', dd, '_', HH, '', nn, '', ss])),
                TextShirikableHardCodingStampMaker(txt: formatDate(now, [yyyy, '-', mm, '-', dd])),
                TextShirikableHardCodingStampMaker(txt: formatDate(now, [HH, ':', nn, ':', ss])),
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

              /*라이브스탬프*/
              //PlanedScheduleManagementHelper() 에 넣으려면 bloc 에 객체를 통째로 저장하면 메모리 성능은 비효율적이어도 작동은 할 것 같다.
              LiveStamps(onTap: _toogleIsShowLifeStamp, isShowLiveStamp: isShowLiveStamp, now: now),

              /*오토카피스탬프*/
              AutoCopyStamps(onTap: _toogleIsShowAutoCopyStamp, isShowAutoCopyStamp: isShowAutoCopyStamp, now: now),

               ],
          ),
        ),
      ),
    );
  }

  Future<void> autoClick() async {
    RenderBox renderbox = autoCopyScheduler20230810134516.currentContext!.findRenderObject() as RenderBox;
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

  void _toogleIsShowLifeStamp() {
setState(() {
  isShowLiveStamp = !isShowLiveStamp;
  debugSomething(isShowLiveStamp);
});
  }

  void _toogleIsShowAutoCopyStamp() {
setState(() {
  isShowAutoCopyStamp = !isShowAutoCopyStamp;
  debugSomething(isShowAutoCopyStamp);
});
  }
}

class LiveStamps extends StatelessWidget {
  final GestureTapCallback? onTap;

  bool isShowLiveStamp;

  DateTime now;

  LiveStamps({super.key, required this.onTap, required this.isShowLiveStamp, required this.now});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(



            decoration: BoxDecoration(
              color: Colors.black38.withOpacity(0.5),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
              // border:   Border(
              //   top: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
              //   bottom: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
              //   left: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
              //   right: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
              // ),
            ),




            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),

            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(

                    selectionColor: Colors.blueAccent,
                    // overflow: TextOverflow.clip,//오버플로우 텍스트를 잘라내어 보이지 않도록 렌더링
                    overflow: TextOverflow.fade, //오버플로우 텍스트를 그라데이션효과로 사라지도록 렌더링
                    // overflow: TextOverflow.ellipsis,//오버플로우 텍스트를 ...으로 렌더링
                    // overflow: TextOverflow.visible,//오버플로우 텍스트를 보이도록 렌더링
                    maxLines: 100, //100 줄까지만 보이도록
                    // strutStyle: const StrutStyle(fontSize: 9.0),//이거 어디에 쓰이는지?..
                    text: TextSpan(text: "라이브스탬프", style: MyTextStyles.textStyle20230719),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isShowLiveStamp == true)
          SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: 'debugSomething(도태할문자열,troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss, '', SSS])}");', deprecated: "도태할문자열")),
        if (isShowLiveStamp == true)           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: 'debugSomething("도태할문자열",troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss, '', SSS])}");', deprecated: "도태할문자열")),
        if (isShowLiveStamp == true)           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: 'debugSomething(\'도태할문자열\',troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss, '', SSS])}");', deprecated: "도태할문자열")),
        if (isShowLiveStamp == true) //           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: 'printSeperatorWithoutMkr(txt:  "도태할문자열 s");', deprecated: "도태할문자열")),
          if (isShowLiveStamp == true) //           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: 'printSeperatorWithoutMkr(txt:  "도태할문자열 e");', deprecated: "도태할문자열")),
            if (isShowLiveStamp == true)           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: 'printSeperatorWithoutMkr(txt:  "도태할문자열 s");\nprintSeperatorWithoutMkr(txt:  "도태할문자열 e");', deprecated: "도태할문자열")),
        if (isShowLiveStamp == true)           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss]), deprecated: '도태할문자열')),
        if (isShowLiveStamp == true)           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: '`ai ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
        if (isShowLiveStamp == true)           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: '``ai ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
        if (isShowLiveStamp == true)           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: '`ani ai${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
        if (isShowLiveStamp == true)           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: '`ani ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
      ],
    );
  }
}
class AutoCopyStamps extends StatelessWidget {
  final GestureTapCallback? onTap;

  bool isShowAutoCopyStamp;

  DateTime now;

  AutoCopyStamps({super.key, required this.onTap, required this.isShowAutoCopyStamp, required this.now});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(



            decoration: BoxDecoration(
              color: Colors.black38.withOpacity(0.5),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
              // border:   Border(
              //   top: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
              //   bottom: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
              //   left: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
              //   right: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
              // ),
            ),


            width: MediaQuery.of(context).size.width,  //폭 설정
            padding: const EdgeInsets.all(10),

            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(
                    selectionColor: Colors.blueAccent,
                    // overflow: TextOverflow.clip,//오버플로우 텍스트를 잘라내어 보이지 않도록 렌더링
                    overflow: TextOverflow.fade, //오버플로우 텍스트를 그라데이션효과로 사라지도록 렌더링
                    // overflow: TextOverflow.ellipsis,//오버플로우 텍스트를 ...으로 렌더링
                    // overflow: TextOverflow.visible,//오버플로우 텍스트를 보이도록 렌더링
                    maxLines: 100, //100 줄까지만 보이도록
                    text: TextSpan(text: "오토카피스탬프", style: MyTextStyles.textStyle20230719),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isShowAutoCopyStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss]), deprecated: '도태할문자열')),
        if (isShowAutoCopyStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: '`ai ${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
        if (isShowAutoCopyStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: '``ai ${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
        if (isShowAutoCopyStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: 'clearButtonKey${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
        if (isShowAutoCopyStamp == true)
          SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: 'final clearButtonKey${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])} = GlobalKey(debugLabel: "clearButtonKey${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}");', deprecated: '도태할문자열')),
      ],
    );
  }
}

import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';

import '../../data/source/remote/netflixx_api_helper.dart';
import '../../main.dart';
import '../../tmp/tmp.dart';
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
  @override
  String toStringScreenDeveloperHelperState() {
    return '_ScreenDeveloperHelperState{isDarkMode: $isDarkMode, '
        'remoteConnection20230810134516: $remoteConnection20230810134516,'
        ' remoteConnection20230813125516: $remoteConnection20230813125516,'
        ' remoteConnection20230812222003475: $remoteConnection20230812222003475, '
        'autoClickScheduler: $autoClickScheduler, tickTimer: $tickTimer, now: $now, isFirstBuild: $isFirstBuild, _searchController: $_searchController, _focusNodeSearch: $_focusNodeSearch, _searchText: $_searchText, _previousSearchText: $_previousSearchText, moviesSearched: $moviesSearched, cubit: $cubit, isVisiableSearchingUserHelpingBox: $isVisiableSearchingUserHelpingBox, isVisiableLiveStamp: $isVisiableLiveStamp, isVisiableAutoCopyStamp: $isVisiableAutoCopyStamp, isVisiableMyRandomSchedule: $isVisiableMyRandomSchedule, localStorage: $localStorage, checkBoxesState: $checkBoxesState, rows: $rows, autoIds: $autoIds, index: $index, isVisiableReportingStamp: $isVisiableReportingStamp, isVisiableDisposableStamp: $isVisiableDisposableStamp, _currentFocusNode: $_currentFocusNode, _focusNodeNoWhere: $_focusNodeNoWhere, isFocusNodeStable: $isFocusNodeStable, yyyymmddHHnnssSSS: $yyyymmddHHnnssSSS, isClickedOnce: $isFirstClicked}';
  }

  late bool isDarkMode;
  final GlobalKey remoteConnection20230810134516 = GlobalKey(debugLabel: "remoteButtonConnection20230810134516"); //의도된 화면으로 라우팅되면 화면기능을 묘사해주는 기능
  final GlobalKey remoteConnection20230813125516 = GlobalKey(debugLabel: "remoteButtonConnection20230813125516"); //검색박스 reset 기능
  final GlobalKey remoteConnection20230812222003475 = GlobalKey(debugLabel: "remoteButtonConnection20230812222003475");

  late Timer autoClickScheduler;
  late Timer tickTimer;
  late DateTime now = DateTime.now();

  late bool isFirstBuild;

  final TextEditingController _searchController = TextEditingController();
  late final FocusNode _focusNodeSearch;

  String _searchText = "";
  String _previousSearchText = "";

  late List<Movie> moviesSearched;
  late MyAppStateCubit cubit;

  late bool isVisiableSearchingUserHelpingBox;

  late bool isVisiableLiveStamp;

  late bool isVisiableAutoCopyStamp;

  late bool isVisiableMyRandomSchedule;

  // late bool isCheckboxChecked;

  late final LocalStorage localStorage;

  late Map<String, bool> checkBoxesState = {};

  List<Row> rows = [];

  late AutoManagerableIdMaker autoIds;
  late int index;

  late bool isVisiableReportingStamp;

  late bool isVisiableDisposableStamp;

  late FocusNode _currentFocusNode;
  late FocusNode _focusNodeNoWhere;

  var isFocusNodeStable = true;

  String yyyymmddHHnnssSSS = formatDate(DateTime.now(), [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss, '', SSS]);

  bool isFirstClicked = false;

  // final TextEditingController _textControllerNoWhere = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
        debugSomething(_searchText, troubleShootingId: "_searchText");
        // _focusNode.requestFocus();
      });
    });

    /*로컬 스토리지 사용해서 상태 Read*/
    // isDarkMode = context.findAncestorStateOfType<AppState>()!.isDarkMode;

    /*Bloc cubit 사용해서 상태 Read*/
    // BlocBuilder<MyAppStateCubit, MyAppState>(
    //   builder: (context, MyAppState state) {
    //     isDarkMode = state.isDarkMode;
    //     return Placeholder();
    //   },
    // );

    /*Bloc cubit 사용해서 상태 Read*/
    MyAppStateCubit cubit = MyAppStateCubit();
    isDarkMode = cubit.state.isDarkMode;
    autoIds = cubit.state.autoIds;
    index = autoIds.next();

    /*Bloc cubit 사용해서 상태 Update*/
    cubit.emit(cubit.state);

    isFirstBuild = true;
    tickTimer = Timer.periodic(const Duration(seconds: 1), onTick);

    isVisiableSearchingUserHelpingBox = false;
    isVisiableLiveStamp = false;
    isVisiableAutoCopyStamp = false;
    isVisiableMyRandomSchedule = false;
    isVisiableReportingStamp = false;
    isVisiableDisposableStamp = false;

    /*로컬 스토리지 사용해서 상태 create (위젯트리 상위 위치)*/
    localStorage = LocalStorage('localStorage202308120106.foo');
    for (int index = 0; index <= 20; index++) {
      if (localStorage.getItem("checkBox${index}State") != null) {
        /*로컬 스토리지 사용해서 상태 Read*/
        checkBoxesState["checkBox${index}State"] = localStorage.getItem("checkBox${index}State");
      } else {
        /*로컬 스토리지 사용해서 상태 update*/
        checkBoxesState["checkBox${index}State"] = false;
        localStorage.setItem("checkBox${index}State", checkBoxesState["checkBox${index}State"]);
      }
    }

    /*로컬 스토리지 사용해서 상태 Read (위젯트리 하위 위치)*/
    // localStorage = LocalStorage('localStorage202308120106.foo');
    for (int index = 0; index <= 20; index++) {
      checkBoxesState["checkBox${index}State"] = localStorage.getItem("checkBox${index}State");
    }
    // debugHelper(

    /*로컬 스토리지 사용해서 상태 Read (위젯트리 하위 위치)*/
    // localStorage = LocalStorage('localStorage202308120106.foo');
    // for (int index = 0; index <= 20; index++) {
    //   checkBoxesState["checkBox${index}State"] = false;
    //   localStorage.setItem("checkBox${index}State", checkBoxesState["checkBox${index}State"]);
    // }
    // debugSomething(checkBoxesState["checkBox1State"], troubleShootingId: "202308120121");

    // localStorage = LocalStorage('foo.foo');
    // setState(() {
    //   if (localStorage.getItem('checkBoxState20230812003902') == null) {
    // isCheckboxChecked = false;
    //     localStorage.setItem('checkBoxState20230812003902', isCheckboxChecked);
    //   } else {
    //     isCheckboxChecked = localStorage.getItem('checkBoxState20230812003902');
    //   }
    // });

    _focusNodeSearch = FocusNode();
    _currentFocusNode = _focusNodeSearch;
    _focusNodeNoWhere = FocusNode();
  }

  @override
  void dispose() {
    _focusNodeSearch.dispose(); //포커스 노드 dispose() 하면 안된다 된다?
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
          onClickViaRemoteConnection20230810134516();
          isFirstBuild = false;
        }
        // autoClickScheduler.cancel();
      },
    );

    _focusNodeSearch.addListener(() {
      if (_focusNodeSearch.hasFocus) {
        // if (_focusNodeNoWhere.hasFocus) {
        //   isFocusNodeStable = false;
        // }
        isVisiableSearchingUserHelpingBox = true;
      } else {
        isVisiableSearchingUserHelpingBox = false;
      }
    });

    _focusNodeNoWhere.addListener(() {
      if (_focusNodeNoWhere.hasFocus) {
        // _focusNodeNoWhere.unfocus();
        FocusScope.of(context).requestFocus(_focusNodeSearch);
      }
    });

    return SafeArea(
      child: Scaffold(
        floatingActionButton: InkWell(
          child: const Icon(
            Icons.bug_report,
            color: Colors.red,
            size: 40,
          ),
          onTap: () {
            String result = '';
            for (int i = 0; i < 20; i++) {
              result = '${result}checkBoxfesState["checkBox${i}State"]: ${checkBoxesState["checkBox${i}State"]} \n';
            }
            result = result + toStringScreenDeveloperHelperState();

            setState(() {});
            alertHelper(context, result);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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

              /*Auto Schedule 실행 버튼*/ InkWell(
                key: remoteConnection20230810134516,
                child: const Text('Auto Schedule 실행 버튼', style: TextStyle(color: Colors.transparent, fontSize: 1)),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 2000), content: Text(MyMents.descriptionAboutScreenDeveloperHelper)));
                },
              ),
              const SizedBox(height: 1),

              /*빽팁명령어 입력 바*/
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  // autofocus: true,//포커스를 가장 처음 이 TextField() 위젯으로 설정, 자판이 바로 나오지 않도록 주석처리
                  focusNode: _focusNodeSearch,
                  style: const TextStyle(color: Colors.white, fontSize: 15, height: 1), //height: 1 는 cursor 의 높이를 설정.
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 0, top: 0, left: 0, right: 0),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.3),
                    prefixIcon: GestureDetector(
                      onTap: null,
                      child: const Icon(Icons.search, color: Colors.white12, size: 20),
                    ),
                    suffixIcon: GestureDetector(
                        key: remoteConnection20230813125516,
                        child: const Icon(Icons.cancel, color: Colors.white12, size: 20),
                        onTap: () {
                          setState(() {
                            _searchController.clear();
                            _searchText = "";
                            _focusNodeSearch.unfocus();
                            // FocusScope.of(context).requestFocus(_focusNode);
                            isVisiableSearchingUserHelpingBox = false;
                            isVisiableLiveStamp = false;
                            isVisiableAutoCopyStamp = false;
                            isVisiableMyRandomSchedule = false;
                            isVisiableReportingStamp = false;
                            isVisiableDisposableStamp = false;
                          });
                        }),
                    hintText: '빽팁명령어',
                    // hintStyle: const TextStyle(color: Colors.white),
                    // hintStyle: MyTextStyles.textStyle4.copyWith(fontSize: 15),
                    hintStyle: const TextStyle(fontSize: 15, color: Colors.white70, fontWeight: FontWeight.w100),
                    // labelStyle: const TextStyle(color: Colors.white),
                    // labelStyle: MyTextStyles.textStyle4.copyWith(fontSize: 15),
                    labelStyle: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                  ),
                ),
              ),
              /*눈에보이지 않을 텍스트필드*/ /*focustNode 재귀이동처리용*/
              SizedBox(
                height: 0,
                width: 0,
                child: TextField(
                  focusNode: _focusNodeNoWhere,
                  // controller: _textControllerNoWhere,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width, height: 1),

              /*기능검색결과2*/
              if (isVisiableSearchingUserHelpingBox == true)
                Stack(
                  children: [
                    /*기능검색결과 색상상태 바*/
                    Transform.translate(
                      offset: Offset(0, MediaQuery.of(context).size.height * 0.01),
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          // color: Colors.grey.shade900.withOpacity(0.4),
                          color: Colors.red.withOpacity(0.4),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(7),
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                        ),
                        child: SizedBox(height: MediaQuery.of(context).size.height * 0.03, child: const LinearProgressIndicator()),
                      ),
                    ),
                    Builder(builder: (context) {
                      if (_searchText == null) {
                        _previousSearchText = "foo";
                        debugSomething("", troubleShootingId: "_searchText == null");
                        // _focusNodeSearch.unfocus();
                        // _focusNodeSearch.requestFocus();
                        // _currentFocusNode = _focusNodeSearch;
                        // isVisiableSearchingUserHelpingBox = true;

                        // _focusNodeSearch.unfocus();
                        // FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        // if (_focusNodeNoWhere.hasFocus) {
                        //   FocusScope.of(context).requestFocus(_focusNodeSearch);
                        // }
                        isVisiableSearchingUserHelpingBox = true;
                        FocusScope.of(context).requestFocus(_focusNodeNoWhere);

                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade900.withOpacity(0.4),
                            color: Colors.black12.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(7),
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                          child: Center(child: Text(_searchText, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                        );
                      } else if (_searchText == "debug") {
                        _previousSearchText = _searchText;
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade900.withOpacity(0.4),
                            color: Colors.blue.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(7),
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                          child: Center(child: Text(_searchText, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                        );
                      } else if (_searchText == "love") {
                        _previousSearchText = _searchText;
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade900.withOpacity(0.4),
                            color: Colors.pink.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(7),
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                          child: Center(child: Text(_searchText, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                        );
                      } else if (_searchText == "wrong") {
                        _previousSearchText = _searchText;
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade900.withOpacity(0.4),
                            color: Colors.red.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(7),
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                          child: Center(child: Text(_searchText, style: MyTextStyles.textStyle4.copyWith(fontSize: 20))),
                        );
                      } else if (_searchText == "correct") {
                        _previousSearchText = _searchText;
                        // FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade900.withOpacity(0.4),
                            color: Colors.green.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(7),
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                          child: Center(child: Text(_searchText, style: MyTextStyles.textStyle4.copyWith(fontSize: 20))),
                        );
                      } else if (_searchText == "`unfold" || _searchText == "`extend") {
                        _previousSearchText = _searchText;

                        isVisiableSearchingUserHelpingBox = false;
                        isVisiableLiveStamp = true;
                        isVisiableAutoCopyStamp = true;
                        isVisiableMyRandomSchedule = true;
                        isVisiableReportingStamp = true;
                        isVisiableDisposableStamp = true;
                        FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade900.withOpacity(0.4),
                            color: Colors.green.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(7),
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                          child: Center(child: Text(_searchText, style: MyTextStyles.textStyle4.copyWith(fontSize: 20))),
                        );
                      } else if (_searchText.contains("`live")) {
                        _previousSearchText = _searchText;

                        isVisiableSearchingUserHelpingBox = false;
                        isVisiableLiveStamp = true;
                        isVisiableAutoCopyStamp = false;
                        isVisiableMyRandomSchedule = false;
                        isVisiableReportingStamp = false;
                        isVisiableDisposableStamp = false;
                        FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        return Container();
                      } else if (_searchText.contains("`auto")) {
                        _previousSearchText = _searchText;

                        isVisiableSearchingUserHelpingBox = false;
                        isVisiableLiveStamp = false;
                        isVisiableAutoCopyStamp = true;
                        isVisiableMyRandomSchedule = false;
                        isVisiableReportingStamp = false;
                        isVisiableDisposableStamp = false;
                        FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        return Container();
                      } else if (_searchText.contains("`random")) {
                        _previousSearchText = _searchText;

                        isVisiableSearchingUserHelpingBox = false;
                        isVisiableLiveStamp = false;
                        isVisiableAutoCopyStamp = false;
                        isVisiableMyRandomSchedule = true;
                        isVisiableReportingStamp = false;
                        isVisiableDisposableStamp = false;
                        FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        return Container();
                      } else if (_searchText.contains("`report")) {
                        _previousSearchText = _searchText;

                        isVisiableSearchingUserHelpingBox = false;
                        isVisiableLiveStamp = false;
                        isVisiableAutoCopyStamp = false;
                        isVisiableMyRandomSchedule = false;
                        isVisiableReportingStamp = true;
                        isVisiableDisposableStamp = false;
                        FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        return Container();
                      } else if (_searchText == "`disposal") {
                        _previousSearchText = _searchText;

                        // isVisiableSearchingUserHelpingBox = false;
                        isVisiableLiveStamp = false;
                        isVisiableAutoCopyStamp = false;
                        isVisiableMyRandomSchedule = false;
                        isVisiableReportingStamp = false;
                        isVisiableDisposableStamp = true;
                        // FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        return Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                // color: Colors.grey.shade900.withOpacity(0.4),
                                color: Colors.green.withOpacity(0.4),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(7),
                                  topLeft: Radius.circular(7),
                                  bottomLeft: Radius.circular(7),
                                  bottomRight: Radius.circular(7),
                                ),
                              ),
                              child: Center(child: Text(_searchText, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                            ),
                          ],
                        );
                      } else if (_searchText == "`ti") {
                        _previousSearchText = _searchText;

                        yyyymmddHHnnssSSS = formatDate(DateTime.now(), [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss, '', SSS]);
                        FlutterClipboard.copy(yyyymmddHHnnssSSS).then((value) {
                          debugSomethingWithoutMent('copied : $yyyymmddHHnnssSSS');
                        });
                        return GestureDetector(
                          // onTap: () {
                          // setState(() {
                          //   yyyymmddHHnnssSSS = formatDate(DateTime.now(), [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss, '', SSS]);
                          // });
                          // FlutterClipboard.copy(yyyymmddHHnnssSSS).then((value) {
                          //   debugSomethingWithoutMent('copied : $yyyymmddHHnnssSSS');
                          // });
                          // },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              // color: Colors.grey.shade900.withOpacity(0.4),
                              color: Colors.green.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(7),
                                topLeft: Radius.circular(7),
                                bottomLeft: Radius.circular(7),
                                bottomRight: Radius.circular(7),
                              ),
                            ),
                            child: Center(child: Text(yyyymmddHHnnssSSS, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                          ),
                        );
                      } else if (_searchText == "cls") {
                        _previousSearchText = _searchText;

                        isVisiableSearchingUserHelpingBox = false;
                        isVisiableLiveStamp = false;
                        isVisiableAutoCopyStamp = false;
                        isVisiableMyRandomSchedule = false;
                        isVisiableReportingStamp = false;
                        isVisiableDisposableStamp = false;
                        FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade900.withOpacity(0.4),
                            color: Colors.black12.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(7),
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                          child: Center(child: Text(_searchText, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                        );
                      } else if (_searchText == "`multi") {
                        // alertHelper(context, "mkr");


                        _previousSearchText = _searchText;
                        if (_previousSearchText == _searchText) {
                          if (isFirstClicked == false) {
                            onClickViaRemoteConnection20230812222003475();
                            isFirstClicked = true;
                            // alertHelper(context, isFirstClicked.toString());
                            // debugSomething(isFirstClicked);
                          }
                        } else {
                          isFirstClicked = false;
                        }
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              // color: Colors.grey.shade900.withOpacity(0.4),
                              color: Colors.yellow.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(7),
                                topLeft: Radius.circular(7),
                                bottomLeft: Radius.circular(7),
                                bottomRight: Radius.circular(7),
                              ),
                            ),
                            child: Center(child: Text(_searchText, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                          ),
                        );
                      } else if (_searchText == "`fold" || _searchText == "`reset") {
                        _previousSearchText = _searchText;
                        if (_previousSearchText == _searchText) {
                          if (isFirstClicked == false) {
                            onClickViaRemoteConnection20230813125516();
                            isFirstClicked = true;
                          }
                        } else {
                          isFirstClicked = false;
                        }

                        isVisiableSearchingUserHelpingBox = true;
                        isVisiableLiveStamp = false;
                        isVisiableAutoCopyStamp = false;
                        isVisiableMyRandomSchedule = false;
                        isVisiableReportingStamp = false;
                        isVisiableDisposableStamp = false;

                        // FocusScope.of(context).requestFocus(_focusNodeNoWhere);
                        return GestureDetector(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              // color: Colors.grey.shade900.withOpacity(0.4),
                              color: Colors.black12.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(7),
                                topLeft: Radius.circular(7),
                                bottomLeft: Radius.circular(7),
                                bottomRight: Radius.circular(7),
                              ),
                            ),
                            child: Center(child: Text(_searchText, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                          ),
                        );
                      } else {
                        _previousSearchText = _searchText;
                        return GestureDetector(
                          onTap: () {
                            FlutterClipboard.copy(_searchText).then((value) {
                              debugSomethingWithoutMent('copied : $_searchText');
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              // color: Colors.grey.shade900.withOpacity(0.4),
                              color: Colors.black12.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(7),
                                topLeft: Radius.circular(7),
                                bottomLeft: Radius.circular(7),
                                bottomRight: Radius.circular(7),
                              ),
                            ),
                            child: Center(child: Text(_searchText, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                          ),
                        );
                      }
                    }),
                  ],
                ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              /*기능검색결과3*/
              // if (isVisiableSearchingUserHelpingBox == true)
              //   Column(
              //     children: [
              //       SizedBox(
              //         height: MediaQuery.of(context).size.height * 0.1,
              //         width: MediaQuery.of(context).size.width,
              //         child: Container(
              //           decoration: BoxDecoration(
              //             // color: Colors.grey.shade900.withOpacity(0.4),
              //             color: Colors.red.shade900.withOpacity(0.4),
              //             borderRadius: const BorderRadius.only(
              //               topRight: Radius.circular(7),
              //               topLeft: Radius.circular(7),
              //               bottomLeft: Radius.circular(7),
              //               bottomRight: Radius.circular(7),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              //     ],
              //   ),

              /*멀티케이스스탬프*/
              MultiCaseMaker(key: remoteConnection20230812222003475, text: '멀티케이스스탬프', color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
              SizedBox(width: MediaQuery.of(context).size.width, height: 1),

              /*일회용스탬프*/
              PlanedScheduleManagementHelper(title: "일회용스탬프", items: [
                for (int i = 0; i < 5; i++) SizedBox(width: MediaQuery.of(context).size.width, child: DisposalStampMaker(txt: '일회용스탬프')),
              ]),
              SizedBox(width: MediaQuery.of(context).size.width, height: 1),

              /*멀티라인랩핑스탬프*/
              PlanedScheduleManagementHelper(title: "멀티라인랩핑스탬프", items: [
                MultilineWrappingStampMaker(prefix: "printWithoutError(", deprecated: '도태할문자열', suffix: ");"),
                MultilineWrappingStampMaker(prefix: "printWithoutError('", deprecated: '도태할문자열', suffix: "');"),
                MultilineWrappingStampMaker(prefix: "printWithoutError(\"", deprecated: '도태할문자열', suffix: "\");"),
              ]),
              SizedBox(width: MediaQuery.of(context).size.width, height: 1),

              /*스냅샷스탬프*/
              PlanedScheduleManagementHelper(title: "스냅샷스탬프", items: [
                TextShirikableHardCodingStampMaker(txt: "_RefactoringModule${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}"),
                ReplacingStampMaker(template: 'debugSomething(도태할문자열,troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss, '', SSS])}");', deprecatedWord: "도태할문자열"),
                ReplacingStampMaker(template: 'debugSomething("도태할문자열:\${도태할문자열}");', deprecatedWord: "도태할문자열"), //이거 결과 테스트해보자.이상하면 지우자
                ReplacingStampMaker(template: 'printWithoutError("도태할문자열:\${도태할문자열}");', deprecatedWord: "도태할문자열"),
                ReplacingStampMaker(template: '''
printWithoutError("_________________________________________________________________ debug s " );
printWithoutError("도태할문자열:\${도태할문자열}"); 
printWithoutError("_________________________________________________________________ debug e " );
                ''', deprecatedWord: "도태할문자열"),
                //           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: 'printSeperatorWithoutMkr(txt:  "도태할문자열 s");', deprecated: "도태할문자열")),
                //           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: 'printSeperatorWithoutMkr(txt:  "도태할문자열 e");', deprecated: "도태할문자열")),
                SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: 'printSeperatorWithoutMkr(txt:  "도태할문자열 s");\nprintSeperatorWithoutMkr(txt:  "도태할문자열 e");', deprecatedWord: "도태할문자열")),
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
              SizedBox(width: MediaQuery.of(context).size.width, height: 0.5),
              SizedBox(width: MediaQuery.of(context).size.width, height: 1),

              //다회용스탬프 LOCAL STORAGE CUSTOM STAMP 도 있으면 좋겠다// CASH 데이터를 가져오기 때문에,지우고 싶을 때 지우는 RESET 버튼이 필요.

              /*라이브스탬프*/
              FoldableStampsContainerMaker(
                title: "라이브스탬프",
                items: [
                  if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: 'debugSomething(도태할문자열,troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss, '', SSS])}");', deprecatedWord: "도태할문자열")),
                  if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: 'debugSomething("도태할문자열",troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss, '', SSS])}");', deprecatedWord: "도태할문자열")),
                  if (isVisiableLiveStamp == true)
                    SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: 'debugSomething(\'도태할문자열\',troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss, '', SSS])}");', deprecatedWord: "도태할문자열")),
                  if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss]), deprecatedWord: '도태할문자열')),
                  if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: '`ai ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
                  if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: '``ai ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
                  if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: '`ani ai${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
                  if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: '`ani ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
                  if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: ' troubleShootingId: ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
                ],
                onTap: _toogleIsShowLifeStamp,
                isVisiable: isVisiableLiveStamp,
                now: now,
              ),
              SizedBox(width: MediaQuery.of(context).size.width, height: 1),

              /*오토카피스탬프*/
              FoldableStampsContainerMaker(
                title: "오토카피스탬프",
                items: [
                  if (isVisiableAutoCopyStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss]), deprecated: '도태할문자열')),
                  if (isVisiableAutoCopyStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: '\"${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}\"', deprecated: '도태할문자열')),
                  if (isVisiableAutoCopyStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: '`ai ${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
                  if (isVisiableAutoCopyStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: '``ai ${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
                  if (isVisiableAutoCopyStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: AutoClipboardUpdatingStampMakingHelper(template: 'clearButtonKey${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}', deprecated: '도태할문자열')),
                  if (isVisiableAutoCopyStamp == true)
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: AutoClipboardUpdatingStampMakingHelper(template: 'var clearButtonKey${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])} = GlobalKey(debugLabel: "clearButtonKey${formatDate(now, [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss])}");', deprecated: '도태할문자열'))
                ],
                onTap: _toogleIsShowAutoCopyStamp,
                isVisiable: isVisiableAutoCopyStamp,
                now: now,
              ),
              SizedBox(width: MediaQuery.of(context).size.width, height: 1),

              /*운동잠정계획스케쥴*/
              Builder(builder: (context) {
                final List<String> schedules = ['팔 약간 벌려 높이뛰기//위에서 볼때 w 가 되도록', '운동랜덤스케쥴', '박스 스쿼트 9회 1set//박기량이 하던 운동', '데드리프트 9회 1set', '벤치프레스 9회 1set', '팔굽혀펴기 9회 1set', '런지 9회 1set', '철봉 9회 1set', '푸쉬 업  9회 1set'];

                // while (index != schedules.length) {
                //   rows.add(
                //     Row(children: [
                //       HardCodingStampMaker(txt: schedules[index]),
                //       Container(
                //         color: MyColors.black12,
                //         child: GestureDetector(
                //           onTap: () {
                //             onToogleCheckBoxState(checkBoxKey: "checkBox${index}State");
                //           },
                //           child: checkBoxesState["checkBox${index}State"] == true
                //               ? const Icon(Icons.check_box_outlined, color: Colors.lightBlueAccent)
                //               : Icon(
                //                   Icons.check_box_outline_blank,
                //                   color: MyColors.lightBlueShade50,
                //                 ),
                //         ),
                //       )
                //     ]),
                //   );
                //   index = autoIds.next();
                //   debugSomething(index);
                // }

                /*Bloc cubit 사용해서 상태 Update*/
                // MyAppStateCubit cubit = MyAppStateCubit();
                // cubit.emit(cubit.state);

                return FoldableStampsContainerMaker(
                  title: "운동잠정계획스케쥴",
                  items: [
                    // ...rows,
                    for (int i = 0; i < schedules.length; i++)
                      Container(
                        color: MyColors.blackWithOpacity20Percent,
                        child: Row(children: [
                          HardCodingStampMaker(txt: schedules[i]),
                          Container(
                            // color: MyColors.blackWithOpacity20Percent,
                            color: Colors.transparent,
                            child: IconButton(
                              onPressed: () {
                                onToogleCheckBoxState(checkBoxKey: "checkBox${i}State");
                              },
                              icon: checkBoxesState["checkBox${i}State"] == true
                                  ? Icon(
                                      Icons.check_box_outlined,
                                      color: MyColors.whiteWithOpacity60Percent,
                                    )
                                  : Icon(
                                      Icons.check_box_outline_blank,
                                      color: MyColors.whiteWithOpacity40Percent,
                                    ),
                            ),
                          )
                        ]),
                      ),
                  ],
                  onTap: _toogleVisiableExercisingSchedules,
                  isVisiable: isVisiableMyRandomSchedule,
                  now: now,
                );
              }),
              SizedBox(width: MediaQuery.of(context).size.width, height: 1),

              /*카톡보고스탬프*/
              FoldableStampsContainerMaker(
                title: "카톡보고스탬프",
                items: [
                  if (isVisiableReportingStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '확인해보고 말씀드리겠습니다')),
                  if (isVisiableReportingStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '확인해보겠습니다')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '5분에서 10분 정도 걸릴것 같습니다')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '15분 정도 걸릴것 같습니다')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '30분 정도 걸릴것 같습니다')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '1시간 정도 걸릴것 같습니다')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '부장님 이거 먼저 처리할까요?')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '유지보수 엑셀 업데이트 해두었습니다.\n수고하셨습니다')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '네 부장님 오늘도 고생하셨습니다.\n다음주에 뵙겠습니다^^.')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '수고하셨습니다')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '처리하였습니다')),
                  if (isVisiableReportingStamp == true) Container(width: MediaQuery.of(context).size.width, child: HardCodingStampMaker(txt: '부장님 처리했습니다')),
                ],
                onTap: _toogleisVisiableCompanyReportingStamp,
                isVisiable: isVisiableReportingStamp,
                now: now,
              ),
              SizedBox(width: MediaQuery.of(context).size.width, height: 1),

              // /*디버깅 바*/ Positioned(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.black.withOpacity(0.5),
              //       borderRadius: const BorderRadius.only(
              //         topRight: Radius.circular(7),
              //         topLeft: Radius.circular(7),
              //         bottomLeft: Radius.circular(7),
              //         bottomRight: Radius.circular(7),
              //       ),
              //     ),
              //     height: MediaQuery.of(context).size.height * 0.1,
              //     width: MediaQuery.of(context).size.width * 0.1,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         InkWell(
              //           child: const Icon(
              //             Icons.bug_report,
              //             color: Colors.red,
              //             size: 20,
              //           ),
              //           onTap: () {
              //             String result = '';
              //             for (int i = 0; i < 20; i++) {
              //               result = result + 'checkBoxfesState["checkBox${i}State"]: ${checkBoxesState["checkBox${i}State"]} \n';
              //             }
              //             setState(() {
              //
              //             });
              //             alertHelper(context, result);
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onClickViaRemoteConnection20230810134516() async {
    RenderBox renderbox = remoteConnection20230810134516.currentContext!.findRenderObject() as RenderBox;
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

  Future<void> onClickViaRemoteConnection20230813125516() async {
    RenderBox renderbox = remoteConnection20230813125516.currentContext!.findRenderObject() as RenderBox;
    Offset position = renderbox.localToGlobal(Offset.zero);
    double x = position.dx;
    double y = position.dy;
    alertHelper(context, "${x.toString()}, ${x.toString()}");

    GestureBinding.instance.handlePointerEvent(PointerDownEvent(
      position: Offset(x, y),
    ));
    await Future.delayed(const Duration(milliseconds: 500));
    GestureBinding.instance.handlePointerEvent(PointerUpEvent(
      position: Offset(x, y),
    ));
  }

  Future<void> onClickViaRemoteConnection20230812222003475() async {
    RenderBox renderbox = remoteConnection20230812222003475.currentContext!.findRenderObject() as RenderBox;
    Offset position = renderbox.localToGlobal(Offset.zero);
    double x = position.dx;
    double y = position.dy;

    /*Bloc cubit 사용해서 상태 Read*/
    // MyAppStateCubit cubit = MyAppStateCubit();
    // double x = cubit.state.multiCaseMakerState["position"]["x"];
    // double y = cubit.state.multiCaseMakerState["position"]["y"];
    // alertHelper(context, "${x.toString()}, ${x.toString()}");
    debugSomething(cubit.state.multiCaseMakerState, troubleShootingId: "2023081318101908");

    GestureBinding.instance.handlePointerEvent(PointerDownEvent(
      position: Offset(x, y),
    ));
    await Future.delayed(const Duration(milliseconds: 500));
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
      isVisiableLiveStamp = !isVisiableLiveStamp;
      debugSomething(isVisiableLiveStamp, troubleShootingId: "20230811184612");
    });
  }

  void _toogleIsShowAutoCopyStamp() {
    setState(() {
      isVisiableAutoCopyStamp = !isVisiableAutoCopyStamp;
      debugSomething(isVisiableAutoCopyStamp, troubleShootingId: "20230811184422");
    });
  }

  void _toogleVisiableExercisingSchedules() {
    setState(() {
      isVisiableMyRandomSchedule = !isVisiableMyRandomSchedule;
      debugSomething(isVisiableMyRandomSchedule, troubleShootingId: "20230811184422123");
    });
  }

  void onToogleCheckBoxState({required String checkBoxKey}) {
    setState(() {
      if (checkBoxesState[checkBoxKey] == true) {
        checkBoxesState[checkBoxKey] = false;
      } else {
        checkBoxesState[checkBoxKey] = true;
      }
      localStorage.setItem(checkBoxKey, checkBoxesState[checkBoxKey]);
    });
  }

  void _toogleisVisiableCompanyReportingStamp() {
    setState(() {
      isVisiableReportingStamp = !isVisiableReportingStamp;
      debugSomething(isVisiableReportingStamp, troubleShootingId: "202308121450");
    });
  }

  void _toogleisVisiableDisposableStamp() {
    setState(() {
      isVisiableDisposableStamp = !isVisiableDisposableStamp;
      debugSomething(isVisiableDisposableStamp, troubleShootingId: "202308121450");
    });
  }

  _changeFocus(BuildContext context, FocusNode focusNodeNew) {
    FocusScope.of(context).requestFocus(focusNodeNew);
  }
}

class AutoManagerableIdMaker {
  List<int> intIds = naturalNumbersMaker(0, 100);

  int next() {
    var firstThing = intIds.first;
    intIds.removeAt(0);
    return firstThing;
  }
}

class LiveStamps extends StatelessWidget {
  final GestureTapCallback? onTap;

  bool isVisiableLiveStamp;

  DateTime now;

  LiveStamps({super.key, required this.onTap, required this.isVisiableLiveStamp, required this.now});

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
        if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: 'debugSomething(도태할문자열,troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss, '', SSS])}");', deprecatedWord: "도태할문자열")),
        if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: 'debugSomething("도태할문자열",troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss, '', SSS])}");', deprecatedWord: "도태할문자열")),
        if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: 'debugSomething(\'도태할문자열\',troubleShootingId: "도태할문자열${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss, '', SSS])}");', deprecatedWord: "도태할문자열")),
        if (isVisiableLiveStamp == true) //           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: 'printSeperatorWithoutMkr(txt:  "도태할문자열 s");', deprecated: "도태할문자열")),
          if (isVisiableLiveStamp == true) //           SizedBox(width: MediaQuery.of(context).size.width,  child: ReplacingStampMaker(template: 'printSeperatorWithoutMkr(txt:  "도태할문자열 e");', deprecated: "도태할문자열")),
            if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: 'printSeperatorWithoutMkr(txt:  "도태할문자열 s");\nprintSeperatorWithoutMkr(txt:  "도태할문자열 e");', deprecatedWord: "도태할문자열")),
        if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss]), deprecatedWord: '도태할문자열')),
        if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: '`ai ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
        if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: '``ai ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
        if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: '`ani ai${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
        if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: '`ani ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
        if (isVisiableLiveStamp == true) SizedBox(width: MediaQuery.of(context).size.width, child: ReplacingStampMaker(template: ' troubleShootingId: ${formatDate(now, [yyyy, '', mm, '', dd, ' ', HH, '', nn, '', ss])}', deprecatedWord: '도태할문자열')),
      ],
    );
  }
}

class AutoCopyStamps extends StatelessWidget {
  final GestureTapCallback? onTap;

  bool isVisiableAutoCopyStamp;

  DateTime now;

  AutoCopyStamps({super.key, required this.onTap, required this.isVisiableAutoCopyStamp, required this.now});

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

            width: MediaQuery.of(context).size.width, //폭 설정
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
      ],
    );
  }
}

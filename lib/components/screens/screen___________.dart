import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/check_box_maker.dart';
import '../../utils/circle_box_maker.dart';
import '../../utils/semi_circle_maker.dart';
import '../../utils/striped_box_maker.dart';
import '../../utils/super_helper.dart';
import '../../utils/threelines_box_maker.dart';
import '../../utils/toggle_maker.dart';

class Screen___________ extends StatefulWidget {
  const Screen___________({super.key});

  @override
  State<Screen___________> createState() => _Screen___________State();
}

class _Screen___________State extends State<Screen___________> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /*메인컨테이너*/ Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: ListView(
                children: [
                  const NationalFlags(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SafeArea(
                      top: true,
                      bottom: true,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              color: Colors.black,
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(height: 50, width: 50, color: Colors.red),
                                  Container(height: 50, width: 50, color: Colors.orange),
                                  Container(height: 50, width: 50, color: Colors.yellow),
                                  Container(height: 50, width: 50, color: Colors.green),
                                  Container(height: 50, width: 50, color: Colors.blue),
                                  Container(height: 50, width: 50, color: Colors.purple),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.black,
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.red)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.orange)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.yellow)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.green)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.blue)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.purple)),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.black,
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.red)),
                                  Expanded(flex: 2, child: Container(height: 50, width: 50, color: Colors.orange)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.yellow)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.green)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.blue)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.purple)),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.black,
                              width: 50,
                              // width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                                children: [
                                  Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.red)),
                                  Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.orange)),
                                  Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.yellow)),
                                  Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.green)),
                                  Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.blue)),
                                  Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.purple)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  MySeperators.withId(positionId: "202307221656"),
                  /*가로형 컨테이너*/ Container(
                    color: Colors.black,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.red)),
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.orange)),
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.yellow)),
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.green)),
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.blue)),
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.purple)),
                      ],
                    ),
                  ),
                  /*가로형 컨테이너*/
                  MySeperators.withId(positionId: "202307221656"),
                  /*가로형 컨테이너*/ Container(
                    color: Colors.black,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 2, child: Container(height: 50, width: 50, color: Colors.red)),
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.orange)),
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.yellow)),
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.green)),
                        Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.blue)),
                        Expanded(flex: 2, child: Container(height: 50, width: 50, color: Colors.purple)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(height: 25, width: 25, color: Colors.red),
                            Container(height: 25, width: 25, color: Colors.orange),
                            Container(height: 25, width: 25, color: Colors.yellow),
                            Container(height: 25, width: 25, color: Colors.green),
                            Container(height: 25, width: 25, color: Colors.blue),
                            Container(height: 25, width: 25, color: Colors.purple),
                          ],
                        ),
                        Row(
                          children: [
                            Container(height: 25, width: 25, color: Colors.red),
                            Container(height: 25, width: 25, color: Colors.orange),
                            Container(height: 25, width: 25, color: Colors.yellow),
                            Container(height: 25, width: 25, color: Colors.green),
                            Container(height: 25, width: 25, color: Colors.blue),
                            Container(height: 25, width: 25, color: Colors.purple),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(height: 25, width: 25, color: Colors.red),
                            Container(height: 25, width: 25, color: Colors.orange),
                            Container(height: 25, width: 25, color: Colors.yellow),
                            Container(height: 25, width: 25, color: Colors.green),
                            Container(height: 25, width: 25, color: Colors.blue),
                            Container(height: 25, width: 25, color: Colors.purple),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(height: 25, width: 25, color: Colors.red),
                            Container(height: 25, width: 25, color: Colors.orange),
                            Container(height: 25, width: 25, color: Colors.yellow),
                            Container(height: 25, width: 25, color: Colors.green),
                            Container(height: 25, width: 25, color: Colors.blue),
                            Container(height: 25, width: 25, color: Colors.purple),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(height: 25, width: 25, color: Colors.red),
                            Container(height: 25, width: 25, color: Colors.orange),
                            Container(height: 25, width: 25, color: Colors.yellow),
                            Container(height: 25, width: 25, color: Colors.green),
                            Container(height: 25, width: 25, color: Colors.blue),
                            Container(height: 25, width: 25, color: Colors.purple),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(height: 25, width: 25, color: Colors.red),
                            Container(height: 25, width: 25, color: Colors.orange),
                            Container(height: 25, width: 25, color: Colors.yellow),
                            Container(height: 25, width: 25, color: Colors.green),
                            Container(height: 25, width: 25, color: Colors.blue),
                            Container(height: 25, width: 25, color: Colors.purple),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 24 - 56,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(height: 25, width: 25, color: Colors.orange),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(height: 25, width: 25, color: Colors.green),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const ZebraStripeContainer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // MySeperators.withId(id: "202307221656"),

                      /*Expanded 가 있으면 발생하는 문제가 있다 Contaner() 로 감싸서 시도해보자*/
                      // /*커스텀 앱바*/ Expanded(
                      //   child: Container(
                      //     color: Colors.red,
                      //     child: /*뒤로가기 버튼*/ GestureDetector(
                      //       child: const Row(
                      //         children: [
                      //           Icon(Icons.arrow_left, size: 30, color: Colors.white),
                      //           Text("Navigation", style: TextStyle(color: Colors.white)),
                      //         ],
                      //       ),
                      //       onTap: () {
                      //         ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                      //         Navigator.of(context).pop();
                      //       },
                      //     ),
                      //   ),
                      // ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*커스텀 앱바*/ GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('VIDEO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
                            Text('PLAYER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),

                      /*더블피니트 컨테이너*/ GestureDetector(
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar),
                        child: Container(
                          color: Colors.red,
                          height: 30,
                          width: double.infinity,
                          child: const Text("더블인피니트 버튼", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                        ),
                      ),
                      // const SizedBox(height: 50,child: Text("202307221654")),
                      // /*익스펜디드컨테이너*/ Expanded(
                      //   child: Container(
                      //     height: 180,
                      //     color: Colors.red,
                      //     child: const Text("익스펜디드컨테이너",style: TextStyle(color: Colors.white)),
                      //   ),
                      // ),
                      /*별에별 기능 버튼*/ GestureDetector(
                        onTap: () {
                          /*notReadySnackBar*/
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.hello));
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.occuredError));
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.inLoading()));

                          /*미래에 실행할 코드*/
                          Future.delayed(const Duration(milliseconds: 2000), () {
                            /*1000 milliseconds 후 실행할 코드*/ debugSomething("2초 경과했습니다", troubleShootingId: "20230811183943");
                          });

                          /*닫을 까요?*/
                          Navigator.of(context).pop();

                          /*Auto Schedule 실행 버튼*/
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.of(context).pop(true);
                              });
                              return const AlertDialog(
                                backgroundColor: Colors.black,
                                title: Text('빙빙'),
                              );
                            },
                          );

                          /*경고창 실행*/
                          setState(() {
                            showDialog(
                              barrierDismissible: true, // 바깥영역터치 > 닫을지 여부
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                  content: const Text(
                                    "당신 경고입니다.\n이번엔 봐줄게요",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        // Navigator.of(context).pop();
                                      },
                                      child: Text(MyMents.yes),
                                    ),
                                  ],
                                );
                              },
                            );
                          });

                          /*풀스크린다이얼로그*/
                          setState(() {
                            showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                  content: Text(MyMents.notReadyYet, style: const TextStyle(color: Colors.white)),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(MyMents.yes, style: const TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });


                          /*경고팝업*/
                          setState(() {
                            showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                  content: Text(MyMents.notReadyYet, style: const TextStyle(color: Colors.white)),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(MyMents.yes, style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });

                          /*경고팝업*/
                          setState(() {
                            showDialog(
                              context: context,
                              barrierDismissible: true, // 바깥영역터치 > 닫을지 여부
                              useRootNavigator: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  content: const Text('foo', style: TextStyle(color: Colors.white)),
                                  insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
                                  actions: [
                                    TextButton(
                                      child: const Text('확인', style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });

                          /*경고팝업*/
                          setState(() {
                            showDialog(
                              barrierDismissible: true, // 바깥영역터치 > 닫을지 여부
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                  content: const Text("당신 경고입니다.\n이번엔 봐줄게요"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        // Navigator.of(context).pop();
                                      },
                                      child: Text(MyMents.yes),
                                    ),
                                  ],
                                );
                              },
                            );
                          });

                          /*경고팝업*/
                          // setState(() {
                          //   showDialog<String>(
                          //     barrierDismissible: true,
                          //     context: context,
                          //     builder: (BuildContext context) => AlertDialog(
                          //       backgroundColor: Colors.black,
                          //       title: const Text('AlertDialog Title', style: TextStyle(color: Colors.white)),
                          //       content: const Text('AlertDialog description', style: TextStyle(color: Colors.white)),
                          //       actions: <Widget>[
                          //         TextButton(
                          //           onPressed: () => Navigator.pop(context, 'Cancel'),
                          //           child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                          //         ),
                          //         TextButton(
                          //           onPressed: () => Navigator.pop(context, 'OK'),
                          //           child: const Text('OK', style: TextStyle(color: Colors.white)),
                          //         ),
                          //       ],
                          //     ),
                          //   );
                          // });


                          /*양식제출*/
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                content: Stack(
                                  clipBehavior: Clip.none,
                                  children: <Widget>[
                                    Positioned(
                                      right: -40.0,
                                      top: -40.0,
                                      child: InkResponse(
                                        onTap: () {
                                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.lightGreenAccent,
                                          child: Icon(Icons.close),
                                        ),
                                      ),
                                    ),
                                    Form(
                                      // key: _forey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                              child: const Text("제출"),
                                              onPressed: () {
                                                showDialog<void>(
                                                  context: context,
                                                  barrierDismissible: true, //바깥영역 터치시 닫힘 셋팅
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor: Colors.black,
                                                      title: const Text('경고'),
                                                      content: const SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            Text('한번 양식을 제출하면 개인이 수정할 수 없습니다.'),
                                                            Text('제출한 데이터를 수정하려면 관리자에게 문의 하세요.'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: const Text('양식수정'),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                        const SizedBox(width: 10),
                                                        TextButton(
                                                          child: const Text('제출확정'),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                            Navigator.of(context).pop(); // 부모 까지 닫을 때
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );

                          /*양식제출20230813151429636*/
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 10.0,
                                width: 10.0,
                                color: Colors.black12,
                                child: const Center(
                                  child: Text("양식제출20230813151429636",style: TextStyle(color: Colors.white70),),
                                ),
                              );
                            },
                          );

                          /*메테리얼배너*/
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

                          /*메테리얼배너20230813151442385*/
                          ScaffoldMessenger.of(context).showMaterialBanner(
                            MaterialBanner(
                              content: const Text('메테리얼배너20230813151442385'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                                  },
                                  child: const Text('메테리얼배너20230813151442386'),
                                ),
                              ],
                            ),
                          );

                          /*미니사이즈 다이얼로그팝업*/
                          showDialog<String>(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text('미니사이즈 다이얼로그팝업'),
                                    const SizedBox(height: 15),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('확인'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );

                          /*풀스크린 다이얼로그*/
                          Dialog.fullscreen(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('풀스크린사이즈 다이얼로그팝업'),
                                const SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(''),
                                ),
                              ],
                            ),
                          );

                          /*사랑해*/
                          showDialog<void>(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: const Text(
                                  '사랑해',
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: const SingleChildScrollView(
                                  child: Text('사랑해', style: TextStyle(color: Colors.white)),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text(
                                      '',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );

                          /*모달버텀시트*/ //IOS showCupertinoDialog 랑 비슷한듯 강의참고.
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Colors.amber,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text('모달버텀시트'),
                                      TextButton(
                                        child: const Text(''),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          /*2엣지라운디드버텀시트*/
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 200,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text('모달버텀시트'),
                                      TextButton(
                                        child: const Text('Close BottomSheet'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          /*데이트피커*/
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) => DatePickerDialog(
                              restorationId: 'date_picker_dialog',
                              initialEntryMode: DatePickerEntryMode.calendarOnly,
                              initialDate: DateTime(2021, 12, 25),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2022),
                            ),
                          ); /*데이트피커*/
                          showCupertinoDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.white,
                                  height: 300.0,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    // mode: CupertinoDatePickerMode.dateAndTime,
                                    // mode: CupertinoDatePickerMode.time,
                                    onDateTimeChanged: (DateTime date) {
                                      printWithoutWarning(date);
                                    },
                                  ),
                                ),
                              );
                            },
                          );

                          /*경고팝업*/
                          showDialog<String>(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) => Dialog.fullscreen(
                              backgroundColor: Colors.black,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text('경고팝업', style: TextStyle(color: Colors.white)),
                                  const SizedBox(height: 15),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('', style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          );

                          /*경고팝업*/
                          showDialog<String>(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              backgroundColor: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text('경고팝업', style: TextStyle(color: Colors.white)),
                                    const SizedBox(height: 15),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('', style: TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        // onTap: : null, //비활성화 버튼
                        child: Container(
                          // width: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width - 30,
                          // width: (MediaQuery.of(context).size.width - 30) / 2,
                          // width: Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.contain).width!*0.7,
                          // width: 200,
                          // height: MediaQuery.of(context).size.height,
                          // height:Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.contain).height!*0.7,
                          height: 30,
                          decoration: const BoxDecoration(
                            // border: Border.all(color: Colors.indigoAccent, width: 4.0),
                            color: Colors.red,
                            // shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(10),
                            // image: DecorationImage(
                            //   image: AssetImage('asset/images/sky_best (1).jpg'),
                            //   fit: BoxFit.cover,
                            // fit: BoxFit.contain,
                            // fit: BoxFit.fitHeight,
                            // fit: BoxFit.fill,
                            // fit: BoxFit.none,
                            // fit: BoxFit.scaleDown, //scaleDown 이 마음에 든다 //디지털 액자에도 이걸 적용하면 될것 같음
                            // ),
                            // gradient: LinearGradient(
                            //   colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.blue.shade900, Colors.purple],
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            // ),
                            // gradient: LinearGradient(
                            //   colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.blue.shade900, Colors.purple],
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            // ),
                            // gradient: RadialGradient(colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.blue.shade900, Colors.purple].reversed.toList()),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('별에별 기능 버튼', style: MyTextStyles.textStyle1.copyWith(color: Colors.white, fontSize: 9)),
                            ],
                          ),
                        ),
                      ),

                      MySeperators.withId(positionId: "202307221656"),

                      /*TextButton*/ Container(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 30,
                        decoration: const BoxDecoration(color: Colors.red),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: TextButton(
                          child: const Text(
                            'TextButton',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                          },
                        ),
                      ),

                      // SliverToBoxAdapter()를 이대로 쓰면 에러가 나타난다. sliver 내부에서 호출해서 사용해야 한다.
                      // MySeperators.withId(positionId: "202307221656"),
                      // SliverToBoxAdapter(
                      //   child: SizedBox(
                      //     height: 360,
                      //     child: LayoutBuilder(builder: (context, constraint) {
                      //       return ListView(
                      //         scrollDirection: Axis.vertical,
                      //         physics: const PageScrollPhysics(),
                      //         children: [
                      //           for (int i = 0; i <= 23; i++) _MiniRow(time: "$i시", imgPath: "😘", level: '좋은', height: constraint.maxHeight / 10),
                      //         ],
                      //       );
                      //     }),
                      //   ),
                      // ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        height: 300,
                        child: GridView(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 5, mainAxisSpacing: 10),
                          children: <Widget>[
                            /*사진버튼*/
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                              },
                              child: Center(child: SizedBox(height: 300 / 5, width: 200 / 5, child: Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.cover))),
                            ),
                            /*사진버튼*/
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                              },
                              child: SizedBox(height: 300 / 5, width: 200 / 5, child: Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.cover)),
                            ),
                            /*아이콘버튼*/ GestureDetector(
                              child: const Icon(Icons.question_mark, size: 40, color: Colors.pink),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                              },
                            ),
                            /*버튼*/ FloatingActionButton(
                              mini: false,
                              backgroundColor: Colors.blue.shade900,
                              splashColor: Colors.black,
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                              },
                              hoverElevation: 1.5,
                              shape: const StadiumBorder(side: BorderSide(color: Colors.blue, width: 4)),
                              elevation: 1.5,
                              child: const Icon(
                                Icons.message,
                                color: Colors.red,
                              ),
                            ),
                            MySeperators.withId(positionId: "202307221656"),
                            /*버튼*/ Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 4),
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                iconSize: 56,
                                icon: const Icon(Icons.message),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                                },
                              ),
                            ),
                            /*Material()?*/ Material(
                              type: MaterialType.transparency,
                              child: Ink(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.indigoAccent, width: 4.0),
                                  color: Colors.white,
                                  // color: Colors.indigo[900],
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(1000.0),
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Icon(
                                      Icons.message,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            /*버튼(토글)*/ const ToggleMaker(),
                            /*체크박스*/ const CheckBoxMaker(),
                            /*배경버튼*/ Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('asset/images/my_lovely_dog_sky.jpg'),
                                  // fit: BoxFit.cover,
                                  // fit: BoxFit.contain,
                                  // fit: BoxFit.fitHeight,
                                  // fit: BoxFit.fill,
                                  fit: BoxFit.none,
                                  // fit: BoxFit.scaleDown, //scaleDown 이 마음에 든다 //디지털 액자에도 이걸 적용하면 될것 같음
                                ),
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                  textStyle: MaterialStateProperty.all(
                                    const TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                  backgroundColor: MaterialStateProperty.resolveWith(
                                    (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.pressed)) {
                                        return Colors.red;
                                      } else if (states.contains(MaterialState.hovered)) {
                                        return Colors.orange;
                                      } else if (states.contains(MaterialState.dragged)) {
                                        return Colors.yellow;
                                      } else if (states.contains(MaterialState.focused)) {
                                        return Colors.green;
                                      } else if (states.contains(MaterialState.error)) {
                                        return Colors.blue.shade800;
                                      } else if (states.contains(MaterialState.selected)) {
                                        return Colors.blue.shade900;
                                      } else if (states.contains(MaterialState.scrolledUnder)) {
                                        return Colors.purple.shade900;
                                      } else if (states.contains(MaterialState.disabled)) {
                                        return Colors.grey;
                                      }
                                      return null; //기본은 버튼 배경이 투명하도록
                                    },
                                  ),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                                },
                                child: const Text('배경버튼'),
                              ),
                            ),
                            /* X 버튼*/ Stack(
                              children: [
                                Opacity(
                                  opacity: 1,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Transform.rotate(
                                      angle: 40.05,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: IconButton(
                                          icon: Icon(Icons.add_circle_outlined, color: Colors.white.withOpacity(0.9)),
                                          onPressed: () {
                                            ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                                          },
                                          tooltip: "",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            /*투명컨테이너*/ const SizedBox(
                              height: 50,
                            ),
                            /*투명컨테이너*/ Container(
                              height: 50,
                            ),
                            MySeperators.withId(positionId: "202307221656"),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )),

          //__________________________________________________________________________________________________________________________ tmp e
        ],
      ),
    );
  }
}

class ZebraStripeContainer extends StatefulWidget {
  const ZebraStripeContainer({super.key});

  @override
  State<ZebraStripeContainer> createState() => _ZebraStripeContainerState();
}

class _ZebraStripeContainerState extends State<ZebraStripeContainer> {
  int zebraStripeCount = 12;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      color: Colors.black.withOpacity(0.9),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch, //Column의 자식 위젯들을 가로로 늘릴수 있다
        // mainAxisSize: MainAxisSize.max, //아주 유용하다.적당히 맞출 필요가 없다
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < zebraStripeCount; i++)
            if (i % 2 == 0) Container(height: 50, width: MediaQuery.of(context).size.width / zebraStripeCount, color: Colors.white) else Container(height: 50, width: MediaQuery.of(context).size.width / zebraStripeCount, color: Colors.black)
        ],
      ),
    );
  }
}

class NationalFlags extends StatefulWidget {
  const NationalFlags({super.key});

  @override
  State<NationalFlags> createState() => _NationalFlagsState();
}

class _NationalFlagsState extends State<NationalFlags> {
  late NATION nationMode;

  late List<dynamic> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    renderFlags();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      height: 300,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 5, mainAxisSpacing: 10),
        children: <Widget>[
          for (var item in items) item,
        ],
      ),
    );
  }

  void renderFlags() {
    items = [
      /*폴란드*/
      ScreenNationalFlagModule(text: '폴란드', item: StripedBoxHelper(colors: const [Colors.red, Colors.white], ratioX: 3, ratioY: 4, stripeCount: 2, isOppositeDirection: true)),
      /*인도네시아*/
      ScreenNationalFlagModule(text: '인도네시아', item: StripedBoxHelper(colors: const [Colors.white, Colors.red], ratioX: 3, ratioY: 4, stripeCount: 2, isOppositeDirection: true)),
      /*우크라이나*/
      ScreenNationalFlagModule(text: '우크라이나', item: StripedBoxHelper(colors: const [Colors.blue, Colors.yellow], ratioX: 3, ratioY: 4, stripeCount: 2, isOppositeDirection: true)),
      /*독일*/
      ScreenNationalFlagModule(text: '독일', item: ThreelinesBoxMaker(colors: const [Colors.black, Colors.red, Colors.yellow], ratioX: 3, ratioY: 4, isOppositeDirection: true)),
      /*오스트리아*/
      ScreenNationalFlagModule(text: '오스트리아', item: ThreelinesBoxMaker(colors: const [Colors.red, Colors.white, Colors.red], ratioX: 3, ratioY: 4, isOppositeDirection: true)),
      /*이탈리아*/
      ScreenNationalFlagModule(text: '이탈리아', item: ThreelinesBoxMaker(colors: const [Colors.green, Colors.white, Colors.red], ratioX: 3, ratioY: 4, isOppositeDirection: false)),
      /*프랑스*/
      ScreenNationalFlagModule(text: '프랑스', item: ThreelinesBoxMaker(colors: [Colors.blue.shade900, Colors.white, Colors.red], ratioX: 3, ratioY: 4, isOppositeDirection: false)),
      /*KOREA*/
      ScreenNationalFlagModule(
        text: 'KOREA',
        item: Column(
          children: [
            StripedBoxHelper(colors: const [Colors.white], ratioX: 3, ratioY: 4),
            /*태극문양*/ Column(
              children: [
                Transform.translate(offset: const Offset(0, -1.4), child: Transform.scale(scale: 150, child: Transform.rotate(angle: 0.3 + 0.3, child: SemiCircleMaker(diameter: 0.01, color: Colors.red)))),
                Transform.translate(offset: const Offset(0, -1.4), child: Transform.scale(scale: 150, child: Transform.rotate(angle: 3.15 + 0.3 + 0.3, child: SemiCircleMaker(diameter: 0.01, color: Colors.blue.shade900)))),
                Transform.translate(offset: const Offset(-0.31, -1.65), child: Transform.scale(scale: 150 / 1.9, child: CircleBoxHelper(item: StripedBoxHelper(colors: const [Colors.red], ratioX: 0.01, ratioY: 0.01)))),
                Transform.translate(offset: const Offset(0.31, -1.25), child: Transform.scale(scale: 150 / 1.9, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.blue.shade900], ratioX: 0.01, ratioY: 0.01)))),
              ],
            ),
            /*건(하늘)*/ Transform.translate(
              offset: const Offset(0.16, -1.36),
              child: Transform.rotate(
                angle: -0.95,
                child: Column(
                  children: [
                    Transform.translate(offset: const Offset(0, -1.3), child: Transform.scale(scale: 15, child: StripedBoxHelper(colors: const [Colors.black], ratioX: 0.008, ratioY: 0.05))),
                    Transform.translate(offset: const Offset(0, -1.5), child: Transform.scale(scale: 15, child: StripedBoxHelper(colors: const [Colors.black], ratioX: 0.008, ratioY: 0.05))),
                    Transform.translate(offset: const Offset(0, -1.7), child: Transform.scale(scale: 15, child: StripedBoxHelper(colors: const [Colors.black], ratioX: 0.008, ratioY: 0.05))),
                  ],
                ),
              ),
            ),
            /*곤감이*/
            /*나중에 하자*/
          ],
        ),
      ),
      /*JAPAN*/
      ScreenNationalFlagModule(
        text: 'JAPAN',
        item: Column(
          children: [
            StripedBoxHelper(colors: const [Colors.white], ratioX: 3, ratioY: 4),
            Transform.translate(offset: const Offset(0, -1.4), child: Transform.scale(scale: 150, child: CircleBoxHelper(item: StripedBoxHelper(colors: const [Colors.red], ratioX: 0.01, ratioY: 0.01)))),
          ],
        ),
      ),
      /*방글라데시*/
      ScreenNationalFlagModule(
        text: '방글라데시',
        item: Column(
          children: [
            StripedBoxHelper(colors: const [Colors.green], ratioX: 3, ratioY: 4),
            Transform.translate(offset: const Offset(-0.3, -1.4), child: Transform.scale(scale: 150, child: CircleBoxHelper(item: StripedBoxHelper(colors: const [Colors.red], ratioX: 0.01, ratioY: 0.01)))),
          ],
        ),
      ),
    ];
  }
}

enum NATION { poland, germany, monaco, indonesia, italia, france, korea, japan, usa, sweden }

class ScreenNationalFlagModule extends StatefulWidget {
  late String text;

  late Widget item;

  ScreenNationalFlagModule({
    super.key,
    required this.text,
    required this.item,
  });

  @override
  State<ScreenNationalFlagModule> createState() => _ScreenNationalFlagModuleState();
}

class _ScreenNationalFlagModuleState extends State<ScreenNationalFlagModule> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SizedBox(
            height: 33,
            width: 44,
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 5),
                  child: Transform.scale(scale: 10, child: widget.item),
                ),
              ],
            ),
          ),
          tooltip: '',
          splashColor: Colors.white,
          // hoverColor: Colors.red,
          focusColor: Colors.orange,
          color: Colors.blueAccent,
          disabledColor: Colors.purpleAccent,
        ),
        Text(widget.text, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 9, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

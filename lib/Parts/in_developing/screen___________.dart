import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/check_box_maker.dart';
import '../helpers/circle_box_maker.dart';
import '../helpers/super_helper.dart';
import '../helpers/toggle_maker.dart';

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
          //__________________________________________________________________________________________________________________________ tmp s
          /*임시메인컨테이너*/ Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MySeperators.withId(positionId: "202307221656"),
                      /*커스텀 앱바*/ Container(
                        color: Colors.black87,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            /*뒤로가기 버튼*/ GestureDetector(
                              child: const Icon(Icons.chevron_left, size: 40, color: Colors.redAccent),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),

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
                      //         Navigator.pop(context);
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

                      /*가로형 컨테이너*/
                      MySeperators.withId(positionId: "202307221656"),
                      /*투명컨테이너*/ const SizedBox(
                        height: 50,
                        child: Text(
                          "투명컨테이너",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*배경컨테이너*/ Container(
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
                        child: const Text("배경컨테이너", style: TextStyle(color: Colors.white)),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      // /*레디얼그라데이션 컨테이너*/ Transform.translate(
                      //   offset: const Offset(0, 0),
                      //   child: Transform.scale(
                      //     scale: 12500,
                      //     child: CircleBoxHelper(
                      //       item: Container(
                      //         height: 0.01,
                      //         decoration: BoxDecoration(
                      //           gradient: RadialGradient(colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.blue.shade900, Colors.purple].reversed.toList()),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*리니어그라데이션 컨테이너*/ Transform.translate(
                        offset: const Offset(0, 0),
                        child: Transform.scale(
                          scale: 3000,
                          child: Container(
                            height: 0.01,
                            width: 0.01,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.blue.shade900, Colors.purple],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // MySeperators.withId(positionId: "202307221656"),
                      // /*무지개원형 컨테이너*/ Transform.translate(
                      //   offset: const Offset(17, 0),
                      //   child: Transform.scale(
                      //     scale: 250,
                      //     child: CircleBoxHelper(
                      //       item: Container(
                      //         height: 1,
                      //         decoration: BoxDecoration(
                      //           gradient: RadialGradient(colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.blue.shade900, Colors.purple].reversed.toList()),
                      //         ),
                      //         child: const Text("무지개원형 컨테이너", style: TextStyle(color: Colors.white)),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*빈컨테이너*/ Container(
                        height: 180,
                        width: (MediaQuery.of(context).size.width - 30) / 2,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: const Text("빈컨테이너", style: TextStyle(color: Colors.white)),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*빈컨테이너*/ Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 180,
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: const Text("빈컨테이너", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*리니어그라데이션 컨테이너*/ Transform.translate(
                        offset: const Offset(0, 0),
                        child: Transform.scale(
                          scale: 9000,
                          child: Container(
                            height: 0.01,
                            width: 0.01,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.blue.shade900, Colors.purple],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: const Text("리니어그라데이션 컨테이너", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*빈컨테이너*/ Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 180,
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: const Text("빈컨테이너", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*빈컨테이너*/ Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 180,
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: const Text("빈컨테이너", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*더블피니트 컨테이너*/ Container(
                        color: Colors.red,
                        child: const SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: Text("더블인피니트 컨테이너", style: TextStyle(color: Colors.white)),
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
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼(토글)*/ const ToggleMaker(),
                      MySeperators.withId(positionId: "202307221656"),
                      /*체크박스*/ const CheckBoxMaker(),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼(2초 뒤에 연결된 함수를 실행)*/ InkWell(
                        child: const Row(
                          children: [
                            Icon(Icons.question_mark),
                            Text("버튼을 클릭하면 2초 뒤에 연결된 함수를 실행하는 버튼"),
                          ],
                        ),
                        onTap: () {
                          /*미래에 실행할 코드*/
                          Future.delayed(const Duration(milliseconds: 2000), () {
                            /*1000 milliseconds 후 실행할 코드*/ printWithoutError("foo");
                          });
                        },
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼(버튼 클릭 시 5초 뒤 사라질 팝업 실행)*/ InkWell(
                        child: const Row(
                          children: [
                            Icon(Icons.question_mark),
                            Text("버튼을 클릭하면 2초 뒤에 연결된 함수를 실행하는 버튼"),
                          ],
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.of(context).pop(true);
                              });
                              return const AlertDialog(
                                title: Text('foo'),
                              );
                            },
                          );
                        },
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼*/ SizedBox(
                        height: 60,
                        // width:  60,
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 1,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Stack(
                                  children: [
                                    Transform.translate(
                                      offset: const Offset(300, 30),
                                      child: Transform.rotate(
                                        angle: 40.05,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: IconButton(
                                            icon: Icon(Icons.add_circle_outlined, color: Colors.white.withOpacity(0.9)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            tooltip: "",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼*/ FloatingActionButton(
                        mini: false,
                        backgroundColor: Colors.blue.shade900,
                        splashColor: Colors.black,
                        onPressed: () {},
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
                          onPressed: () {},
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼*/ Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.indigoAccent, width: 4.0),
                            color: Colors.indigo[900],
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
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼*/ TextButton(
                        onPressed: () => showDialog<String>(
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
                                      Navigator.pop(context);
                                    },
                                    child: const Text('닫기', style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: const Text('다이얼로그', style: TextStyle(color: Colors.white)),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼*/ TextButton(
                        onPressed: () => showDialog<String>(
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
                                    Navigator.pop(context);
                                  },
                                  child: const Text('닫기', style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        child: const Text('풀스크린다이얼로그', style: TextStyle(color: Colors.white)),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*빈버튼*/ Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(textAlign: TextAlign.center, '빈버튼', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼(추천)*/ OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          disabledBackgroundColor: Colors.red,
                          disabledForegroundColor: Colors.orange,
                          foregroundColor: Colors.green,
                          shadowColor: Colors.blue,
                          surfaceTintColor: Colors.purple,
                          elevation: 2.2,
                          textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          side: const BorderSide(
                            color: Colors.greenAccent,
                            width: 10,
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                        child: const Text(""),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼*/ Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            disabledBackgroundColor: Colors.red,
                            disabledForegroundColor: Colors.orange,
                            foregroundColor: Colors.green,
                            shadowColor: Colors.blue,
                            surfaceTintColor: Colors.purple,
                            elevation: 2.2,
                            textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            side: const BorderSide(
                              color: Colors.greenAccent,
                              width: 10,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                          child: const Text('일반버튼'),
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*비활성화 버튼*/ Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
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
                          onPressed: null, //비활성화 버튼

                          child: const Text('비활성화 버튼'),
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버튼*/ ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          disabledBackgroundColor: Colors.red,
                          disabledForegroundColor: Colors.orange,
                          foregroundColor: Colors.green,
                          shadowColor: Colors.blue,
                          surfaceTintColor: Colors.purple,
                          elevation: 2.2,
                          textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          side: const BorderSide(
                            color: Colors.greenAccent,
                            width: 10,
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                        child: const Text('버튼'),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*경고팝업*/ OutlinedButton(
                        child: const Text("풀스크린다이얼로그"),
                        onPressed: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                  content: Text(MyMents.notReadyYet, style: const TextStyle(color: Colors.white)),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("알겠어요!", style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        },
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*경고팝업*/ TextButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title', style: TextStyle(color: Colors.white)),
                            content: const Text('AlertDialog description', style: TextStyle(color: Colors.white)),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                        child: const Text('다이얼로그', style: TextStyle(color: Colors.white)),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*경고팝업*/ Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: TextButton(
                          child: const Text(
                            '경고팝업',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                    content: Text(MyMents.notReadyYet, style: const TextStyle(color: Colors.white)),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("알겠어요!", style: TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          },
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*경고팝업*/ Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: TextButton(
                          child: const Text(
                            '경고팝업',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              showDialog(
                                context: context,
                                barrierDismissible: true, // 바깥영역터치 > 닫을지 여부
                                useRootNavigator: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
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
                          },
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*경고팝업*/ Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: TextButton(
                          child: const Text(
                            '경고팝업',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              showDialog(
                                barrierDismissible: true, // 바깥영역터치 > 닫을지 여부
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                    content: const Text("당신 경고입니다.\n이번엔 봐줄게요"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          // Navigator.of(context).pop();
                                        },
                                        child: const Text("네! 알겠어요!"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }); //  setState(() {
                          },
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*경고팝업*/ Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: TextButton(
                          child: const Text(
                            '경고팝업',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              showDialog(
                                barrierDismissible: true, // 바깥영역터치 > 닫을지 여부
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                    content: const Text("당신 경고입니다.\n이번엔 봐줄게요"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          // Navigator.of(context).pop();
                                        },
                                        child: const Text("네! 알겠어요!"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }); //  setState(() {
                          },
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*양식제출팝업*/ Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: TextButton(
                          child: const Text(
                            '양식제출팝업',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
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
                                        // key: _formKey,
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
                                                    barrierDismissible: false, // user must tap button!
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
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
                          },
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*양식제출팝업*/ Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: TextButton(
                          child: const Text(
                            '양식제출팝업',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 10.0,
                                  width: 10.0,
                                  color: Colors.white,
                                  child: const Center(
                                    child: Text("?"),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*메테리얼배너 버튼*/ GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showMaterialBanner(
                            MaterialBanner(
                              content: const Text('이것은 배너 입니다. 첫 번째 페이지로 이동 합니다.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                                  },
                                  child: const Text('확인'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text("메테리얼배너"),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*스낵바 버튼*/ const Center(child: _SnackBarTestButton()),
                      MySeperators.withId(positionId: "202307221656"),
                      /*팝업스타일 다이얼로그 버튼*/ TextButton(
                        onPressed: () => showDialog<String>(
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
                                      Navigator.pop(context);
                                    },
                                    child: const Text('확인'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: const Text('미니사이즈 다이얼로그팝업'),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*풀스크린 다이얼로그 버튼*/ TextButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog.fullscreen(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('풀스크린사이즈 다이얼로그팝업'),
                                const SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('닫기'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        child: const Text('풀스크린사이즈 다이얼로그팝업'),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*메테리얼배너 버튼*/ IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showMaterialBanner(
                              MaterialBanner(
                                content: const Text('사랑해'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                                    },
                                    child: const Text('확인'),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.favorite, size: 30, color: Colors.red)),
                      MySeperators.withId(positionId: "202307221656"),
                      /*팝업*/ GestureDetector(
                        child: const Icon(Icons.ads_click),
                        onTap: () {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
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
                                      '닫기',
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
                        },
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*버텀시트*/ TextButton(
                        //IOS showCupertinoDialog 랑 비슷한듯 강의참고.

                        child: const Text('모달버텀시트'),
                        onPressed: () {
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
                                      const Text('Modal BottomSheet'),
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
                        },
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*2엣지라운디드버텀시트*/ TextButton(
                        child: const Text('모달버텀시트'),
                        onPressed: () {
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
                                      const Text('Modal BottomSheet'),
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
                        },
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*데이트피커*/ TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => DatePickerDialog(
                              restorationId: 'date_picker_dialog',
                              initialEntryMode: DatePickerEntryMode.calendarOnly,
                              initialDate: DateTime(2021, 12, 25),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2022),
                            ),
                          );
                        },
                        child: const Text(
                          "0000.00.00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*데이트피커*/ TextButton(
                        onPressed: () {
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
                                      printWithoutError(date);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          "2024.01.01",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*텍스트버튼(추천)*/ TextButton(
                        child: Text("?", style: TextStyle(color: Colors.pink.shade50, fontSize: 19, fontWeight: FontWeight.w100)),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*이미지버튼(추천)*/ GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                          },
                          child: Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 300, child: SizedBox(height: 0.1, width: 0.1, child: Image.asset('asset/images/app_webtoon_logo.jpg'))))),
                      MySeperators.withId(positionId: "202307221656"),
                      /*아이콘버튼(추천)*/ GestureDetector(
                        child: const Icon(Icons.question_mark, size: 40, color: Colors.pink),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*사진컨테이너*/
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(child: Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.cover)),
                      ),
                      /*사진컨테이너*/
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(
                            height: 300,
                            width: 200,
                            child: Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.cover)),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*사진컨테이너*/ Center(
                        child: Container(
                          // height:Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.contain).height!*0.7,
                          // width: Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.contain).width!*0.7,
                          height: 300,
                          width: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('asset/images/sky_best (1).jpg'),
                              fit: BoxFit.cover,
                              // fit: BoxFit.contain,
                              // fit: BoxFit.fitHeight,
                              // fit: BoxFit.fill,
                              // fit: BoxFit.none,
                              // fit: BoxFit.scaleDown, //scaleDown 이 마음에 든다 //디지털 액자에도 이걸 적용하면 될것 같음
                            ),
                          ),
                        ),
                      ),

                      MySeperators.withId(positionId: "202307221656"),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 360,
                          child: LayoutBuilder(builder: (context, constraint) {
                            return ListView(
                              scrollDirection: Axis.vertical,
                              physics: PageScrollPhysics(),
                              children: [
                                for (int i = 0; i <= 23; i++) _MiniRow(time: "$i시", imgPath: "😘", level: '좋은', height: constraint.maxHeight / 10),
                              ],
                            );
                          }),
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),


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

class _SnackBarTestButton extends StatefulWidget {
  @override
  State<_SnackBarTestButton> createState() => _SnackBarTestButtonState();

  const _SnackBarTestButton();
}

class _SnackBarTestButtonState extends State<_SnackBarTestButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.hello));
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.occuredError));
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.inLoading()));
        },
        child: const Text('스낵바'),
      ),
    );
  }
}


class _MiniRow extends StatelessWidget {
  final String time;
  final String imgPath;

  /*오염수준*/
  final String level;

  double height;

  _MiniRow({required this.time, required this.imgPath, required this.level, Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        color: _Colors.lightColor,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  time,
                  style: _TextStyles.titleTextStyle.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  imgPath,
                  style: _TextStyles.titleTextStyle.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  level,
                  style: _TextStyles.titleTextStyle.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniColumn extends StatelessWidget {
  final String category;
  final String imgPath;

  /*오염수준*/
  final String level;

  /*오염수치*/
  final String stat;

  const _MiniColumn({required this.category, required this.imgPath, required this.level, required this.stat, required this.width, Key? key}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _Colors.lightColor,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(category, style: _TextStyles.titleTextStyle.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200)),
            Text(imgPath, style: _TextStyles.titleTextStyle.copyWith(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w200)),
            Text(level, style: _TextStyles.titleTextStyle.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200)),
            Text(stat, style: _TextStyles.titleTextStyle.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }
}

class _Colors {
  static const primaryColors = Color(0xff009688);
  static const darkColor = Color(0xff00675b);
  static const lightColor = Color(0xff52c7b8);
  static const white = Colors.white;
  static const green = Colors.green;
  static const lightGreenAccent = Colors.lightGreenAccent;
  static const black = Colors.black;
}

class _TextStyles {
  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontFamily: 'sunFlower',
    fontWeight: FontWeight.w700,
  );
}
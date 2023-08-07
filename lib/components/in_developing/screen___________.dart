import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/check_box_maker.dart';
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
          /*메인컨테이너*/ Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black,
                 ),
              child: ListView(
                children: [
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


                      MySeperators.withId(positionId: "202307221656"),
                      /*투명컨테이너*/ const SizedBox(
                        height: 50,
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*투명컨테이너*/ Container(
                        height: 50,
                      ),
                      MySeperators.withId(positionId: "202307221656"),
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
                      MySeperators.withId(positionId: "202307221656"),
                      /*더블피니트 컨테이너*/ GestureDetector(
                        onTap: ()=> ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar),
                        child: Container(
                          color: Colors.red,    height: 30,
                          width: double.infinity,
                          child: Text("더블인피니트 버튼", style: TextStyle(color: Colors.white)),
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
                                          onPressed: () {

                                          },
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

                          // borderRadius: BorderRadius.circular(0),
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
                        ),
                        child: IconButton(
                          iconSize: 56,
                          icon: const Icon(Icons.message),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                          },
                        ),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*Material()?*/ Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.indigoAccent, width: 4.0),
                            color: Colors.white,
                            // color: Colors.indigo[900],
                            shape: BoxShape.circle,

                            // borderRadius: BorderRadius.circular(0),
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
                      /*별에별 기능 버튼*/ GestureDetector(
                        onTap: (){
                          /*notReadySnackBar*/
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.hello));
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.occuredError));
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.inLoading()));

                          /*미래에 실행할 코드*/
                          Future.delayed(const Duration(milliseconds: 2000), () {
                            /*1000 milliseconds 후 실행할 코드*/ debugSomething("2초 경과했습니다");
                          });

                          /*닫을 까요?*/
                          Navigator.of(context).pop();

                          /*버튼(버튼 클릭 시 5초 뒤 사라질 팝업 실행)*/
                          showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.of(context).pop(true);
                              });
                              return const AlertDialog(
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
                                  backgroundColor: Colors.white,
                                  title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                  content: const Text("당신 경고입니다.\n이번엔 봐줄게요"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        // Navigator.of(context).pop();
                                      },
                                      child: const Text("네! 알겠어요!"),
                                    ),
                                  ],
                                );
                              },
                            );
                          });

                          /*풀스크린다이얼로그*/
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
                          showDialog<String>(
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
                          );

                          /*경고팝업*/
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
                                  backgroundColor: Colors.white,
                                  title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                                  content: const Text("당신 경고입니다.\n이번엔 봐줄게요"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        // Navigator.of(context).pop();
                                      },
                                      child: const Text("네! 알겠어요!"),
                                    ),
                                  ],
                                );
                              },
                            );
                          });

                          /*양식제출*/
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

                          /*양식제출*/
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

                          /*메테리얼배너*/
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

                          /*메테리얼배너*/
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

                          /*미니사이즈 다이얼로그팝업*/
                          showDialog<String>(
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
                                  child: const Text('닫기'),
                                ),
                              ],
                            ),
                          );

                          /*사랑해*/
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

                          /*데이트피커*/
                          showDialog(
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
                                      printWithoutError(date);
                                    },
                                  ),
                                ),
                              );
                            },
                          );

                          /*경고팝업*/
                          showDialog<String>(
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
                                    child: const Text('닫기', style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          );

                          /*경고팝업*/
                          showDialog<String>(
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
                                      child: const Text('닫기', style: TextStyle(color: Colors.white)),
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
                          child:  Column(
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
                        decoration: const BoxDecoration(
                            color: Colors.red
                            ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: TextButton(
                          child: const Text(
                            'TextButton',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                          },
                        ),
                      ),

                      MySeperators.withId(positionId: "202307221656"),
                      /*이미지버튼*/ GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                          },
                          child: Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 300, child: SizedBox(height: 0.1, width: 0.1, child: Image.asset('asset/images/app_webtoon_logo.jpg'))))),
                      MySeperators.withId(positionId: "202307221656"),
                      /*아이콘버튼*/ GestureDetector(
                        child: const Icon(Icons.question_mark, size: 40, color: Colors.pink),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*사진버튼*/
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                        child: Center(child: Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.cover)),
                      ),
                      /*사진버튼*/
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                        child: SizedBox(height: 300, width: 200, child: Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.cover)),
                      ),
                      MySeperators.withId(positionId: "202307221656"),
                      /*사진버튼*/ Center(
                        child: Container(
                          // height:Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.contain).height!*0.7,
                          // width: Image.asset('asset/images/sky_best (1).jpg', fit: BoxFit.contain).width!*0.7,
                          height: 300,
                          width: 200,
                          decoration: const BoxDecoration(),
                        ),
                      ),

                      MySeperators.withId(positionId: "202307221656"),
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

                      MySeperators.withId(positionId: "/*커스텀 앱바*/"),
                      /*커스텀 앱바*/
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            /*뒤로가기 버튼*/ GestureDetector(
                              child: const Icon(Icons.chevron_left, size: 40, color: Colors.redAccent),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                              },
                            ),
                          ],
                        ),
                      ),
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

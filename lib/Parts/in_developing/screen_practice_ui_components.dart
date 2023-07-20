import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/toggle_maker.dart';

import '../helpers/CheckBoxMaker.dart';
import '../helpers/super_worker.dart';

class ScreenPracticeUiComponents extends StatefulWidget {
  @override
  State<ScreenPracticeUiComponents> createState() => _ScreenPracticeUiComponentsState();

  const ScreenPracticeUiComponents({super.key});
}

class _ScreenPracticeUiComponentsState extends State<ScreenPracticeUiComponents> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.9),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(''),
            leading: /*뒤로가기 버튼*/ InkWell(
              child: const Icon(Icons.chevron_left),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /*버튼(토글)*/ ToggleMaker(),
                  /*체크박스*/ const CheckBoxMaker(),
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
                  /*버튼*/ Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 4),
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      iconSize: 56,
                      icon: const Icon(Icons.message),
                      onPressed: () {},
                    ),
                  ),
                  /*버튼*/ Material(
                    type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigoAccent, width: 4.0),
                        color: Colors.indigo[900],
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        //This keeps the splash effect within the circle
                        borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
                        onTap: () {},
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
                  /*버튼*/ TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('경고팝업버튼'),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    child: const Text('Show Dialog'),
                  ),
                  /*버튼*/ TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog.fullscreen(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('경고팝업버튼'),
                            const SizedBox(height: 15),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: const Text('버튼(풀스크린다이얼로그)'),
                  ),
                  /*버튼*/ ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      disabledBackgroundColor:Colors.red,
                      disabledForegroundColor: Colors.orange,
                      foregroundColor: Colors.green,
                      shadowColor: Colors.blue,
                      surfaceTintColor: Colors.purple,
                    ),
                    onPressed: (){
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                              content: const Text("아직 준비되지 않은 서비스입니다!\n준비해서 다시 만나요!"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("알겠어요!"),
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
                    child: const Text('버튼(풀스크린다이얼로그)'),
                  ),
                  /*버튼*/ Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: const Text('GO TO INDEX', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
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
                        Text(textAlign: TextAlign.center, '생성하기', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  /*투명컨테이너*/ const SizedBox(
                    height: 60,
                  ),
                  /*빈컨테이너*/ Container(
                    height: 180,
                    width: (MediaQuery.of(context).size.width - 30) / 2,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
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
                      ),
                    ],
                  ),
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
                      ),
                    ],
                  ),
                  /*더블피니트 컨테이너*/ Container(
                    color: Colors.red,
                    child: const SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Text("더블피니트 컨테이너"),
                    ),
                  ),
                  /*익스펜디드컨테이너*/ Expanded(
                    child: Container(
                      height: 180,
                      color: Colors.red,
                      child: const Text("익스펜디드컨테이너"),
                    ),
                  ),
                  /*경고팝업버튼*/ TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text('Show Dialog'),
                  ),
                  /*경고팝업버튼*/ Container(
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
                        '경고팡업버튼',
                        style: TextStyle(
                          color: Colors.yellow,
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
                                content: const Text("아직 준비되지 않은 서비스입니다!\n준비해서 다시 만나요!"),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("알겠어요!"),
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
                  /*경고팝업버튼*/ Container(
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
                        '경고팡업버튼',
                        style: TextStyle(
                          color: Colors.yellow,
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
                                content: const Text('foo'),
                                insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
                                actions: [
                                  TextButton(
                                    child: const Text('확인'),
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
                  /*경고팝업버튼*/ Container(
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
                        '경고팡업버튼',
                        style: TextStyle(
                          color: Colors.yellow,
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
                  /*경고팝업버튼*/ Container(
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
                        '경고팡업버튼',
                        style: TextStyle(
                          color: Colors.yellow,
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
                          color: Colors.yellow,
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
                                        Navigator.of(context).pop();
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
                          color: Colors.yellow,
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
                  /*메테리얼배너 버튼*/ InkWell(
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
                    child: const Text("메테리얼배너 테스트"),
                  ),
                  /*스낵바 버튼*/ const Center(child: SnackBarTestButton()),
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
                              const Text('pop screen size dialog'),
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
                    child: const Text('Show Dialog'),
                  ),
                  /*풀스크린 다이얼로그 버튼*/ TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog.fullscreen(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('This is a fullscreen dialog.'),
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
                    child: const Text('Full screen size Dialog'),
                  ),
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
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            content: const SingleChildScrollView(
                              child: Text('사랑해', style: TextStyle(color: Colors.blueAccent)),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(
                                  '닫기',
                                  style: TextStyle(color: Colors.lightBlueAccent),
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
                  /*버텀시트*/ TextButton(
                    //IOS showCupertinoDialog 랑 비슷한듯 강의참고.

                    child: const Text('showModalBottomSheet'),
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
                  /*2엣지라운디드버텀시트*/ TextButton(
                    child: const Text('showModalBottomSheet'),
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
                                  printWithoutErrorOrPrintWithError(date);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      "2019.08.10",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SnackBarTestButton extends StatefulWidget {
  const SnackBarTestButton({super.key});

  @override
  State<SnackBarTestButton> createState() => _SnackBarTestButtonState();
}

class _SnackBarTestButtonState extends State<SnackBarTestButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.basicSnackBar());
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.alertSnackBar());
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.loadingSnackBar());
        },
        child: const Text('스낵바 테스트'),
      ),
    );
  }
}

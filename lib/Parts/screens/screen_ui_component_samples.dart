import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/sample_check_box_local_storage.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/sample_toggle.dart';

import '../helpers/my_superworkers.dart';



class ScreenUiComponentSamples extends StatefulWidget {
  @override
  State<ScreenUiComponentSamples> createState() => _ScreenUiComponentSamplesState();

  const ScreenUiComponentSamples({super.key});
}

class _ScreenUiComponentSamplesState extends State<ScreenUiComponentSamples> {
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
                  /*토글버튼*/SampleToggle(),
                  /*체크박스*/SampleCheckBox(),
                  /*닫기 버튼*/ SizedBox(
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
                  /*경고팝업버튼*/ Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
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
                        }); // setState(() {
                      },
                    ),
                  ),
                  /*경고팝업버튼*/ Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
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
                      borderRadius: BorderRadius.circular(15),
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
                      borderRadius: BorderRadius.circular(15),
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
                      borderRadius: BorderRadius.circular(15),
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
                                          padding: EdgeInsets.all(8.0),
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
                  /*양식제출팝업*/Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
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
                  /*메테리얼배너*/ InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        const MaterialBanner(
                          content: Text('이것은 배너 입니다. 첫 번째 페이지로 이동 합니다.'),
                          actions: [
                            TextButton(
                              onPressed: null,
                              child: Text('확인'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text("메테리얼배너 테스트"),
                  ),
                  /*스낵바*/ const Center(child: SnackBarTestButton()),
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
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.NotReadySnackBar);
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.basicSnackBar());
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.alertSnackBar());
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.loadingSnackBar());
        },
        child: const Text('스낵바 테스트'),
      ),
    );
  }
}

Widget RefactoringModule202307152126(var context) {
  return InkWell(
    child: const Icon(Icons.chevron_left),
    onTap: () {
      Navigator.pop(context);
    },
  );
}

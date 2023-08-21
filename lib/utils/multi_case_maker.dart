import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'hardcoding_stamp_maker.dart';
import 'iterable_structure_maker.dart';
import 'super_helper.dart';

class MultiCaseMaker extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius? borderRadius;

  MultiCaseMaker({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.borderRadius,
  }) : super(key: key);

  @override
  State<MultiCaseMaker> createState() => MultiCaseMakerState();
}

class MultiCaseMakerState extends State<MultiCaseMaker> {
  late Map<String, dynamic> stamps;
  var helper = MySuperHelpers();
  int clickCounter = 0;
  late List<dynamic> items;

  // late IterableStringListMaker itemsIterable;

  bool isFirstClick = true;

  late String textFromClipboard;

  late int subItemIndex;

  late String buttonTitle;



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        //
        //
        //
        // /*Bloc cubit 사용해서 상태 Update*/
        // MyAppStateCubit cubit = MyAppStateCubit();
        // cubit.state.multiCaseMakerState = {
        //   "position": {"x": x, "y": y}
        // };
        // cubit.emit(cubit.state);
        // debugSomething(cubit.state.multiCaseMakerState, troubleShootingId: "202308131810");
        //
      },
    );
    clickCounter = 0;


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: MyColors.black12,
        borderRadius: widget.borderRadius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget.paddingHorizontal,
        vertical: widget.paddingVertical,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: Text(
              "멀티케이스스탬프",
              style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
              ),
            ),
            onPressed: null,
          ),
          SizedBox(
            width: 40,
            child: RefactoringMoudle202307131930(
              child: GestureDetector(
                key: widget.key,
                child: Icon(Icons.more_vert, color: MyColors.whiteWithOpacity60Percent),
                onTapDown: (details) {
                  // 아래의 코드는 버튼이 눌린뒤에 위젯트리에 저장이 된다. 내가 하고 싶은 것은 위젯트리에 버튼이 눌리기 전에 저장이 되는 것이다.어떻게 구현하면 가능할까? initState() 에서 자식을 호출할 수 있는 방법이 있는지 모르겠다.

                  // RenderBox renderbox = context.findRenderObject() as RenderBox;
                  // Offset position = renderbox.localToGlobal(Offset.zero);
                  // double x = position.dx;
                  // double y = position.dy;

                  Offset position = details.globalPosition;
                  double x = position.dx;
                  double y = position.dy;

                  /*Bloc cubit 사용해서 상태 Update*/
                  MyAppStateCubit cubit = MyAppStateCubit();
                  cubit.state.multiCaseMakerState = {
                    "position": {"x": x, "y": y}
                  };
                  cubit.emit(cubit.state);
                  debugSomething(cubit.state.multiCaseMakerState, troubleShootingId: "202308131810");
                },
                onTap: () {
                  onAddIconPressed();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String calmelCaseMaker({required String value}) {
    var result = value.split('_');
    for (int i = 0; i < result.length; i++) {
      result[i] = result[i].substring(0, 1).toUpperCase() + result[i].substring(1);
    }
    return result.join('');
  }

  String upperCalmelCaseMaker({required String value}) {
    var result = value.split('_');
    for (int i = 0; i < result.length; i++) {
      result[i] = result[i].substring(0, 1).toUpperCase() + result[i].substring(1);
    }
    return capitalizedCaseMaker(value: result.join(''));
  }

  String snakeCaseMaker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_${result[i].toLowerCase()}';
      }
    }
    return result.join('');
  }

  String capitalizedCaseMaker({required String value}) {
    if (value.isEmpty) {
      return value;
    }
    return value[0].toUpperCase() + value.substring(1);
  }

  String pascalCase({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_${result[i].toLowerCase()}';
      }
    }
    return capitalizedCaseMaker(value: result.join(''));
  }

  String case1Maker({required String value}) {
    return value;
  }

  String case2Maker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_${result[i].toLowerCase()}';
      }
    }
    return result.join('').replaceFirst("_", "");
  }

  String case4Maker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_${result[i].toLowerCase()}';
      }
    }
    return result.join('').replaceFirst("_", "").replaceAll("__", "_");
  }

  String case3Maker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_${result[i].toLowerCase()}';
      }
    }
    return capitalizedCaseMaker(value: result.join('').replaceFirst("_", ""));
  }

  String case5Maker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_${result[i].toLowerCase()}';
      }
    }
    return capitalizedCaseMaker(value: result.join('').replaceFirst("_", "").replaceAll("__", "_"));
  }

  String case6Maker({required String value}) {
    var result = value.split('_');
    for (int i = 0; i < result.length; i++) {
      result[i] = result[i].substring(0, 1).toUpperCase() + result[i].substring(1);
    }
    return result.join('')[0].toLowerCase() + result.join('').substring(1);
  }

  bool isThisDigitUpperCase(String oneDigit) {
    var codeUnit = oneDigit.codeUnitAt(0);
    bool result = false;
    if (codeUnit >= 65 && codeUnit <= 90) {
      // printWithoutProblem('문자열이 대문자입니다.');
      result = true;
    } else if (codeUnit >= 97 && codeUnit <= 122) {
      // printWithoutProblem('문자열이 소문자입니다.');
    } else {
      // printWithoutProblem('문자열이 대소문자가 아닙니다.'); //특수문자?
    }
    return result;
  }

  Future<void> onAddIconPressed() async {
    if (isFirstClick == true) {
      isFirstClick == false;
    }
    await FlutterClipboard.paste().then((value) {
      // setState(() {
      textFromClipboard = value.length <= 60 ? '$value  ' : value.substring(0, 60);
      // });
    });
    items = [
      case4Maker(value: textFromClipboard.trim()),
      calmelCaseMaker(value: textFromClipboard.trim()),
      case6Maker(value: textFromClipboard.trim()),
      case1Maker(value: textFromClipboard.trim()),
      // case2Maker(value: textFromClipboard.trim()),
      // case3Maker(value: textFromClipboard.trim()),
      // case5Maker(value: textFromClipboard.trim()),
      // snakeCaseMaker(value: textFromClipboard.trim()),
      // upperCalmelCaseMaker(value: textFromClipboard.trim()),
      // capitalizedCaseMaker(value: textFromClipboard.trim()),
      // pascalCase(value: textFromClipboard.trim()),
    ];
    buttonTitle = widget.text;
    subItemIndex = 0;
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(buttonTitle, style: TextStyle(color: MyColors.lightBlueShade50, fontSize: 15)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                for (var item in items)
                  Row(
                    children: [
                      Text('${subItemIndex = subItemIndex + 1}: ', style: TextStyle(color: MyColors.lightBlueShade50)),
                      HardCodingStampMaker(txt: item, fontSize: 9),
                    ],
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('', style: TextStyle(color: Colors.lightBlueAccent)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
class RefactoringMoudle202307131930 extends StatefulWidget {
  // var child;
  Widget child;


    RefactoringMoudle202307131930({super.key, required this.child});

  @override
  State<RefactoringMoudle202307131930> createState() => RefactoringMoudle202307131930State();
}

class RefactoringMoudle202307131930State extends State<RefactoringMoudle202307131930> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

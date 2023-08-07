import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'iterable_structure_maker.dart';
import 'hardcoding_stamp_maker.dart';
import 'super_helper.dart';

class MultiCaseMaker extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius? borderRadius;

  MultiCaseMaker({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.borderRadius,
  }) : super(key: key);

  @override
  State<MultiCaseMaker> createState() => _MultiCaseMakerState();
}

class _MultiCaseMakerState extends State<MultiCaseMaker> {
  String itemsToCopy = '-';
  late Map<String, dynamic> stamps;
  var helper = MySuperHelpers();
  int clickCounter = 0;
  late List<dynamic> items;

  // late var naturalNumbers;
  late IterableStringListMaker itemsIterable;

  late String buttonTitle;

  var isCheckboxChecked = false;

  bool isFirstClick = true;

  late String labelText;

  late String titleText;

  late List<dynamic> itemsSnapshotAtStart;

  late int subItemIndex;

  @override
  void initState() {
    super.initState();
    buttonTitle = widget.text;
    initStatesOfThisButton();
    initLabelTextAndTitleText();
    itemsSnapshotAtStart = [...items];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
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
              labelText,
              style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
              ),
            ),
            onPressed: () {
              onTextButtonPressed();
            },
            onHover: (isHovered) {
              if (isHovered) {
                setState(() {
                  initLabelTextAndTitleText();
                });
              } else {
                setState(() {
                  labelText = widget.text.length <= 60 ? '${widget.text}  ' : widget.text.substring(0, 60);
                });
              }
            },
          ),
          SizedBox(
            width: 40,
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.lightGreenAccent),
              onPressed: onAddIconPressed,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (isCheckboxChecked == true) {
                  isCheckboxChecked = false;
                } else {
                  isCheckboxChecked = true;
                }
              });
            },
            icon: isCheckboxChecked == true ? const Icon(Icons.check_box_outlined, color: Colors.lightGreenAccent) : const Icon(Icons.check_box_outline_blank, color: Colors.lightGreenAccent),
          ),
        ],
      ),
    );
  }

  void onTextButtonPressed() {
      if (isFirstClick == true) {
        FlutterClipboard.paste().then((value) {
          labelText = value.length <= 60 ? '$value  ' : value.substring(0, 60);
          setState(() {
            widget.text = labelText;
          });
        });

        /*100 milliseconds 후 실행할 코드 s*/
        Future.delayed(const Duration(milliseconds: 100), () {
          onAddIconPressed();
        });
        /*100 milliseconds 후 실행할 코드 e*/
        isFirstClick == false;
      } else {
        onAddIconPressed();
      }
  }

  void initStatesOfThisButton() {
    reloadItems();
    clickCounter = 0;
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

  void onAddIconPressed() {
    reloadItems();
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(buttonTitle, style: const TextStyle(color: Colors.blueAccent)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                for (var item in items) Row(
                  children: [
                    Text('${subItemIndex = subItemIndex+1}', style: const TextStyle(color: Colors.lightGreenAccent)),
                    HardCodingStampMaker(txt: item, backgroundColor: Colors.black, color: MyColors.whiteClear, fontSize: 9),

                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('닫기', style: TextStyle(color: Colors.lightBlueAccent)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void reloadItems() {
    items = [
      case4Maker(value: widget.text.trim()),
      calmelCaseMaker(value: widget.text.trim()),
      case6Maker(value: widget.text.trim()),
      case1Maker(value: widget.text.trim()),
      case2Maker(value: widget.text.trim()),
      case3Maker(value: widget.text.trim()),
      case5Maker(value: widget.text.trim()),
      snakeCaseMaker(value: widget.text.trim()),
      upperCalmelCaseMaker(value: widget.text.trim()),
      capitalizedCaseMaker(value: widget.text.trim()),
      pascalCase(value: widget.text.trim()),
    ];
    itemsIterable = IterableStringListMaker(items: items);
    buttonTitle = widget.text;

    subItemIndex=0;
  }

  void initLabelTextAndTitleText() {
      titleText = widget.text;
      labelText = '레이블텍스트';
  }
}

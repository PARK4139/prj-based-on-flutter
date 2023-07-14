import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'button_to_move_button_name_into_clipboard.dart';
import 'iterable_structure_maker.dart';
import 'my_superworkers.dart';

class MultiCaseMaker extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  MultiCaseMaker({
    Key? key,
    required this.text,
    required this.background_color,
    required this.color,
    required this.font_size,
    required this.font_weight,
    required this.padding_vertical,
    required this.padding_horizontal,
    required this.border_radius,
  }) : super(key: key);

  @override
  State<MultiCaseMaker> createState() => _MultiCaseMakerState();
}

class _MultiCaseMakerState extends State<MultiCaseMaker> {
  String items_to_copy = '-';
  late Map<String, dynamic> Stamps;
  var helper = My_superworkers();
  int ClickCounter = 0;
  late List<dynamic> items;

  // late var naturalNumbers;
  late var items_iterable;

  var button_title;

  var isCheckboxChecked = false;

  bool isFirstClick = true;

  late String labelText;

  late String titleText;

  late var items_snapshot_at_start;

  late int subItemIndex;

  @override
  void initState() {
    super.initState();
    button_title = widget.text;
    init_states_of_this_button();
    init_label_text();

    items_snapshot_at_start = []..addAll(items);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.background_color,
        borderRadius: widget.border_radius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget.padding_horizontal,
        vertical: widget.padding_vertical,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            // width: 300,
            child: TextButton(
              child: Text(
                labelText,
                style: TextStyle(
                  color: widget.color,
                  fontSize: widget.font_size,
                  fontWeight: widget.font_weight,
                ),
              ),
              onPressed: () {
                onTextButtonPressed();
              },
              onHover: (isHovered) {
                if (isHovered) {
                  setState(() {
                    init_label_text();
                  });
                } else {
                  setState(() {
                    labelText = widget.text.length <= 60 ? widget.text + '  ' : widget.text.substring(0, 60);
                  });
                }
              },
            ),
          ),
          Container(
            width: 40,
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.lightGreenAccent),
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
            icon: isCheckboxChecked == true ? Icon(Icons.check_box_outlined, color: Colors.lightGreenAccent) : Icon(Icons.check_box_outline_blank, color: Colors.lightGreenAccent),
          ),
        ],
      ),
    );
  }

  void onTextButtonPressed() {
      if (isFirstClick == true) {
        FlutterClipboard.paste().then((value) {
          labelText = value.length <= 60 ? value + '  ' : value.substring(0, 60);
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

  void init_states_of_this_button() {
    reload_items();
    ClickCounter = 0;
  }

  String Calmel_case_maker({required String value}) {
    var result = value.split('_');
    for (int i = 0; i < result.length; i++) {
      result[i] = result[i].substring(0, 1).toUpperCase() + result[i].substring(1);
    }
    return result.join('');
  }

  String Upper_calmel_case_maker({required String value}) {
    var result = value.split('_');
    for (int i = 0; i < result.length; i++) {
      result[i] = result[i].substring(0, 1).toUpperCase() + result[i].substring(1);
    }
    return Capitalized_case_maker(value: result.join(''));
  }

  String Snake_case_maker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_' + result[i].toLowerCase();
      }
    }
    return result.join('');
  }

  String Capitalized_case_maker({required String value}) {
    if (value.isEmpty) {
      return value;
    }
    return value[0].toUpperCase() + value.substring(1);
  }

  String pascal_case({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_' + result[i].toLowerCase();
      }
    }
    return Capitalized_case_maker(value: result.join(''));
  }

  String case_1_maker({required String value}) {
    return value;
  }

  String case_2_maker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_' + result[i].toLowerCase();
      }
    }
    return result.join('').replaceFirst("_", "");
  }

  String case_4_maker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_' + result[i].toLowerCase();
      }
    }
    return result.join('').replaceFirst("_", "").replaceAll("__", "_");
  }

  String case_3_maker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_' + result[i].toLowerCase();
      }
    }
    return Capitalized_case_maker(value: result.join('').replaceFirst("_", ""));
  }

  String case_5_maker({required String value}) {
    var result = value.split('');
    for (int i = 0; i < result.length; i++) {
      if (isThisDigitUpperCase(result[i])) {
        result[i] = '_' + result[i].toLowerCase();
      }
    }
    return Capitalized_case_maker(value: result.join('').replaceFirst("_", "").replaceAll("__", "_"));
  }

  bool isThisDigitUpperCase(String one_digit) {
    var codeUnit = one_digit.codeUnitAt(0);
    bool result = false;
    if (codeUnit >= 65 && codeUnit <= 90) {
      // print('문자열이 대문자입니다.');
      result = true;
    } else if (codeUnit >= 97 && codeUnit <= 122) {
      // print('문자열이 소문자입니다.');
    } else {
      // print('문자열이 대소문자가 아닙니다.'); //특수문자?
    }
    return result;
  }

  void onAddIconPressed() {
    reload_items();
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(button_title, style: const TextStyle(color: Colors.blueAccent)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                for (var item in items) Row(
                  children: [
                    Text('${subItemIndex = subItemIndex+1}', style: const TextStyle(color: Colors.lightGreenAccent)),
                    StampIntoClipboard(text: item, background_color: MyColors.black_undefined, color: MyColors.white_clear, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5),doYouWantPopAfterClicking: true),
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

  void reload_items() {
    items = [
      case_1_maker(value: widget.text.trim()),
      case_2_maker(value: widget.text.trim()),
      case_3_maker(value: widget.text.trim()),
      case_4_maker(value: widget.text.trim()),
      case_5_maker(value: widget.text.trim()),
      Calmel_case_maker(value: widget.text.trim()),
      Snake_case_maker(value: widget.text.trim()),
      Upper_calmel_case_maker(value: widget.text.trim()),
      Capitalized_case_maker(value: widget.text.trim()),
      pascal_case(value: widget.text.trim()),
    ];
    items_iterable = IterableStringListMaker(items: items);
    button_title = widget.text;

    subItemIndex=0;
  }

  void init_label_text() {
    setState(() {
      titleText = widget.text;
      labelText = '멀티케이스스탬프 생성';
    });
  }
}

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import '../in_operating/my_functions.dart';
import 'button_to_move_button_name_into_clipboard.dart';
import 'iterable_structure_maker.dart';

class Button_to_maintain_dorm extends StatefulWidget {
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  List<String> texts;

  Button_to_maintain_dorm({
    Key? key,
    required this.background_color,
    required this.color,
    required this.font_size,
    required this.font_weight,
    required this.padding_vertical,
    required this.padding_horizontal,
    required this.border_radius,
    required this.texts,
  }) : super(key: key);

  @override
  State<Button_to_maintain_dorm> createState() => _Button_to_maintain_dormState();
}

class _Button_to_maintain_dormState extends State<Button_to_maintain_dorm> {
  String items_to_copy = '-';
  late Map<String, dynamic> Stamps;
  var helper = MyFunctions();
  int ClickCounter = 0;
  late List<String> items;

  late var items_iterable;
  var items_snapshot_at_start;

  var button_title;

  var isCheckBoxIconPressed = false;

  late var items_length;

  @override
  void initState() {
    super.initState();
    button_title = widget.texts[0];
    init_states_of_this_button();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: TextButton(
                child: Text(
                  widget.texts.length <= 60 ? widget.texts[0] + ' ' : widget.texts[0].substring(0, 60) + ' ',
                  style: TextStyle(
                    color: widget.color,
                    fontSize: widget.font_size,
                    fontWeight: widget.font_weight,
                  ),
                ),
                onPressed: () {
                  onClickThisButton();
                }),
          ),
          Container(
            width: 40,
            child: IconButton(
              icon: Icon(Icons.adb), color: Colors.lightBlueAccent, //상큼
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      title: Text(
                        button_title,
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            for (var item in items_snapshot_at_start) Button_to_move_button_name_into_clipboard(text: item, background_color: MyColors.black_undefined, color: MyColors.white_clear, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
                          ],
                        ),
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
          ),
          // IconButton(
          //   onPressed: toogleCheckBox,
          //   icon: isCheckBoxIconPressed == true ? Icon(Icons.check_box_outlined, color: Colors.lightBlueAccent) : Icon(Icons.check_box_outline_blank, color: Colors.lightBlueAccent),
          // ),
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
      decoration: BoxDecoration(
        color: widget.background_color,
        borderRadius: widget.border_radius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget.padding_horizontal,
        vertical: widget.padding_vertical,
      ),
    );
  }

  void onClickThisButton() {
    setState(() {
      // print("items_iterable.length:"+items_iterable.length_at_born.toString());//DEVELOPMENT
      int i = -1;
      while (true) {
        if (ClickCounter == i) {
          print("ClickCounter:" + ClickCounter.toString()); //DEVELOPMENT
          print('copied : ' + items_to_copy); //DEVELOPMENT
          FlutterClipboard.copy(items_to_copy).then((value) {});
          try {
            items_to_copy = items_iterable.next();
          } catch (e) {
            // print(e);//DEVELOPMENT
            init_states_of_this_button();
            items_to_copy = items_iterable.next();
          }
          widget.texts[0] = items_to_copy;
        }
        i++;
        if (i == items_iterable.item_length_snapshot_at_born + 1) {
          break;
        }
      }
      ClickCounter = ClickCounter + 1;
    });
  }

  void init_states_of_this_button() {
    reload_items();
    ClickCounter = 0;
  }

  void reload_items() {
    setState(() {
      items_length = widget.texts.length;
      items_snapshot_at_start = []..addAll(widget.texts);
      items_iterable = IterableStringListMaker(items: widget.texts);
    });
  }

  void toogleCheckBox() {
    setState(() {
      if (isCheckBoxIconPressed == true) {
        isCheckBoxIconPressed = false;
      } else {
        isCheckBoxIconPressed = true;
      }
    });
  }
}

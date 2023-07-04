import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../in_operating/my_superworkers.dart';
import 'button_to_move_button_name_into_clipboard.dart';

class Button_to_excute_schedule_planed extends StatefulWidget {
  String text;
  late var color;
  final FontWeight font_weight;
  final double font_size;
  final double padding_vertical;
  final double padding_horizontal;
  late BorderRadius? border_radius;
  late Color? background_color;

  List<String> items;

  Button_to_excute_schedule_planed({
    required this.text,
    required this.items,
    this.color = Colors.white38,
    this.font_weight = FontWeight.w200,
    this.font_size = 10,
    this.padding_vertical = 4,
    this.padding_horizontal = 4,
    this.border_radius,
    this.background_color,
  });

  @override
  State<Button_to_excute_schedule_planed> createState() => _Button_to_excute_schedule_planedState();
}

class _Button_to_excute_schedule_planedState extends State<Button_to_excute_schedule_planed> {
  late Map<String, dynamic> Stamps;
  int ClickCounter = 0;
  late List<String> items;

  var items_snapshot_at_start;
  var button_title;
  final LocalStorage storage = LocalStorage('foo.foo');
  late bool isChecked;

  late int items_length;

  @override
  void initState() {
    super.initState();
    button_title = widget.text;

    widget.border_radius ??= BorderRadius.circular(5);
    widget.background_color ??= MyColors.black_background;

    initClickCounter();
    reload_items();
    initIsChecked();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
          /*주제목 버튼*/ Container(
            child: TextButton(
                child: Text(
                  widget.text.length <= 60 ? widget.text + ' ' + ClickCounter.toString() + '/' + items_length.toString() : widget.text.substring(0, 60) + ' ' + ClickCounter.toString() + '/' + items_length.toString(),
                  style: TextStyle(
                    color: widget.color,
                    fontSize: widget.font_size,
                    fontWeight: widget.font_weight,
                  ),
                ),
                onPressed: () {
                  add_click_counter();
                }),
          ),
          Container(
            width: 40,
            child: IconButton(
              icon: Icon(Icons.all_inclusive),
              color: Colors.lightBlueAccent,
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      /*제목 버튼*/ title: Text(button_title, style: TextStyle(color: Colors.blueAccent)),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            for (var items in items_snapshot_at_start) Button_to_move_button_name_into_clipboard(text: items, background_color: MyColors.black_undefined, color: MyColors.white_clear, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        /*닫기*/ TextButton(
                          child: const Text('닫기', style: TextStyle(color: Colors.lightBlueAccent)),
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
          IconButton(
            onPressed: () {
              onToogleIsChecked();
            },
            icon: isChecked == true ? const Icon(Icons.check_box_outlined, color: Colors.lightBlueAccent) : const Icon(Icons.check_box_outline_blank, color: Colors.lightBlueAccent),
          ),
        ],
      ),
    );
  }

  void add_click_counter() {
    setState(() {
      ClickCounter = ClickCounter + 1;
      print('ClickCounter:' + ClickCounter.toString());
    });
  }

  void initClickCounter() {
    ClickCounter = 0;
  }

  void reload_items() {
    items = widget.items;
    items_length = items.length;
    items_snapshot_at_start = []..addAll(items);
  }

  void onToogleIsChecked() {
    setState(() {
      if (isChecked == true) {
        isChecked = false;
      } else {
        isChecked = true;
      }
      storage.setItem('isChecked202307041338', isChecked);
    });
  }

  void initIsChecked() {
    setState(() {
      if (storage.getItem('isChecked202307041338') == null) {
        isChecked = false;
        storage.setItem('isChecked202307041338', isChecked);
      } else {
        isChecked = storage.getItem('isChecked202307041338');
      }
    });
  }
}

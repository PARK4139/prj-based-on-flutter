// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'super_worker.dart';
import 'text_shirikable_stamp_maker.dart';



class PlanedScheduleManagementHelper2 extends StatefulWidget {
  String text;
  late var color;
  final FontWeight fontWeight;
  final double fontSize;
  final double paddingVertical;
  final double paddingHorizontal;
  late BorderRadius? borderRadius;
  late Color? backgroundColor;

  List<String> items;

  PlanedScheduleManagementHelper2({super.key,
    required this.text,
    required this.items,
    this.color = Colors.white38,
    this.fontWeight = FontWeight.w200,
    this.fontSize = 10,
    this.paddingVertical = 4,
    this.paddingHorizontal = 4,
    this.borderRadius,
    this.backgroundColor,
  });

  @override
  State<PlanedScheduleManagementHelper2> createState() => _PlanedScheduleManagementHelper2State();
}

class _PlanedScheduleManagementHelper2State extends State<PlanedScheduleManagementHelper2> {
  late Map<String, dynamic> Stamps;
  int ClickCounter = 0;
  late List<String> items;

  var itemsSnapshotAtStart;
  var buttonTitle;
  final LocalStorage storage = LocalStorage('foo.foo');
  late bool isChecked;

  late int itemsLength;

  @override
  void initState() {
    super.initState();
    buttonTitle = widget.text;

    widget.borderRadius ??= BorderRadius.circular(5);
    widget.backgroundColor ??= MyColors.blackBackground;

    initClickCounter();
    reloadItems();
    initIsChecked();
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
          /*주제목 버튼*/ TextButton(
              child: Text(
                widget.text.length <= 60 ? '${widget.text} 0/$itemsLength' : '${widget.text.substring(0, 60)} 0/$itemsLength',
                style: TextStyle(
                  color: widget.color,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                ),
              ),
              onPressed: () {
                add_click_counter();
              }),
          SizedBox(
            child: IconButton(
              icon: const Icon(Icons.all_inclusive),
              color: Colors.lightBlueAccent,
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      /*제목 버튼*/ title: Text(buttonTitle, style: const TextStyle(color: Colors.blueAccent)),
                      /*스탬프들*/ content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            for (var item in itemsSnapshotAtStart)
                              Row(
                                children: [
                                  Text('${itemsSnapshotAtStart.indexOf(item)}', style: const TextStyle(color: Colors.lightGreenAccent)),
                                  SizedBox( child: TextShirikableStampMaker(text: item, isMainContentClicked: false)),
                                ],
                              ),
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
      printWithoutErrorOrPrintWithError('ClickCounter:$ClickCounter');
    });
  }

  void initClickCounter() {
    ClickCounter = 0;
  }

  void reloadItems() {
    items = widget.items;
    itemsLength = items.length;
    itemsSnapshotAtStart = [...items];
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

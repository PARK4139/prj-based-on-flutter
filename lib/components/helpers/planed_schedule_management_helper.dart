// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'super_helper.dart';

class PlanedScheduleManagementHelper extends StatefulWidget {
  String title;
  late Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final double paddingVertical;
  final double paddingHorizontal;
  late BorderRadius? borderRadius;
  late Color? backgroundColor;

  List<dynamic> items;

  PlanedScheduleManagementHelper({
    super.key,
    required this.title,
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
  State<PlanedScheduleManagementHelper> createState() => _PlanedScheduleManagementHelperState();
}

class _PlanedScheduleManagementHelperState extends State<PlanedScheduleManagementHelper> {
  int clickCounter = 0;
  late List<dynamic> items;

  late List<dynamic> itemsSnapshotAtStart;
  late String buttonTitle;
  final LocalStorage storage = LocalStorage('foo.foo');
  late bool isChecked;

  late int itemsLength;

  @override
  void initState() {
    super.initState();
    buttonTitle = widget.title;

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
                widget.title.length <= 60 ? '${widget.title} i/$itemsLength' : '${widget.title.substring(0, 60)} i/$itemsLength',
                style: TextStyle(
                  color: widget.color,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                ),
              ),
              onPressed: () {
                addClickCounter();
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
                        child: Builder(
                          builder: (context) {

                            return ListBody(
                              children: <Widget>[
                                for (var item in itemsSnapshotAtStart)
                                  Row(
                                    children: [
                                      Text(itemsSnapshotAtStart.indexOf(item).toString().padLeft(2, " "), style: const TextStyle(color: Colors.lightGreenAccent)),
                                      SizedBox(child: item),
                                    ],
                                  ),
                              ],
                            );
                          }
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

  void addClickCounter() {
    setState(() {
      clickCounter = clickCounter + 1;
      printWithoutError('ClickCounter:$clickCounter');
    });
  }

  void initClickCounter() {
    clickCounter = 0;
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

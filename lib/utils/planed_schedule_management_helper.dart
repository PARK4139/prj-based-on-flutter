// ignore_for_file: must_be_immutable

import 'dart:async';

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
  final LocalStorage localStorage = LocalStorage('foo.foo');
  late bool isCheckboxChecked;
  late int itemsLength;
  late Timer tickTimer;

  @override
  void initState() {
    super.initState();


    widget.borderRadius ??= BorderRadius.circular(5);
    // widget.backgroundColor ??= MyColors.black12;

    clickCounter = 0;

    setState(() {
      if (localStorage.getItem('isChecked202307041338') == null) {
        isCheckboxChecked = false;
        localStorage.setItem('isChecked202307041338', isCheckboxChecked);
      } else {
        isCheckboxChecked = localStorage.getItem('isChecked202307041338');
      }
    });

    tickTimer = Timer.periodic(const Duration(seconds: 1), reloadItems);
  }

  @override
  void dispose() {
    super.dispose();

    tickTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: widget.backgroundColor,
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
            onPressed: null,
            child: Text(
              widget.title.length <= 60 ? widget.title : widget.title.substring(0, 60),
              style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
              ),
            ),
          ),
          SizedBox(
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              color: MyColors.whiteWithOpacity60Percent,
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog( backgroundColor: Colors.black,
                      /*제목 버튼*/ title: Text(widget.title, style: TextStyle(color: MyColors.lightBlueShade50,fontSize: 15)),
                      /*스탬프들*/ content: SingleChildScrollView(
                        child: Builder(builder: (context) {
                          return ListBody(
                            children: <Widget>[
                              for (var item in itemsSnapshotAtStart)
                                Row(
                                  children: [
                                    Text(itemsSnapshotAtStart.indexOf(item).toString().padLeft(2, " "), style:   TextStyle(color: MyColors.whiteWithOpacity60Percent)),
                                    SizedBox(child: item),
                                  ],
                                ),
                            ],
                          );
                        }),
                      ),
                      actions: <Widget>[
                        /*닫기*/ TextButton(
                          child: const Text('', style: TextStyle(color: Colors.lightBlueAccent)),
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
        ],
      ),
    );
  }

  // void addClickCounter() {
  //   setState(() {
  //     clickCounter = clickCounter + 1;
  //     printWithoutWarning('ClickCounter:$clickCounter');
  //   });
  // }



  void reloadItems(Timer timer) {
    itemsSnapshotAtStart = [...widget.items];
  }

  void onToogleIsChecked() {
    setState(() {
      if (isCheckboxChecked == true) {
        isCheckboxChecked = false;
      } else {
        isCheckboxChecked = true;
      }
      localStorage.setItem('isChecked202307041338', isCheckboxChecked);
    });
  }


}

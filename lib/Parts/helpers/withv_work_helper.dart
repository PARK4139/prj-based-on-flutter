import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'iterable_structure_maker.dart';
import 'stamp_maker.dart';
import 'super_helper.dart';
// late String requester_date;
// late String requester_summary;
// late String requester_ment;
// late String request_school_name;
// late String dgist_dorms_type;
// late String requester_name;
// late String request_year;
// late String request_code;
// late String std_no;
// late String std_name;
// late String request_context;

class WithvedormMaintainanceHelper extends StatefulWidget {
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius? borderRadius;

  List<String> texts;

  WithvedormMaintainanceHelper({
    Key? key,
    required this.backgroundColor,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.borderRadius,
    required this.texts,
  }) : super(key: key);

  @override
  State<WithvedormMaintainanceHelper> createState() => _WithvedormMaintainanceHelperState();
}

class _WithvedormMaintainanceHelperState extends State<WithvedormMaintainanceHelper> {
  String itemsToCopy = '-';
  late Map<String, dynamic> stamps;
  var helper = MySuperworkers();
  int clickCounter = 0;
  late List<String> items;

  late var itemsIterable;
  var itemsSnapshotAtStart;

  var buttonTitle;

  var isCheckBoxIconPressed = false;

  late var itemsLength;

  @override
  void initState() {
    super.initState();
    buttonTitle = widget.texts[0];
    initStatesOfThisButton();
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
                widget.texts.length <= 60 ? '${widget.texts[0]} ' : '${widget.texts[0].substring(0, 60)} ',
                style: TextStyle(
                  color: widget.color,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                ),
              ),
              onPressed: () {
                onClickThisButton();
              }),
          SizedBox(
            width: 40,
            child: IconButton(
              icon: const Icon(Icons.adb), color: Colors.lightBlueAccent, //상큼
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      title: Text(
                        buttonTitle,
                        style: const TextStyle(color: Colors.blueAccent),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            for (var item in itemsSnapshotAtStart) StampMaker(text: item, backgroundColor: MyColors.blackUndefined, color: MyColors.whiteClear, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 5, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
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
      ),
    );
  }

  void onClickThisButton() {
    setState(() {
      // print("itemsIterable.length:"+itemsIterable.length_at_born.toString());//DEVELOPMENT
      int i = -1;
      while (true) {
        if (clickCounter == i) {
          printWithoutErrorOrPrintWithError("ClickCounter:$clickCounter"); //DEVELOPMENT
          printWithoutErrorOrPrintWithError('copied : $itemsToCopy'); //DEVELOPMENT
          FlutterClipboard.copy(itemsToCopy).then((value) {});
          try {
            itemsToCopy = itemsIterable.next();
          } catch (e) {
            // print(e);//DEVELOPMENT
            initStatesOfThisButton();
            itemsToCopy = itemsIterable.next();
          }
          widget.texts[0] = itemsToCopy;
        }
        i++;
        if (i == itemsIterable.itemLengthSnapshotAtBorn + 1) {
          break;
        }
      }
      clickCounter = clickCounter + 1;
    });
  }

  void initStatesOfThisButton() {
    reloadItems();
    clickCounter = 0;
  }

  void reloadItems() {
    setState(() {
      itemsLength = widget.texts.length;
      itemsSnapshotAtStart = [...widget.texts];
      itemsIterable = IterableStringListMaker(items: widget.texts);
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

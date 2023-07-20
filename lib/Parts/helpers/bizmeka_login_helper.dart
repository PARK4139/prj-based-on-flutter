import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'iterable_structure_maker.dart';
import 'stamp_maker.dart';
import 'super_helper.dart';

class BizmekaLoginHelper extends StatefulWidget {
  String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final Color backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius borderRadius;

  BizmekaLoginHelper({
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
  State<BizmekaLoginHelper> createState() => _BizmekaLoginHelperState();
}

class _BizmekaLoginHelperState extends State<BizmekaLoginHelper> {
  String itemsToCopy = '-';
  late Map<String, dynamic> stamps;
  var helper = MySuperworkers();
  int clickCounter = 0;
  late List<String> items;

  // late var naturalNumbers;
  late var itemsIterable;
  var itemsSnapshotAtStart;

  var buttonTitle;

  /*2*/
  final LocalStorage storage = LocalStorage('foo.foo');

  /*1*/
  late bool isChecked;

  late var itemsLength;

  @override
  void initState() {
    super.initState();
    buttonTitle = widget.text;
    initStatesOfThisButton();
    /*6*/
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
          TextButton(
              child: Text(
                widget.text.length <= 60 ? '${widget.text} $clickCounter/$itemsLength' : '${widget.text.substring(0, 60)} $clickCounter/$itemsLength',
                style: TextStyle(
                  color: widget.color,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                ),
              ),
              onPressed: () {
                processBySpecialOrderedByMe();
              }),
          SizedBox(
            width: 40,
            child: IconButton(
              // icon: Icon(Icons.fact_check),
              icon: const Icon(
                Icons.add,
                // color: MyColors.cautionOrange1,
                // color: Colors.blue, //어둡
                // color: Colors.lightBlue, //덜 상큼
                color: Colors.lightBlueAccent, //상큼
                // color: Colors.blueAccent, //침착
              ),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      title: Text(buttonTitle, style: const TextStyle(color: Colors.blueAccent)),
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
          IconButton(
            onPressed: /*5*/ onToogleIsChecked,
            icon: isChecked == true
                ? const Icon(
                    // Icons.check,
                    Icons.check_box_outlined,
                    color: Colors.lightBlueAccent)
                : const Icon(Icons.check_box_outline_blank, color: Colors.lightBlueAccent),
          ),
        ],
      ),
    );
  }

  void processBySpecialOrderedByMe({
    String? hostOperatingEnvironment, //아무래도 언젠가 이게 꼭 필요하지않을까 생각된다
  }) {
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
          widget.text = itemsToCopy;
        }
        i++;
        if (i == itemsIterable.itemLengthSnapshotAtBorn + 1) {
          break;
        }
      }
      clickCounter = clickCounter + 1;
    });
  }

  Future<void> runUrl({
    required String url,
    String? mode,
  }) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void initStatesOfThisButton() {
    reloadItems();
    clickCounter = 0;
  }

  void reloadItems() {
    // Stamps = COMMON_TEXT_DATA().STAMPS;
    items = [
      // buttonTitle+'[시작]', //DEVELOPMENT
      'https://ezgroupware.bizmeka.com/groupware/todo/listMenuStoredTaskView.do?folderId=1263453&folderName=&#37;EC&#37;9D&#37;BC&#37;EC&#37;9D&#37;BC&#37;EC&#37;97&#37;85&#37;EB&#37;AC&#37;B4&#37;EB&#37;B3&#37;B4&#37;EA&#37;B3&#37;A0&#37;EC&#37;84&#37;9C_&#37;EC&#37;86&#37;94&#37;EB&#37;A3&#37;A8&#37;EC&#37;85&#37;98&#37;ED&#37;8C&#37;80',
      'pjh*****',
      's2*******s2@',
      //buttonTitle + '[완료]',
      buttonTitle,
    ];
    itemsLength = items.length;
    itemsSnapshotAtStart = [...items]; //이것도 items 를 참조하는 것 때문에 문제가 되는 것 같기도함..
    itemsIterable = IterableStringListMaker(items: items);
  }

  /*3*/
  void onToogleIsChecked() {
    setState(() {
      if (isChecked == true) {
        isChecked = false;
      } else {
        isChecked = true;
      }
      storage.setItem('isChecked202307041300', isChecked);
    });
  }

  /*4*/
  void initIsChecked() {
    setState(() {
      if (storage.getItem('isChecked202307041300') == null) {
        isChecked = false;
        storage.setItem('isChecked202307041300', isChecked);
      } else {
        isChecked = storage.getItem('isChecked202307041300');
      }
    });
  }
}

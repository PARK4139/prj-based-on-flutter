import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'iterable_structure_maker.dart';
import 'hardcoding_stamp_maker.dart';
import 'super_helper.dart';


class BizmekaDailyReportSubmitHelper extends StatefulWidget {
  String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final Color backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius borderRadius;

  BizmekaDailyReportSubmitHelper({
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
  State<BizmekaDailyReportSubmitHelper> createState() => _BizmekaDailyReportSubmitHelperState();
}

class _BizmekaDailyReportSubmitHelperState extends State<BizmekaDailyReportSubmitHelper> {
  String itemsToCopy = '-';
  late Map<String, dynamic> stamps;
  var helper = MySuperHelpers();
  int clickCounter = 0;
  late List<String> items;

  late IterableStringListMaker itemsIterable;
  late List<dynamic> itemsSnapshotAtStart;

  late String buttonTitle;

  final LocalStorage storage = LocalStorage('foo.foo');

  late bool isChecked;

  late int itemsLength;

  @override
  void initState() {
    super.initState();
    buttonTitle = widget.text;
    initStatesOfThisButton();

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
              icon: const Icon(Icons.announcement_rounded),
              color: Colors.lightBlueAccent,
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
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
                            for (var item in itemsSnapshotAtStart) hardCodingStampMaker(txt: item, backgroundColor: MyColors.blackUndefined, color: MyColors.whiteClear, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 5, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
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
            onPressed: onToogleIsChecked,
            icon: isChecked == true
                ? const Icon(
                    Icons.check_box_outlined,
                    color: Colors.lightBlueAccent,
                  )
                : const Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.lightBlueAccent,
                  ),
          ),
        ],
      ),
    );
  }

  void processBySpecialOrderedByMe({
    String? hostOperatingEnvironment,
  }) {
    setState(() {
      int i = -1;
      while (true) {
        if (clickCounter == i) {
          printWithoutError("ClickCounter:$clickCounter");
          printWithoutError('copied : $itemsToCopy');
          FlutterClipboard.copy(itemsToCopy).then((value) {});
          try {
            itemsToCopy = itemsIterable.next();
          } catch (e) {
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

  // bool _onKey(KeyEvent event, [bool isCtrlPressed = false, bool isVPressed = false, bool isCtrlVPressed = false]) {
  //   var key = event.logicalKey.keyLabel;
  //   if (event is KeyDownEvent) {
  //   } else if (event is KeyUpEvent) {
  //   } else if (event is KeyRepeatEvent) {}
  //   print(event.logicalKey.keyLabel);
  //   if (event.logicalKey.keyLabel.contains('Control Left')) {
  //     isCtrlPressed = true;
  //   }
  //   print(event.logicalKey.keyLabel);
  //   if (event.logicalKey.keyLabel.contains('V')) {
  //     isVPressed = true;
  //   }
  //   print(event.logicalKey.keyLabel);
  //   if (isCtrlPressed == true && isVPressed == true) {
  //     isCtrlVPressed = true;
  //   } else {}
  //
  //   if (isCtrlVPressed == true) {
  //     printWithoutErrorOrPrintWithError('조합키로서 ctrl V 눌렸습니다.');
  //   }
  //
  //   return false;
  // }

  void initStatesOfThisButton() {
    reloadItems();
    clickCounter = 0;
  }

  void reloadItems() {
    items = [
      '$buttonTitle[시작]',
      'https:',
      'pjh*****',
      's2*******s2@',
      '',

      '유지보수',
      '로직확인',
      'SVN 백업',
      'ㆍ{{요청학교명}} {{요청자명}}\n{{모집년도}} {{모집구분}} {{학번}} {{학생이름}} {{요청내용}}\n\t요청대로 처리[완료]',
      'ㆍsvn 목요백업 수행\n\t125번 svn 서버 소스 백업[완료]',
      'ㆍ대구과기대 (이성은)',
      'ㆍ대구과기대 (이성은)\n2023년 여름방학 정예훈 202211180 예치금 0원으로 처리 요청\n\t요청대로 처리[완료]',
      'ㆍ대구과기대 (이혜인)',
      'ㆍ건국대 (김혜정)',
      'ㆍ건국대 (윤성식)',
      'ㆍ건국대 (윤성식)\n2023년 여름방학 202011665 노경호 외 2명 1인실-레에서 1인실로 변경요청\n\t요청대로 처리[완료]',
      'ㆍ인하공전 ()\n\n',
      'ㆍ서강대 (이영선)\n20230514 남예림 남에서 여로 성별변경 요청\n\t요청대로 처리[완료]',
      'ㆍ장안대 (이유진)\n\n',
      'OS 및 MS Office 주문 요청[완료]\n\n윈도우 설치[완료]\n윈도우 드라이버 업데이트[완료]\n윈도우 업데이트[완료]\n윈도우 인증[완료]\n\n\noffice 설치[완료]\noffice 인증[완료]\n\n\n보안프로그램 설치[완료]\n\n\n보안프로그램 인증[완료]\n\n\n※금주까지 수행완료예정',
      '____________요청',
      '\t요청대로 처리[완료]',
      '\t운영 서버 반영[완료]',
      '\tsvn 서버 반영[완료]',
      '\t유지보수엑셀 작성[완료]',
      '[완료]',
      '100 %',
      '0 %',
      buttonTitle,
    ];
    itemsLength = items.length;
    itemsSnapshotAtStart = [...items];
    itemsIterable = IterableStringListMaker(items: items);
    setState(() {});
  }

  void onToogleIsChecked() {
    setState(() {
      if (isChecked == true) {
        isChecked = false;
      } else {
        isChecked = true;
      }
      storage.setItem('isChecked202307041309', isChecked);
    });
  }

  void initIsChecked() {
    setState(() {
      if (storage.getItem('isChecked202307041309') == null) {
        isChecked = false;
        storage.setItem('isChecked202307041309', isChecked);
      } else {
        isChecked = storage.getItem('isChecked202307041309');
      }
    });
  }
}

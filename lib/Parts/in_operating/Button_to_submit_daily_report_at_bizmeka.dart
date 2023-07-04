import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../in_operating/my_superworkers.dart';
import 'button_to_move_button_name_into_clipboard.dart';
import 'iterable_structure_maker.dart';

class Button_to_submit_daily_report_at_bizmeka extends StatefulWidget {
  String text;
  final Color color;
  final FontWeight font_weight;
  final double font_size;
  final Color background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius border_radius;

  Button_to_submit_daily_report_at_bizmeka({
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
  State<Button_to_submit_daily_report_at_bizmeka> createState() => _Button_to_submit_daily_report_at_bizmekaState();
}

class _Button_to_submit_daily_report_at_bizmekaState extends State<Button_to_submit_daily_report_at_bizmeka> {
  String items_to_copy = '-';
  late Map<String, dynamic> Stamps;
  var helper = My_superworkers();
  int ClickCounter = 0;
  late List<String> items;

  late var items_iterable;
  var items_snapshot_at_start;

  var button_title;

  final LocalStorage storage = LocalStorage('foo.foo');

  late bool isChecked;

  late var items_length;

  @override
  void initState() {
    super.initState();
    button_title = widget.text;
    init_states_of_this_button();

    initIsChecked();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
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
                  process_by_special_ordered_by_me();
                }),
          ),
          Container(
            width: 40,
            child: IconButton(
              icon: Icon(Icons.announcement_rounded),
              color: Colors.lightBlueAccent,
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
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
          IconButton(
            onPressed: onToogleIsChecked,
            icon: isChecked == true
                ? Icon(
                    Icons.check_box_outlined,
                    color: Colors.lightBlueAccent,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.lightBlueAccent,
                  ),
          ),
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

  void process_by_special_ordered_by_me({
    String? hostOperatingEnvironment,
  }) {
    setState(() {
      int i = -1;
      while (true) {
        if (ClickCounter == i) {
          print("ClickCounter:" + ClickCounter.toString());
          print('copied : ' + items_to_copy);
          FlutterClipboard.copy(items_to_copy).then((value) {});
          try {
            items_to_copy = items_iterable.next();
          } catch (e) {
            init_states_of_this_button();
            items_to_copy = items_iterable.next();
          }
          widget.text = items_to_copy;
        }
        i++;
        if (i == items_iterable.item_length_snapshot_at_born + 1) {
          break;
        }
      }
      ClickCounter = ClickCounter + 1;
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

  bool _onKey(KeyEvent event, [bool isCtrlPressed = false, bool isVPressed = false, bool isCtrlVPressed = false]) {
    var key = event.logicalKey.keyLabel;
    if (event is KeyDownEvent) {
    } else if (event is KeyUpEvent) {
    } else if (event is KeyRepeatEvent) {}
    print(event.logicalKey.keyLabel);
    if (event.logicalKey.keyLabel.contains('Control Left')) {
      isCtrlPressed = true;
    }
    print(event.logicalKey.keyLabel);
    if (event.logicalKey.keyLabel.contains('V')) {
      isVPressed = true;
    }
    print(event.logicalKey.keyLabel);
    if (isCtrlPressed == true && isVPressed == true) {
      isCtrlVPressed = true;
    } else {}

    if (isCtrlVPressed == true) {
      print('조합키로서 ctrl V 눌렸습니다.');
    }

    return false;
  }

  void init_states_of_this_button() {
    reload_items();
    ClickCounter = 0;
  }

  void reload_items() {
    items = [
      button_title + '[시작]',
      'https:',
      'pjh*****',
      's2*******s2@',
      '',
      "일일업무보고_박정훈_" + formatDate(DateTime.now(), [yyyy, '', mm, '', dd]),
      '이규',
      '김주',
      "(" + formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]) + ")",
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
      button_title,
    ];
    items_length = items.length;
    items_snapshot_at_start = []..addAll(items);
    items_iterable = IterableStringListMaker(items: items);
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

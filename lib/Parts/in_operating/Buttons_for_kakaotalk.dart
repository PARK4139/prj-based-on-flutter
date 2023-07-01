import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';


import 'Button_to_move_button_name_into_clipboard.dart';
import 'Iterable_structure_maker.dart';
import '../in_operating/My_functions.dart';
import '../in_developing/Buttons.dart';
import 'Rainbow_text.dart';

class Buttons_for_kakaotalk extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  Buttons_for_kakaotalk({
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
  State<Buttons_for_kakaotalk> createState() => _Buttons_for_kakaotalkState();
}

class _Buttons_for_kakaotalkState extends State<Buttons_for_kakaotalk> {
  String items_to_copy = '-';
  late Map<String, dynamic> Stamps;
  var helper = MyFunctions();
  int ClickCounter = 0;
  late List<String> items;

  // late var naturalNumbers;
  late var items_iterable;
  var items_snapshot_at_start;

  var button_title;

  var isCheckBoxIconPressed = false;

  late int items_length;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    button_title = widget.text;
    init_states_of_this_button();
    //currentWindow  vs   newTab  vs  newWindow

    //currentWindow  vs   newTab
    //way1
    // String option_blank_or_self = '_blank'; // _self
    // js.context.callMethod('open', [url.toString(), option_blank_or_self]);
    //way2
    // html.window.open(url.toString(), 'new tab');
    //way2-1
    // html.window.location.href = url.toString();
    //way3
    // launch(url.toString(), isNewTab: true);

    //newTab
    // runUrl(url:URL); //이것도 안되네...기존 login 정보 접근 불가.

    //newWindow

    // html.window.onKeyPress.listen((html.KeyboardEvent e) {
    //   print(e.charCode.toString() + " " + new String.fromCharCode(e.charCode));
    // });

    // ServicesBinding.instance.keyboard.addHandler(_onKey);

    // naturalNumbers = NaturalNumbers(EndLimit: 100);

    // print(items_iterable.All().toString());
    // items_iterable.next();
    // items_iterable.next();
    // items_iterable.next();
    // print(items_iterable.first_at_born().toString());
    // print(items_iterable.first_at_born());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            // width: 300,
            child: TextButton(
                child: Rainbow_text(
                  text: widget.text.length <= 60 ? widget.text + ' ' + ClickCounter.toString() + '/' + items_length.toString() : widget.text.substring(0, 60) + ' ' + ClickCounter.toString() + '/' + items_length.toString(),
                  color: widget.color, /*Colors.grey.withOpacity(0.9)*/
                  font_size:  widget.font_size,
                  font_weight: widget.font_weight,
                  isRainbowMode: false,
                ),
                onPressed: () {
                  process_by_special_ordered_by_me();
                }),
          ),
          Container(
            width: 40,
            child: IconButton(
              icon: Icon(Icons.animation),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      title: Text(button_title,style: TextStyle(color: Colors.blueAccent),),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            for (var item in items_snapshot_at_start) Button_to_move_button_name_into_clipboard(text: item,
                                background_color: Colors.amberAccent.withOpacity(0.8),
                                color: Colors.black,
                                font_size: 10,
                                font_weight: FontWeight.w200,
                                padding_vertical: 5,
                                padding_horizontal: 4,
                                border_radius: BorderRadius.circular(5)),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('닫기',style: TextStyle(color: Colors.lightBlueAccent),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                // if (_formKey.currentState.validate()) {
                //   _formKey.currentState.save();
                // }
              },
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (isCheckBoxIconPressed == true) {
                  isCheckBoxIconPressed = false;
                } else {
                  isCheckBoxIconPressed = true;
                }
              });
            },
            icon: isCheckBoxIconPressed == true
                ? Icon(
              // Icons.check,
              Icons.check_box_outlined,
              color: Colors.lightBlueAccent, //상큼
            )
                : Icon(
              Icons.check_box_outline_blank,
              color: Colors.lightBlueAccent, //상큼
            ),
            //check_box_outline_blank
            //         Icon(
            //           Icons.check_box_outline_blank,
            //           color: Colors.lightBlueAccent, //상큼
            //         ),
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
    String? hostOperatingEnvironment, //아무래도 언젠가 이게 꼭 필요하지않을까 생각된다
  }) {
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
    //keyboard infinite loop  입니다.  ctrl v 를 눌러야만 나갈 수 있습니다.
    var key = event.logicalKey.keyLabel;
    if (event is KeyDownEvent) {
      // print("Key down: $key");
    } else if (event is KeyUpEvent) {
      // print("Key up: $key");
    } else if (event is KeyRepeatEvent) {
      // print("Key repeat: $key");
    }
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
    } else {
      // isCtrlVPressed = false;
      // isCtrlPressed = false;
      // isVPressed = false;
    }
    // print(isCtrlVPressed);

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
    // Stamps = COMMON_TEXT_DATA().STAMPS;
    items = [
      '언제쯤 될것같아?',
      '언제까지 될것같아?',
      '확인해보고 말씀드리겠습니다',
      '확인해보겠습니다',
      '5분에서 10분 정도 걸릴것 같습니다',
      '15분 정도 걸릴것 같습니다',
      '30분 정도 걸릴것 같습니다',
      '1시간 정도 걸릴것 같습니다',
      '부장님 125번 접속 시도해도 되겠습니까?',
      '부장님 이거 먼저 처리할까요?',
      '유지보수 엑셀 업데이트 해두었습니다.\n수고하셨습니다',
      '넵! 부장님도 잘 쉬십시오\n다음주에 뵙겠습니다!',
      '네 부장님 오늘도 고생하셨습니다.\n다음주에 뵙겠습니다^^.',
      '수고하셨습니다',
      '처리하였습니다',
      '부장님 처리했습니다',
      '________________',
      button_title,
    ];
    items_length = items.length;
    items_snapshot_at_start = []..addAll(items); //이것도 items 를 참조하는 것 때문에 문제가 되는 것 같기도함..
    items_iterable = IterableStringListMaker(items: items);
  }
}

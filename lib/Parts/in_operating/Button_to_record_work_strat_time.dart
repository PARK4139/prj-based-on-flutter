import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../in_operating/my_superworkers.dart';
import 'button_to_move_button_name_into_clipboard.dart';
import 'iterable_structure_maker.dart';

class Button_to_record_work_strat_time extends StatefulWidget {
  String text;
  final Color color;
  final FontWeight font_weight;
  final double font_size;
  final Color background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius border_radius;

  Button_to_record_work_strat_time({
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
  State<Button_to_record_work_strat_time> createState() => _Button_to_record_work_strat_timeState();
}

class _Button_to_record_work_strat_timeState extends State<Button_to_record_work_strat_time> {
  String items_to_copy = '-';
  late Map<String, dynamic> Stamps;
  var helper = My_superworkers();
  int ClickCounter = 0;
  late List<String> items;

  // late var naturalNumbers;
  late var items_iterable;
  var items_snapshot_at_start;

  var button_title;
  
  final LocalStorage storage = LocalStorage('foo.foo');

  
  late bool isChecked;

  late int items_length;

  @override
  void initState() {
    super.initState();
    button_title = widget.text;
    init_states_of_this_button();
    
    initIsChecked();
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
          Container(
            // width: 300,
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
              icon: Icon(
                Icons.animation,
              ),
              color: Colors.lightBlueAccent, //상큼
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
                // if (_formKey.currentState.validate()) {
                //   _formKey.currentState.save();
                // }
              },
            ),
          ),
          IconButton(
            onPressed:  onToogleIsChecked,
            icon: isChecked == true
                ? const Icon(
                    // Icons.check,
                    Icons.check_box_outlined,
                    color: Colors.lightBlueAccent, //상큼
                  )
                : const Icon(
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
      // button_title+'[시작]', //DEVELOPMENT
      'https://ezgroupware.bizmeka.com/groupware/todo/listMenuStoredTaskView.do?folderId=1263453&folderName=&#37;EC&#37;9D&#37;BC&#37;EC&#37;9D&#37;BC&#37;EC&#37;97&#37;85&#37;EB&#37;AC&#37;B4&#37;EB&#37;B3&#37;B4&#37;EA&#37;B3&#37;A0&#37;EC&#37;84&#37;9C_&#37;EC&#37;86&#37;94&#37;EB&#37;A3&#37;A8&#37;EC&#37;85&#37;98&#37;ED&#37;8C&#37;80',
      'pjh*****',
      's2*******s2@',
      'https://ezkhuman.bizmeka.com/product/outlnk.do?code=PJ02&',
      '//출근',
      // button_title+'[완료]',
      button_title,
    ];
    items_length = items.length;
    items_snapshot_at_start = []..addAll(items); //이것도 items 를 참조하는 것 때문에 문제가 되는 것 같기도함..
    items_iterable = IterableStringListMaker(items: items);
  }

  
  void onToogleIsChecked() {
    setState(() {
      if (isChecked == true) {
        isChecked = false;
      } else {
        isChecked = true;
      }
      storage.setItem('isChecked202307041308', isChecked);
    });
  }

  
  void initIsChecked() {
    setState(() {
      if (storage.getItem('isChecked202307041308') == null) {
        isChecked = false;
        storage.setItem('isChecked202307041308', isChecked);
      } else {
        isChecked = storage.getItem('isChecked202307041308');
      }
    });
  }
}

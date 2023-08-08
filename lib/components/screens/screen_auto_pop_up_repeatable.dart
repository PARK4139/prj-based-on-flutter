import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/super_helper.dart';



class ScreenAutoPopUpRepeatable extends StatefulWidget {
  const ScreenAutoPopUpRepeatable({Key? key}) : super(key: key);

  @override
  State<ScreenAutoPopUpRepeatable> createState() => _ScreenAutoPopUpRepeatableState();
}

class _ScreenAutoPopUpRepeatableState extends State<ScreenAutoPopUpRepeatable> {
  final clearButtonKey = GlobalKey();
  late Timer autoClickScheduler;

  @override
  void initState() {
    super.initState();
    autoClickScheduler = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      autoClick();
    });
  }

  @override
  void dispose() {
    autoClickScheduler.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            /*버튼(버튼 클릭 시 5초 뒤 사라질 팝업 실행)*/ InkWell(
              key: clearButtonKey,
              child: const Row(
                children: [
                  Text('사용자에게 보이지 않을 버튼', style: TextStyle(color: Colors.white, fontSize: 1)),
                ],
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 2000), content: Text(MyMents.notReadyYet)));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> autoClick() async {
    RenderBox renderbox = clearButtonKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = renderbox.localToGlobal(Offset.zero);
    double x = position.dx;
    double y = position.dy;

    GestureBinding.instance.handlePointerEvent(PointerDownEvent(
      position: Offset(x, y),
    ));

    await Future.delayed(const Duration(milliseconds: 500));
    //add delay between up and down button

    GestureBinding.instance.handlePointerEvent(PointerUpEvent(
      position: Offset(x, y),
    )); //trigger button down
  }
}

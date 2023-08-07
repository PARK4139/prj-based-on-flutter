import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/components/helpers/super_helper.dart';
import 'screen_comunicator2.dart';

class ScreenComunicator1 extends StatefulWidget {
  const ScreenComunicator1({Key? key}) : super(key: key);

  @override
  State<ScreenComunicator1> createState() => _ScreenComunicator1State();
}

class _ScreenComunicator1State extends State<ScreenComunicator1> {
  Set<Map<String, dynamic>> dataOfScreenComunicator1 = {
    //set 으로 데이터를 처리할 필요가 있는지 모르겠다. 중복처리할때 혹시 유용할 수도...
    {
      "1": 'test',
      "2": 1,
    }
  };

  final clearButtonKey = GlobalKey();

  late Timer autoClickScheduler;
  late bool isFirstBuild;

  @override
  void initState() {
    super.initState();
    isFirstBuild = true;
  }

  @override
  void dispose() {
    autoClickScheduler.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    autoClickScheduler = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (isFirstBuild == true) {
          autoClick();
          isFirstBuild = false;
        }
        autoClickScheduler.cancel();
      },
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*버튼(버튼 클릭 시 5초 뒤 사라질 팝업 실행)*/ InkWell(
              key: clearButtonKey,
              child: const Row(
                children: [
                  Text('사용자에게 보이지 않을 버튼', style: TextStyle(color: Colors.white, fontSize: 1)),
                ],
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 2000), content: Text(MyMents.referToConsoleLog)));
              },
            ),
            Container(
              color: Colors.pinkAccent,
              child: TextButton(
                child: const Text('ScreenComunicator2', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  var dataOfScreenComunicator2 = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: RouteSettings(arguments: dataOfScreenComunicator1),
                      builder: (context) => const ScreenComunicator2(),
                    ),
                  );
                  debugSomething(dataOfScreenComunicator2);
                },
              ),
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
    ));
  }
}

import 'package:flutter/material.dart';

import '../in_operating/circle_box_maker.dart';
import '../in_operating/semi_circle_maker.dart';
import '../in_operating/striped_box_maker.dart';
import '../in_operating/threelines_box_maker.dart';

class ScreenNationalFlag extends StatefulWidget {
  const ScreenNationalFlag({super.key});

  @override
  State<ScreenNationalFlag> createState() => _ScreenNationalFlagState();
}

class _ScreenNationalFlagState extends State<ScreenNationalFlag> {
  late NATION nationMode;

  late List<dynamic> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    items = [
      /*POLAND*/
      ScreenNationalFlagModule(text: 'POLAND', item: StripedBoxMaker(colors: const [Colors.red, Colors.white], ratioX: 3, ratioY: 4, stripeCount: 2, isOppositeDirection: true)),
      /*인도네시아*/
      ScreenNationalFlagModule(text: '인도네시아', item: StripedBoxMaker(colors: const [Colors.white, Colors.red], ratioX: 3, ratioY: 4, stripeCount: 2, isOppositeDirection: true)),
      /*GERMANY*/
      ScreenNationalFlagModule(text: 'GERMANY', item: ThreelinesBoxMaker(colors: const [Colors.black, Colors.red, Colors.yellow], ratioX: 3, ratioY: 4, isOppositeDirection: true)),
      /*오스트리아*/
      ScreenNationalFlagModule(text: '오스트리아', item: ThreelinesBoxMaker(colors: const [Colors.red, Colors.white, Colors.red], ratioX: 3, ratioY: 4, isOppositeDirection: true)),
      /*ITALIA*/
      ScreenNationalFlagModule(text: 'ITALIA', item: ThreelinesBoxMaker(colors: const [Colors.green, Colors.white, Colors.red], ratioX: 3, ratioY: 4, isOppositeDirection: false)),
      /*프랑스*/
      ScreenNationalFlagModule(text: '프랑스', item: ThreelinesBoxMaker(colors: [Colors.blue.shade900, Colors.white, Colors.red], ratioX: 3, ratioY: 4, isOppositeDirection: false)),
      /*KOREA*/
      ScreenNationalFlagModule(
        text: 'KOREA',
        item: Column(
          children: [
            StripedBoxMaker(colors: const [Colors.white], ratioX: 3, ratioY: 4),
             /*태극문양*/Column(
               children: [ Transform.translate(offset: const Offset(0, -1.4), child: Transform.scale(scale: 150, child: Transform.rotate(angle: 0.3 + 0.3, child: SemiCircleMaker(diameter: 0.01, color: Colors.red)))),
                 Transform.translate(offset: const Offset(0, -1.4), child: Transform.scale(scale: 150, child: Transform.rotate(angle: 3.15 + 0.3 + 0.3, child: SemiCircleMaker(diameter: 0.01, color: Colors.blue.shade900)))),
                 Transform.translate(offset: const Offset(-0.31, -1.65), child: Transform.scale(scale: 150 / 1.9, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.red], ratioX: 0.01, ratioY: 0.01)))),
                 Transform.translate(offset: const Offset(0.31, -1.25), child: Transform.scale(scale: 150 / 1.9, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.blue.shade900], ratioX: 0.01, ratioY: 0.01)))),
               ],
             ),
             /*건곤감이*/Transform.translate(
              offset: Offset(0.16, -1.36),
              child: Transform.rotate(
                angle: -0.95,
                child: Column(
                  children: [
                    Transform.translate(offset: const Offset(0, -1.3), child: Transform.scale(scale: 15, child: StripedBoxMaker(colors: const [Colors.black], ratioX: 0.008, ratioY: 0.05))),
                    Transform.translate(offset: const Offset(0, -1.5), child: Transform.scale(scale: 15, child: StripedBoxMaker(colors: const [Colors.black], ratioX: 0.008, ratioY: 0.05))),
                    Transform.translate(offset: const Offset(0, -1.7), child: Transform.scale(scale: 15, child: StripedBoxMaker(colors: const [Colors.black], ratioX: 0.008, ratioY: 0.05))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      /*JAPAN*/
      ScreenNationalFlagModule(
        text: 'JAPAN',
        item: Column(
          children: [
            StripedBoxMaker(colors: const [Colors.white], ratioX: 3, ratioY: 4),
            Transform.translate(offset: const Offset(0, -1.4), child: Transform.scale(scale: 150, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.red], ratioX: 0.01, ratioY: 0.01)))),
          ],
        ),
      ),
      /*방글라데시*/
      ScreenNationalFlagModule(
        text: '방글라데시',
        item: Column(
          children: [
            StripedBoxMaker(colors: const [Colors.green], ratioX: 3, ratioY: 4),
            Transform.translate(offset: const Offset(-0.3, -1.4), child: Transform.scale(scale: 150, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.red], ratioX: 0.01, ratioY: 0.01)))),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
        leading:  /*뒤로가기 버튼*/ InkWell(
          child: const Icon(Icons.chevron_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.9),
      // backgroundColor: Colors.blueAccent,
      body: SafeArea(

        // top: false,
        // bottom: false,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 5, mainAxisSpacing: 10),
          children: <Widget>[
            for (var item in items) item,
          ],
        ),
      ),
    );
  }
}

enum NATION { POLAND, GERMANY, MONACO, INDONESIA, ITALIA, FRANCE, KOREA, JAPAN, USA, SWEDEN }

class ScreenNationalFlagModule extends StatefulWidget {
  late String text;

  late var item;

  ScreenNationalFlagModule({
    required this.text,
    required this.item,
  });

  @override
  State<ScreenNationalFlagModule> createState() => _ScreenNationalFlagModuleState();
}

class _ScreenNationalFlagModuleState extends State<ScreenNationalFlagModule> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Container(
            height: 33,
            width: 44,
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 5),
                  child: Transform.scale(scale: 10, child: widget.item),
                ),
              ],
            ),
          ),
          tooltip: '',
          splashColor: Colors.white,
          // hoverColor: Colors.red,
          focusColor: Colors.orange,
          color: Colors.blueAccent,
          disabledColor: Colors.purpleAccent,
        ),
        Text(widget.text, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 9, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

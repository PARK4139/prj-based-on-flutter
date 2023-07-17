import 'package:flutter/material.dart';

class ScreenAnimatedPositionAndScale extends StatelessWidget {
  const ScreenAnimatedPositionAndScale({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
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
        body: Center(
          child: ModuleVerticalAnimated(),
        ),
      ),
    );
  }
}

class ModuleVerticalAnimated extends StatefulWidget {
  const ModuleVerticalAnimated({super.key});

  @override
  State<ModuleVerticalAnimated> createState() => _ModuleVerticalAnimatedState();
}

class _ModuleVerticalAnimatedState extends State<ModuleVerticalAnimated> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: SizedBox(
        width: 350,
        height: 350,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              width: selected ? 50.50 : 50.50,
              height: selected ? 50.50 : 50.50,
              top: selected ?  0+50+50+50: 0+50+50+50+50+50+50,
              left: selected ? 0+50+50+50: 0+50+50+50,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: const ColoredBox(
                  color: Colors.blue,
                  child: Center(child: Text('위치변경\n토글',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w100),)),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

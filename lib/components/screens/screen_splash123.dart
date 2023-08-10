import 'package:flutter/material.dart';

class ScreenSplash123 extends StatefulWidget {
  const ScreenSplash123({Key? key}) : super(key: key);

  @override
  State<ScreenSplash123> createState() => _ScreenSplash123State();
}

class _ScreenSplash123State extends State<ScreenSplash123> {
  bool uiDebugMode = /*false*/ /*true*/ false;

  bool selected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
        leading: /*뒤로가기 버튼*/ InkWell(
          child: const Icon(Icons.chevron_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: uiDebugMode ? Colors.purpleAccent : Colors.black.withOpacity(0.9),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20 + 40),
            /*수직으로 움직이는 안드로이드 머리*/ SizedBox(
              height: 240,
              width: 240,
              child: AnimatedPositioned(
                width: selected ? 50.50 : 50.50,
                height: selected ? 50.50 : 50.50,
                curve: Curves.fastOutSlowIn,
                top: selected ? 150 : 300,
                left: selected ? 150 : 150,
                duration: const Duration(seconds: 2),
                child: Container(
                  height: 240,
                  width: 240,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Transform.translate(
                    offset: const Offset(0, 100 + 20),
                    child: const Icon(Icons.adb, color: Colors.lightBlueAccent, size: 200),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            const CircularProgressIndicator(color: Colors.lightBlueAccent, backgroundColor: Colors.redAccent),
            /*안드로이드 몸통*/ SizedBox(
              height: 240,
              width: 240,
              child: Transform.translate(
                offset: const Offset(0, 60),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -100 - 20),
                        child: const Icon(
                          Icons.adb,
                          color: Colors.lightBlueAccent,
                          size: 200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ScreenScrollPositionControl extends StatelessWidget {
  final GlobalKey greenKey = GlobalKey();
  final GlobalKey yellowKey = GlobalKey();
  final GlobalKey blueKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                  greenKey.currentContext!,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text('Green', style: TextStyle(color: Colors.green)),
            ),
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                  yellowKey.currentContext!,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text('Yellow', style: TextStyle(color: Colors.yellow)),
            ),  GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                  blueKey.currentContext!,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text('blue', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
              key: greenKey,
              color: Colors.green,
            ),
            Container(
              height: 600,
              key: yellowKey,
              color: Colors.yellow,
            ),
            Container(
              height: 600,
              key: blueKey,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

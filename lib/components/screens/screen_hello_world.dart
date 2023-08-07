import 'package:flutter/material.dart';

class ScreenPracticeHelloWorld extends StatelessWidget {
  const ScreenPracticeHelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: Text("Hello World", style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}

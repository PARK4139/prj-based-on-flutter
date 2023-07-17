import 'package:flutter/material.dart';

class ScreenUndefined0000 extends StatefulWidget {
  const ScreenUndefined0000({super.key});

  @override
  State<ScreenUndefined0000> createState() => _ScreenUndefined0000State();
}

class _ScreenUndefined0000State extends State<ScreenUndefined0000> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /*커스텀 앱바*/ Container(
            color: Colors.black87,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                /*뒤로가기 버튼*/InkWell(
                  child: const Icon(Icons.chevron_left,size: 40,color: Colors.redAccent),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Center(
            child: InkWell(
              child: const Column(
                children: [
                  Icon(Icons.question_mark),
                  Text("______________________________"),
                ],
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

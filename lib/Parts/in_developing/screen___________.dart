import 'package:flutter/material.dart';

class screen___________ extends StatefulWidget {
  const screen___________({super.key});

  @override
  State<screen___________> createState() => _screen___________State();
}

class _screen___________State extends State<screen___________> {
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

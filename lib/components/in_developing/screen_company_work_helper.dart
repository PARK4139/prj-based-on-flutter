import 'package:flutter/material.dart';

class ScreenCompanyWorkHelper extends StatefulWidget {
  const ScreenCompanyWorkHelper({super.key});

  @override
  State<ScreenCompanyWorkHelper> createState() => _ScreenCompanyWorkHelperState();
}

class _ScreenCompanyWorkHelperState extends State<ScreenCompanyWorkHelper> {
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

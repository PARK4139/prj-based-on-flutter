import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_worker.dart';

class ScreenPracticeMethodOperationAfter2Seconds extends StatefulWidget {
  const ScreenPracticeMethodOperationAfter2Seconds({super.key});

  @override
  State<ScreenPracticeMethodOperationAfter2Seconds> createState() => _ScreenPracticeMethodOperationAfter2SecondsState();
}

class _ScreenPracticeMethodOperationAfter2SecondsState extends State<ScreenPracticeMethodOperationAfter2Seconds> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Row(
            children: [
              Icon(Icons.question_mark),
              Text("버튼을 클릭하면 2초 뒤에 연결된 함수를 실행하는 버튼"),
            ],
          ),
          onTap: () {
            /*미래에 실행할 코드*/
            Future.delayed(const Duration(milliseconds: 2000), () {
              /*1000 milliseconds 후 실행할 코드*/printWithoutErrorOrPrintWithError("foo");
            });
          },
        ),
      ),
    );
  }
}

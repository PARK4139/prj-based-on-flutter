import 'package:flutter/material.dart';

class SampleMethodOperationAfterSeconds extends StatefulWidget {
  const SampleMethodOperationAfterSeconds({super.key});

  @override
  State<SampleMethodOperationAfterSeconds> createState() => _SampleMethodOperationAfterSecondsState();
}

class _SampleMethodOperationAfterSecondsState extends State<SampleMethodOperationAfterSeconds> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Row(
            children: [
              Icon(Icons.question_mark),
              Text("버튼을 클릭하면 1초 뒤에 연결된 함수를 실행하는 버튼"),
            ],
          ),
          onTap: () {
            /*미래에 실행할 코드*/
            Future.delayed(const Duration(milliseconds: 1000), () {
              /*1000 milliseconds 후 실행할 코드*/print("foo");
            });
          },
        ),
      ),
    );
  }
}

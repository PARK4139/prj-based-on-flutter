import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/components/helpers/super_helper.dart';

class ScreenRandomNumberSub extends StatefulWidget {
  const ScreenRandomNumberSub({super.key});

  @override
  State<ScreenRandomNumberSub> createState() => _ScreenRandomNumberSubState();
}

class _ScreenRandomNumberSubState extends State<ScreenRandomNumberSub> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 64,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /* 앱바*/ Container(
                color: Colors.black87,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /*뒤로가기 버튼*/ InkWell(
                      child: const Icon(Icons.chevron_left, size: 40, color: Colors.redAccent),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              /*숫자컨테이너*/ SizedBox(
                height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: '${sliderValue.toInt()}'
                      .toString()
                      .split("")
                      .map((e) => Image.asset(
                            'asset/images/random_numbers/$e.png',
                            width: 30,
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 50),
              /*입력슬라이더*/ SizedBox(
                height: 30,
                width: 300,
                child: Slider(
                  value: sliderValue,
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  max: 10000000,
                  min: 0,
                ),
              ),
              /*버튼*/ ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.red,
                  shadowColor: Colors.red,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text(MyMents.notReadyYet)));

                  /*위젯트리에 상태로 값이 저장이 되도록 추후에 수행*/
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 1000), content: Text('저장 버튼이 눌렸습니다.')));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text(MyMents.notReadyYet)));
                },
                child: const Text('저장', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

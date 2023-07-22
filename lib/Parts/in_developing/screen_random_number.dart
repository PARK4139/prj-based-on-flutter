import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_developing/screen_random_number_sub.dart';

class ScreenRandomNumber extends StatefulWidget {
  const ScreenRandomNumber({super.key});

  @override
  State<ScreenRandomNumber> createState() => _ScreenRandomNumberState();
}

class _ScreenRandomNumberState extends State<ScreenRandomNumber> {
  late List<Image> listThatHave3ints;

  late int choosenRandomNumber;

  late List<int> choosenRandomNumbers;

  late int digitsLimit;

  @override
  void initState() {
    super.initState();

    _setRandomNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const _HeadSection(),
          _MainSection(choosenRandomNumbers: choosenRandomNumbers, onTap: onTap),
        ],
      ),
    );
  }

  void onTap() {
    setState(() {
      _setRandomNumbers();
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 1000), content: Text('랜덤숫자가 생성되었습니다.')));
  }

  void _setRandomNumbers() {
    choosenRandomNumber = 0;
    choosenRandomNumbers = [0, 0, 0];
    digitsLimit = 3; //자리 수 기준 설정
    for (int i = 0; i <= 2; i++) {
      // debugDynamic(choosenRandomNumbers[i]);
      while (choosenRandomNumbers[i].toString().length != digitsLimit) {
        choosenRandomNumbers[i] = Random().nextInt(10000); // choosenRandomNumber를  choosenRandomNumbers에 수집
      }
      // debugDynamic(choosenRandomNumbers);
    }
    debugSomething(choosenRandomNumbers);
  }
}


/*Head Section 과 Main section 으로 코드정리*/
//Head Section 과 Main section 로 코드정리를 수행해 보았는데 이게 가독성이 좋은 건지는 잘 모르겠으나..일단 정리방법은 연습이 되었다..
class _HeadSection extends StatelessWidget {
  const _HeadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return /*커스텀 앱바*/ Container(
      color: Colors.black,
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
    );
  }
}

class _MainSection extends StatelessWidget {
  List<int> choosenRandomNumbers;
  final VoidCallback onTap;

  _MainSection({required this.onTap, required this.choosenRandomNumbers});

  @override
  Widget build(BuildContext context) {
    return /*메인컨테이너*/ Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*랜덤숫자 생성기*/ const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text("랜덤숫자 생성기", style: TextStyle(color: Colors.white, fontSize: 19 * 2, fontWeight: FontWeight.w500)),
              ),
              /*설정버튼*/ Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  child: const Icon(Icons.settings, size: 20, color: Colors.red),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 1000), content: Text('setting icon 이 눌렸습니다.')));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenRandomNumberSub()));
                  },
                ),
              ),
            ],
          ),
          /*숫자컨테이너*/ SizedBox(
            height: 550,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Container(
                  height: 300,
                  width: (MediaQuery.of(context).size.width - 30) / 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Builder(builder: (context) {
                    return Column(
                      children: [
                        for (int i = 0; i <= 2; i++)

                          SizedBox(
                            // height: 80,
                            child: Row(
                              children: choosenRandomNumbers[i].toString().split("").map((e) => Image.asset('asset/images/random_numbers/$e.png', height: 80)).toList(),
                            ),
                          ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          /*생성하기버튼*/ InkWell(
            onTap: onTap,
            child: /*빈버튼*/ Container(
              height: 30,
              width: MediaQuery.of(context).size.width - 19,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(textAlign: TextAlign.center, '생성하기', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


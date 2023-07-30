import 'package:flutter/material.dart';

import '../helpers/super_helper.dart';

class ScreenCalculatorBiologicalAge extends StatefulWidget {
  const ScreenCalculatorBiologicalAge({super.key});

  @override
  State<ScreenCalculatorBiologicalAge> createState() => _ScreenCalculatorBiologicalAgeState();
}

class _ScreenCalculatorBiologicalAgeState extends State<ScreenCalculatorBiologicalAge> {
  TextEditingController birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    birthDateController.text = '';
  }

  @override
  void dispose() {
    birthDateController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime birthDate = DateTime(1994, 04, 05);

    return Scaffold(
      body: ListView(
        children: [
          //__________________________________________________________________________________________________________________________ tmp s
          /*임시메인컨테이너*/ Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        controller: birthDateController,
                        keyboardType: TextInputType.datetime,
                      ),
                      /*버튼*/ TextButton(
                        onPressed: () {
                          DateTime birthDate = DateTime.parse(birthDateController.text);
                          DateTime today = DateTime.now();
                          int age = today.year - birthDate.year;
                          if (today.month < birthDate.month) {
                            age--;
                          } else if (today.month == birthDate.month && today.day < birthDate.day) {
                            age--;
                          }

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text('복사되었습니다.\n$age')));
                        },
                        child: const Text('다이얼로그', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              )),

          //__________________________________________________________________________________________________________________________ tmp e
        ],
      ),
    );
  }

  int biologicalAgeMaker({required DateTime birthDate}) {
    /*사용자의 생년월일과 현재 날짜를 비교하여 만 나이를 계산합니다.*/
    DateTime specificDay = birthDate;
    DateTime now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int diffDays = (now.difference(specificDay).inDays.toInt() / 365) as int;
    int biologicalAge = diffDays;

    // 만 나이를 출력합니다.
    return biologicalAge;
  }
}

class _SnackBarTestButton extends StatefulWidget {
  @override
  State<_SnackBarTestButton> createState() => _SnackBarTestButtonState();

  const _SnackBarTestButton();
}

class _SnackBarTestButtonState extends State<_SnackBarTestButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.hello));
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.occuredError));
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.inLoading()));
        },
        child: const Text('스낵바'),
      ),
    );
  }
}

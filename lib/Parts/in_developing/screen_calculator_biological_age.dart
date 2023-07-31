import 'package:flutter/material.dart';

class ScreenCalculatorBiologicalAge extends StatefulWidget {
  const ScreenCalculatorBiologicalAge({super.key});

  @override
  State<ScreenCalculatorBiologicalAge> createState() => _ScreenCalculatorBiologicalAgeState();
}

class _ScreenCalculatorBiologicalAgeState extends State<ScreenCalculatorBiologicalAge> {
  TextEditingController birthDateController = TextEditingController();

  List<String> calculationHistories = [];

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
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            /* 메인컨테이너*/
            Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /*빈공간*//*일종의 SizedBox 같은 대체품.*/
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            onChanged: (value) {
                              DateTime birthDate = DateTime.parse(birthDateController.text);
                              DateTime today = DateTime.now();
                              int age = today.year - birthDate.year;
                              if (today.month < birthDate.month) {
                                age--;
                              } else if (today.month == birthDate.month && today.day < birthDate.day) {
                                age--;
                              }
                              // debugSomething(value);
                              // debugSomething(age);
                              calculationHistories.add("$value                                         $age 세");
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text('당신의 생물학적 나이는 \n$age 세 입니다')));
                              setState(() {});
                            },
                            controller: birthDateController,
                            keyboardType: TextInputType.datetime,
                            cursorColor: Colors.amberAccent,
                            style: const TextStyle(color: Colors.amberAccent),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white12,
                              hintText: '1994-04-05',
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: "yyyy-MM-dd",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all((Radius.circular(10))),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all((Radius.circular(10))),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all((Radius.circular(10))),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                              bottomLeft: Radius.circular(4.0),
                              bottomRight: Radius.circular(4.0),
                            ),
                          ),
                          color: Colors.white12,
                          // color: _Colors.white,//DEBUG CODE
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // Column() 에 crossAxisAlignment: CrossAxisAlignment.stretch, 코드를 사용하면 child 위젯들의 모습이 ListView() 와 유사한 느낌이 든다.
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                child: const Text(
                                  "기록",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Column(
                                children: [...calculationHistories.map((e) => Text(e, style: const TextStyle(color: Colors.white))).toList()],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),

            //__________________________________________________________________________________________________________________________ tmp e
          ],
        ),
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

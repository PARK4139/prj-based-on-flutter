import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/super_helper.dart';




class ScreenByNextDrontalSupplyDate extends StatefulWidget {
  const ScreenByNextDrontalSupplyDate({super.key});

  @override
  State<ScreenByNextDrontalSupplyDate> createState() => _ScreenByNextDrontalSupplyDateState();
}

class _ScreenByNextDrontalSupplyDateState extends State<ScreenByNextDrontalSupplyDate> {
  late final int leftDaysFromNowToNextFeedingDate;
  late final DateTime selectedDate;

  late final DateTime futureFeedingPromisedDate;

  late final DateTime now;

  late DateTime feedingStartingDate;

  late List<DateTime> futureFeedingPromisedDates;

  @override
  void initState() {
    super.initState();

    now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    /*급여시작기준일*/
    feedingStartingDate = DateTime(2023, 07, 19);

    /*매3개월마다 드론탈 구충제 하늘이 먹여야 한다.*/
    /*미래에 급여할 날짜 10개까지 출력*/
    futureFeedingPromisedDates = [
      for (int i = 1; i <= 10; i++) DateTime(feedingStartingDate.year, feedingStartingDate.month + i * 3, feedingStartingDate.day),
    ];
    debugSomething(   futureFeedingPromisedDates);

    /*미래에 급여할 날짜 10개 중 가장 근래에 급여할 날짜*/
    futureFeedingPromisedDate = futureFeedingPromisedDates[0];
    printWithoutWarning("________________________________________________$futureFeedingPromisedDate");


    leftDaysFromNowToNextFeedingDate = now.difference(futureFeedingPromisedDate).inDays;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              /*앱바*/ Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /*뒤로가기 버튼*/ InkWell(
                    child: const Icon(Icons.chevron_left, size: 40, color: Colors.white),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              /*메인컨테이너*/ Expanded(
                child: Center(
                  child: SizedBox(
                    child: Text(
                      "D$leftDaysFromNowToNextFeedingDate",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

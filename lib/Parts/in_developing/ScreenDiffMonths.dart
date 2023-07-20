import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenDiffMonths extends StatefulWidget {
  DateTime startingDateTime;

  DateTime endingDateTime;

  ScreenDiffMonths({super.key, required this.startingDateTime, required this.endingDateTime});

  @override
  State<ScreenDiffMonths> createState() => _ScreenDiffMonthsState();
}

class _ScreenDiffMonthsState extends State<ScreenDiffMonths> {
  late final double diffMonthsFromStartingDateToNow;
  late final DateTime selectedDate;

  late final DateTime workingEndDate;

  late DateTime workingStartingDate;

  late List<DateTime> futureFeedingPromisedDates;

  @override
  void initState() {
    super.initState();

    workingEndDate = widget.endingDateTime;
    /*급여시작기준일*/
    workingStartingDate = widget.startingDateTime;

    /*매3개월마다 드론탈 구충제 하늘이 먹여야 한다.*/
    /*미래에 급여할 날짜 10개까지 출력*/

    diffMonthsFromStartingDateToNow = workingEndDate.difference(workingStartingDate).inDays / 30; //월을 약 30 으로 가정한건대 정확하지 않음.
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
                      "$diffMonthsFromStartingDateToNow 개월",
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

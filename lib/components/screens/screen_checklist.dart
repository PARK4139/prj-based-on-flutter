import 'package:flutter/material.dart';

import '../../utils/groupware_work_end_time_record_helper.dart';
import '../../utils/groupware_work_strat_time_record_helper.dart';
import '../../utils/hardcoding_stamp_maker.dart';
import '../../utils/planed_schedule_management_helper.dart';
import '../../utils/super_helper.dart';


class ScreenPlanExcuter extends StatefulWidget {
  const ScreenPlanExcuter({Key? key}) : super(key: key);

  @override
  State<ScreenPlanExcuter> createState() => _ScreenPlanExcuterState();
}

class _ScreenPlanExcuterState extends State<ScreenPlanExcuter> {
  final ment = '해당 스크린에서는 반드시 확인하고 싶은 개인의 반복적인 일정을 작성해 두고 check를 함으로서 계획을 관리하는 습관을 기르도록 돕는 서비스를 제공합니다 \n\n'
      '＊"" :.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            /*뒤로가기*/ ElevatedButton(
              child: Text('뒤로가기'.toUpperCase()),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            /*안드로이드 멘트*/ Column(
              children: <Widget>[
                const Icon(Icons.android, color: Colors.lightBlueAccent),
                Text(ment, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 10),
            PlanedScheduleManagementHelper(title: "나의 운동 계획스케쥴", items:   [
              HardCodingStampMaker(txt: '팔 약간 벌려 높이뛰기//위에서 볼때 w 가 되도록'),
              HardCodingStampMaker(txt: '박스 스쿼트 9회 1set//박기량이 하던 운동'),
              HardCodingStampMaker(txt: '데드리프트 9회 1set'),
              HardCodingStampMaker(txt: '벤치프레스 9회 1set'),
              HardCodingStampMaker(txt: '팔굽혀펴기 9회 1set'),
              HardCodingStampMaker(txt: '런지 9회 1set'),
              HardCodingStampMaker(txt: '철봉 9회 1set'), //9회 10set 가 되면 어느정도 몸이 될지 궁금하다.
              HardCodingStampMaker(txt: '푸쉬 업  9회 1set'), // 기회가 되면 2회/7일 정도는 필라테스 다니기
            ]),
            PlanedScheduleManagementHelper(title: "나의 운동 랜덤스케쥴", items:   [
              HardCodingStampMaker(txt: '팔 약간 벌려 높이뛰기//위에서 볼때 w 가 되도록'),
              HardCodingStampMaker(txt: '박스 스쿼트 9회 1set//박기량이 하던 운동'),
              HardCodingStampMaker(txt: '데드리프트 9회 1set'),
              HardCodingStampMaker(txt: '벤치프레스 9회 1set'),
              HardCodingStampMaker(txt: '팔굽혀펴기 9회 1set'),
              HardCodingStampMaker(txt: '런지 9회 1set'),
              HardCodingStampMaker(txt: '철봉 9회 1set'),
              HardCodingStampMaker(txt: '푸쉬 업  9회 1set'), // 기회가 되면 2회/7일 정도는 필라테스 다니기
            ]),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

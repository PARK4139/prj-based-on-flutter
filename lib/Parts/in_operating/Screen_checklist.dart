import 'package:flutter/material.dart';

import 'button_to_login_bizmeka.dart';
import 'button_to_record_work_end_time.dart';
import 'button_to_record_work_strat_time.dart';
import 'button_to_submit_daily_report_at_bizmeka.dart';
import 'my_functions.dart';

class Screen_plan_excuter extends StatefulWidget {
  const Screen_plan_excuter({Key? key}) : super(key: key);

  @override
  State<Screen_plan_excuter> createState() => _Screen_plan_excuterState();
}

class _Screen_plan_excuterState extends State<Screen_plan_excuter> {
  final ment = '해당 스크린에서는 반드시 확인하고 싶은 개인의 반복적인 일정을 작성해 두고 check를 함으로서 계획을 관리하는 습관을 기르도록 돕는 서비스를 제공합니다 \n\n'
      '＊"" :.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            /*뒤로가기*/ ElevatedButton(
              child: Text('go to index'.toUpperCase()),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            /*안드로이드 멘트*/ Container(
              child: Column(
                children: <Widget>[
                  const Icon(Icons.android, color: Colors.lightBlueAccent),
                  Text("${ment}", style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Button_to_login_bizmeka(text: '비즈메카 로그인', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_record_work_strat_time(text: '비즈메카 출근보고', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            // Button_to_save_button_name_into_clipboard(text: 'ㆍ' + request_school_name + ' ' + requester_name + '\n' + request_year + ' ' + request_code + ' ' + std_no + ' ' + std_name + ' ' + request_context + '\n-->요청대로 처리[완료]', background_color:  MyColors.darkBlack2, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_submit_daily_report_at_bizmeka(text: '비즈메카 일일업무보고', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_record_work_end_time(text: '비즈메카 퇴근보고', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

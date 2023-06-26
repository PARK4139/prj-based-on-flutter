import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'Button_to_login_bizmeka.dart';
import 'Button_to_move_button_name_into_clipboard.dart';
import 'Button_to_record_work_end_time.dart';
import 'Button_to_record_work_strat_time.dart';
import 'Button_to_submit_daily_report_at_bizmeka.dart';

import 'My_functions.dart';
import 'Rainbow_text.dart';

class Screen_checklist extends StatefulWidget {
  const Screen_checklist({Key? key}) : super(key: key);

  @override
  State<Screen_checklist> createState() => _Screen_checklistState();
}

class _Screen_checklistState extends State<Screen_checklist> {
  final ment = '해당 스크린에서는 checklist들을 제공해주는 서비스를 제공합니다 \n\n'
      '＊"" :.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            ElevatedButton(
              child: Text(
                'go to index'.toUpperCase(),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              child: Column(
                children: <Widget>[
                  const Icon(Icons.android, color: Colors.lightBlueAccent),
                  Text(
                    "$ment",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.9),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: Rainbow_text(text: "CHECK LIST", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 8, font_weight: FontWeight.w200, isRainbowMode: true)),
            Button_to_login_bizmeka(text: '비즈메카 로그인', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_record_work_strat_time(text: '비즈메카 출근보고', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            // Button_to_save_button_name_into_clipboard(text: 'ㆍ' + request_school_name + ' ' + requester_name + '\n' + request_year + ' ' + request_code + ' ' + std_no + ' ' + std_name + ' ' + request_context + '\n-->요청대로 처리[완료]', background_color:  MyColors.darkBlack2, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            // Button_to_access_to_kul_admin_page_via_chrome(text: 'KUL 로그인', background_color:  MyColors.darkBlack2, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            //Button_to_access_to_kul_home_page_via_chrome(text: 'KUL 로그인', background_color:  MyColors.darkBlack2, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            //Button_to_access_to_kul_home_page_via_eclipse(text: 'KUL 로그인', background_color:  MyColors.darkBlack2, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            //Button_to_access_to_kul_home_page_via_OP_web_server(text: 'KUL 로그인', background_color:  MyColors.darkBlack2, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            //Button_to_access_to_kul_home_page_via_OP_DB_server(text: 'KUL 로그인', background_color:  MyColors.darkBlack2, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_submit_daily_report_at_bizmeka(text: '비즈메카 일일업무보고', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_record_work_end_time(text: '비즈메카 퇴근보고', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

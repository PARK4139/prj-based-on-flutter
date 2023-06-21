import 'package:flutter/material.dart';


import '../inDeveloping/Buttons.dart';
import 'Button_to_move_button_name_into_clipboard.dart';

import 'Buttons_for_kakaotalk.dart';
import 'MyFunctions.dart';
import 'Rainbow_text_maker.dart';

class Screen_db_maintennace extends StatefulWidget {
  const Screen_db_maintennace({Key? key}) : super(key: key);

  @override
  State<Screen_db_maintennace> createState() => _Screen_db_maintennaceState();
}

class _Screen_db_maintennaceState extends State<Screen_db_maintennace> {
  final ment = '해당 스크린에서는 DB 유지보수를 위한 텍스트를 제공해주는 서비스를 제공합니다 \n\n'
      '＊"" : .';

  late String requester_date;
  late String requester_summary;
  late String requester_ment;
  late String request_school_name;
  late String dgist_dorms_type;
  late String requester_name;
  late String request_year;
  late String request_code;
  late String std_no;
  late String std_name;
  late String request_context;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requester_summary = '{{요청요약}}';
    requester_date = '{{작업수행일자}}';
    requester_ment = '{{요청자멘트}}';
    request_school_name = '{{요청학교명}}';
    requester_name = '{{요청자명}}';
    request_year = '{{모집년도}}';
    request_code = '{{모집구분}}';
    std_no = '{{학번}}';
    std_name = '{{학생이름}}';
    request_context = '{{요청내용}}';
    dgist_dorms_type = '{{대구과기대기숙사타입}}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Center(
              child: Container(
                color: Colors.black38,
                child: TextButton(
                  clipBehavior: Clip.hardEdge,
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(100, 50)),
                    maximumSize: MaterialStateProperty.all(Size(100, 50)),
                  ),
                  child: Text(
                    'go to index'.toUpperCase(),
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Icon(Icons.android, color: Colors.lightBlueAccent),
            Center(
              child: Text(
                "$ment",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.9),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            TextFormField(
              controller: null,
              initialValue: '',
              decoration: InputDecoration(
                labelText: requester_ment,
                fillColor: Colors.red,
                focusColor: Colors.orange,
                hoverColor: Colors.yellow,
                iconColor: Colors.green,
                prefixIconColor: Colors.blue,
                suffixIconColor: Colors.purple,
                hintText: 'ex )  안녕하세요.yyyy년 999999 박정훈 학생 퇴관복구 부탁드립니다.',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '입력되지 않았네요.다시 작성해주세요.';
                }
                return null;
              },
              onChanged: (text) {
                setState(() {
                  print("_____________________"); //DEV
                  print("OLD: ${requester_summary}"); //DEVELOPMENT
                  requester_summary = requester_ment + '' + request_school_name + '' + requester_name + '' + request_year + '' + request_code + '' + std_no + '' + std_name + '' + request_context + '';
                  print("NEW: ${requester_summary}"); //DEVELOPMENT
                });
              },
// onFieldSubmitted: (value) {setState(() {}); },
            ),
            Button_for_data_maintennace(text: requester_ment,
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),
            Button_for_data_maintennace(text: requester_ment,
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),
            Button_for_data_maintennace(text: request_school_name,
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),
            Button_for_data_maintennace(text: requester_name,
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),
            Button_for_data_maintennace(text: request_year,
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),
            Button_for_data_maintennace(text: request_code,
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),
            Button_for_data_maintennace(text: std_no,
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),
            Button_for_data_maintennace(text: std_name,
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),
            Button_for_data_maintennace(text: request_context,
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),
            Button_for_data_maintennace(text: '________________',
                background_color: MyColors.black_background,
                color: Colors.white38,
                font_size: 10,
                font_weight: FontWeight.w200,
                padding_vertical: 4,
                padding_horizontal: 4,
                border_radius: BorderRadius.circular(5)),


            SizedBox(
              height: 10,
            ),
            Buttons_for_kakaotalk(text: "카톡 업무 시작/중간/종료/특이사항 보고 스탬프", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            SizedBox(height: 100),
            Center(child: Rainbow_text_maker(text: "영속성 스탬프", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: '*****', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: 'administrator', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '**********', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '202114063', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '*****!itc', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '*****!dgi', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '*****!gon', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '*****!jan', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '*****sion', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            SizedBox(height: 10),
            Center(child: Rainbow_text_maker(text: "itc op access", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Center(child: Rainbow_text_maker(text: "//78", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: '*****', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '*****!edorm', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "//MACSClient", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: '*****sion', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '**********', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "//146", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: 'administrator', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: '**********', background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            SizedBox(height: 10),
            Center(child: Rainbow_text_maker(text: "DB query", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "--begin tran\n--rollback\n--commit", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "code_tb", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "SELECT code_fcd, code_nm FROM  code_tb WHERE use_yn = 'Y' AND code_fcd LIKE ('2706000%')", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "EDU_SCHEDULE_TB", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "SELECT * FROM EDU_SCHEDULE_TB est  WHERE recruit_year='2023' AND RECRUIT_CODE ='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "apply_term_tb", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "SELECT * FROM apply_term_tb WHERE recruit_year='2023' AND RECRUIT_CODE ='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "ROOM_INFO_TB", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "SELECT * FROM ROOM_INFO_TB  WHERE recruit_year='2023' AND ROOM_NO ='1264' AND room_kind=''", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "member_tb", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "SELECT * FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT std_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "DORM_APPLY_TB", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "SELECT id_no FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT status FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT dorm_exp_reserve FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT virtual_account FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT room_no FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT move_in_date FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT move_out_date FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT del_yn FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "SELECT * FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(
                text: "SELECT id_no,status,dorm_exp_reserve,virtual_account,room_no,move_in_date,move_out_date,del_yn,apply_method FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb\nWHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "_________________TB", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "_________________TB", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Center(child: Rainbow_text_maker(text: "_________________TB", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            SizedBox(height: 10),
            Center(child: Rainbow_text_maker(text: "ITC PRODUCTION 서버에서 테스트할 계정 선정(로그인이력이 없는 사람이 적합,외국인이 적합)", color: Colors.blueAccent /*Colors.grey.withOpacity(0.9)*/, font_size: 16, font_weight: FontWeight.w200, isRainbowMode: false)),
            Button_to_move_button_name_into_clipboard(text: "SELECT id_no FROM DORM_APPLY_TB\nWHERE ID_NO in(\nSELECT ID_NO FROM member_tb WHERE ACL_CD2='1903001' and id_no in (SELECT id_no FROM LOGIN_LOG)\n) AND recruit_year='2023' AND recruit_code='2601000'", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            Button_to_move_button_name_into_clipboard(text: "_________________", background_color: MyColors.black_background, color: Colors.white38, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

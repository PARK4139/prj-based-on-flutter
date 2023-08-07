import 'package:flutter/material.dart';



class ScreenToMaintainDorm extends StatefulWidget {
  const ScreenToMaintainDorm({Key? key}) : super(key: key);

  @override
  State<ScreenToMaintainDorm> createState() => _ScreenToMaintainDormState();
}

class _ScreenToMaintainDormState extends State<ScreenToMaintainDorm> {
  final ment = '해당 스크린에서는 기숙사 시스템 유지보수를 위한 기능을 제공해주는 서비스를 제공합니다 \n\n'
      '＊"" : .';



  @override
  void initState() {
    super.initState();
    initButtonTexts();
    initRequestContents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      // body: Container(
      //   child: ListView(
      //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //     children: [
      //       Center(
      //         child: Container(
      //           color: Colors.black38,
      //           child: TextButton(
      //             child: Text('뒤로가기'.toUpperCase(), style: TextStyle(color: Colors.blueAccent)),
      //             clipBehavior: Clip.hardEdge,
      //             style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(100, 50)), maximumSize: MaterialStateProperty.all(Size(100, 50))),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //         ),
      //       ),
      //       Icon(Icons.android, color: Colors.lightBlueAccent),
      //       Center(child: Text("$ment", style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600))),
      //       const SizedBox(height: 40),
      //       TextFormField(
      //         controller: null,
      //         initialValue: '',
      //         decoration: InputDecoration(labelText: requester_ment, hintText: 'ex )  안녕하세요.yyyy년 999999 박정훈 학생 퇴관복구 부탁드립니다.', fillColor: Colors.red, focusColor: Colors.orange, hoverColor: Colors.yellow, iconColor: Colors.green, prefixIconColor: Colors.blue, suffixIconColor: Colors.purple),
      //         validator: (value) {
      //           if (value!.isEmpty) {
      //             return '입력되지 않았네요.다시 작성해주세요.';
      //           }
      //           return null;
      //         },
      //         onChanged: (text) {
      //           setState(() {
      //             print("_____________________"); //DEV
      //             print("OLD: ${requester_summary}"); //DEVELOPMENT
      //             requester_summary = requester_ment + '' + request_school_name + '' + requester_name + '' + request_year + '' + request_code + '' + std_no + '' + std_name + '' + request_context + '';
      //             print("NEW: ${requester_summary}"); //DEVELOPMENT
      //           });
      //         },
      //       ),
      //       DataMaintennaceHelper(text: requester_ment, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       DataMaintennaceHelper(text: requester_ment, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       DataMaintennaceHelper(text: request_school_name, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       DataMaintennaceHelper(text: requester_name, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       DataMaintennaceHelper(text: request_year, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       DataMaintennaceHelper(text: request_code, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       DataMaintennaceHelper(text: std_no, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       DataMaintennaceHelper(text: std_name, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       DataMaintennaceHelper(text: request_context, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       DataMaintennaceHelper(text: '________________', backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       const SizedBox(height: 10),
      //       WithvedormMaintainanceHelper(texts: texts_asterisk, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       WithvedormMaintainanceHelper(texts: texts_op_access, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       const SizedBox(height: 10),
      //       WithvedormMaintainanceHelper(texts: texts_CODE_TB, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       WithvedormMaintainanceHelper(texts: texts_MEMBER_TB, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       WithvedormMaintainanceHelper(texts: texts_DORM_APPLY_TB, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       WithvedormMaintainanceHelper(texts: texts_ROOM_INFO_TB, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       WithvedormMaintainanceHelper(texts: texts_APPLY_TERM_TB, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       WithvedormMaintainanceHelper(texts: texts_EDU_SCHEDULE_TB, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5)),
      //       const SizedBox(height: 10),
      //       WithvedormMaintainanceHelper(texts: texts_dummy_account_preparation, backgroundColor: MyColors.blackBackground, color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w200, paddingVertical: 4, paddingHorizontal: 4, borderRadius: BorderRadius.circular(5))
      //     ],
      //   ),
      // ),
    );
  }

  void initButtonTexts() {
    // texts_CODE_TB = [
    //   "CODE_TB",
    //   "SELECT * FROM  code_tb WHERE use_yn = 'Y' AND CODE_NM LIKE '%언교%'",
    //   "SELECT code_fcd, code_nm FROM  code_tb WHERE use_yn = 'Y' AND code_fcd LIKE ('2706000%')",
    // ];
    // texts_asterisk = [
    //   "ASTERISK",
    //   '*****',
    //   'administrator',
    //   '**********',
    //   '202114063',
    //   '*****!itc',
    //   '*****!dgi',
    //   '*****!gon',
    //   '*****!jan',
    //   '*****sion',
    // ];
    // texts_op_access = [
    //   "OP ACCESS",
    //   "//78",
    //   '*****',
    //   '*****!dorm',
    //   "//MACSClient",
    //   '*****sion',
    //   '**********',
    //   "//146",
    //   'administrator',
    //   '**********',
    // ];
    // texts_EDU_SCHEDULE_TB = [
    //   "EDU_SCHEDULE_TB",
    //   "SELECT * FROM EDU_SCHEDULE_TB est  WHERE recruit_year='2023' AND RECRUIT_CODE ='2601000'",
    //   "--begin tran\n--rollback\n--commit",
    // ];
    //
    // texts_APPLY_TERM_TB = [
    //   "APPLY_TERM_TB",
    //   "SELECT * FROM apply_term_tb WHERE recruit_year='2023' AND RECRUIT_CODE ='2601000'",
    //   "--begin tran\n--rollback\n--commit",
    // ];
    // texts_ROOM_INFO_TB = [
    //   "room_info_tb",
    //   "SELECT * FROM ROOM_INFO_TB  WHERE recruit_year='2023' AND ROOM_NO ='1264' AND room_kind=''",
    //   "--begin tran\n--rollback\n--commit",
    // ];
    // texts_dummy_account_preparation = [
    //   "ITC PRODUCTION 서버에서 테스트할 계정 선정(로그인이력이 없는 사람이 적합,외국인이 적합)",
    //   "SELECT id_no FROM DORM_APPLY_TB\nWHERE ID_NO in(\nSELECT ID_NO FROM member_tb WHERE ACL_CD2='1903001' and id_no in (SELECT id_no FROM LOGIN_LOG)\n) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "--begin tran\n--rollback\n--commit",
    // ];
    // texts_DORM_APPLY_TB = [
    //   "DORM_APPLY_TB",
    //   "SELECT id_no FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "SELECT status FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "SELECT dorm_exp_reserve FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "SELECT virtual_account FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "SELECT room_no FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "SELECT move_in_date FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "SELECT move_out_date FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "SELECT del_yn FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "SELECT * FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "SELECT id_no,status,dorm_exp_reserve,virtual_account,room_no,move_in_date,move_out_date,del_yn,apply_method FROM DORM_APPLY_TB WHERE ID_NO in(SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')) AND recruit_year='2023' AND recruit_code='2601000'",
    //   "--begin tran\n--rollback\n--commit",
    // ];
    // texts_MEMBER_TB = [
    //   "MEMBER_TB",
    //   "SELECT * FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')",
    //   "SELECT ID_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')",
    //   "SELECT std_NO FROM member_tb WHERE std_NO in('2023094') AND USER_NM IN ('_박_정_훈_94_')",
    //   "--begin tran\n--rollback\n--commit",
    // ];
    // texts_ _________ =[
    //
    // ];
  }

  void initRequestContents() {
    // requester_summary = '{{요청요약}}';
    // requester_date = '{{작업수행일자}}';
    // requester_ment = '{{요청자멘트}}';
    // request_school_name = '{{요청학교명}}';
    // requester_name = '{{요청자명}}';
    // request_year = '{{모집년도}}';
    // request_code = '{{모집구분}}';
    // std_no = '{{학번}}';
    // std_name = '{{학생이름}}';
    // request_context = '{{요청내용}}';
    // dgist_dorms_type = '{{대구과기대기숙사타입}}';
  }
}

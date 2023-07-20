import 'package:date_format/date_format.dart';


class CommonTextData {
  static const String code0000 = "CODE_COMMON";
  static const String code1000 = "CODE_BIZMEKA";
  final Map<String, dynamic> stamps = {
    "0000": 'CODE_COMMON',
    "0001": '',
    "0100": "CODE_TIME_DATE",
    "0101": formatDate(DateTime.now(), [yyyy, '', mm, '', dd]),
    "0102": formatDate(DateTime.now(), [yyyy, ' ', mm, ' ', dd, ' ', HH, ' ', nn, ' ', ss, ' ', SSS]),
    "0103": formatDate(DateTime.now(), [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss, '', SSS]),
    "0105": formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss, '.', SSS]),
    "0104": formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]),
    "1000": 'CODE_BIZMEKA',
    "1001": '비즈메카 일일업무보고로 이동',
    "1002": "https://ezgroupware.bizmeka.com/groupware/todo/listMenuStoredTaskView.do?folderId=1263453&folderName=&#37;EC&#37;9D&#37;BC&#37;EC&#37;9D&#37;BC&#37;EC&#37;97&#37;85&#37;EB&#37;AC&#37;B4&#37;EB&#37;B3&#37;B4&#37;EA&#37;B3&#37;A0&#37;EC&#37;84&#37;9C_&#37;EC&#37;86&#37;94&#37;EB&#37;A3&#37;A8&#37;EC&#37;85&#37;98&#37;ED&#37;8C&#37;80",
    "1003": "pjh*****",
    "1004": "s2*******s2@",
    "2000": "CODE_KUL",
    "3000": "CODE_DGI",
    "4000": "CODE_SG",
    "5000": "CODE_GON",
    "6000": "CODE_ITC",
    "7000": "CODE_ID",
    "8000": "CODE_PW",
    "X000": "CODE_Y",
    "00000": "CODE_ETC",
    "시작": "시작",
    "종료": '종료',
  };

  Map<String, dynamic> getStamps() {
    return stamps;
  }
}

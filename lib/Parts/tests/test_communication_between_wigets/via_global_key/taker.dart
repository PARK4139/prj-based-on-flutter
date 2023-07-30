// import 'package:flutter/material.dart';
//
// class Taker extends StatefulWidget {
//   const Taker({super.key});
//
//   @override
//   _TakerState createState() => _TakerState();
// }
//
// class _TakerState extends State<Taker> {
// final GlobalKey<_GiverState> _key = GlobalKey();  //다른 파일로 부터 가져오지 못한다 _GiverState 가 private 이기 떄문.
//
//   @override
//   Widget build(BuildContext context) {
//     return Text('$_key.currentState.counter');
//   }
// }

//이 방식은 _GiverState 가 private 하지 않아야 하는 것 같다. 테스트 결과 내가 원하는 방식이 아님. 이래서 위젯트리 상태관리가 필요한 느낌이 든다.

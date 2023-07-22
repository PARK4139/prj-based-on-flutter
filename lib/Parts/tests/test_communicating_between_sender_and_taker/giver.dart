import 'package:flutter/material.dart';

class Giver extends StatefulWidget {
  const Giver({super.key});

  @override
  _GiverState createState() => _GiverState();
}

class _GiverState extends State<Giver> {
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Text('The counter is ${_counter}');
  }
}


class Taker extends StatefulWidget {
  const Taker({super.key});

  @override
  _TakerState createState() => _TakerState();
}

class _TakerState extends State<Taker> {
  final GlobalKey<_GiverState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Text('$_key.currentState.counter');
  }
}
//이 방식은 _GiverState 가 private 하지 않아야 하는 것 같다. 테스트 결과 내가 원하는 방식이 아님. 이래서 위젯트리 상태관리가 필요한 느낌이 든다.

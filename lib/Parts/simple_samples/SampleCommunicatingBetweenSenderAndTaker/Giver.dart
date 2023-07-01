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
    return Container(
      child: Text('The counter is ${_counter}'),
    );
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

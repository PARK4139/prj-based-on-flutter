import 'dart:async';
import 'package:flutter/material.dart';

//내가 수집한 텍스트들
class SampleGridSystem extends StatefulWidget {

  @override
  State<SampleGridSystem> createState() => _SampleGridSystemState();

  SampleGridSystem();
}

class _SampleGridSystemState extends State<SampleGridSystem> {

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
        Container(color: Colors.purple),
      ],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }


}

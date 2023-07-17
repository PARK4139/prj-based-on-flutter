import 'package:flutter/material.dart';


class SampleGridSystem extends StatefulWidget {
  @override
  State<SampleGridSystem> createState() => _SampleGridSystemState();

  SampleGridSystem();
}

class _SampleGridSystemState extends State<SampleGridSystem> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
        Container(color: Colors.purple),
      ],
    );
  }
}

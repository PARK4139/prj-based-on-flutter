import 'package:flutter/material.dart';

class ScreenUndefined0000 extends StatefulWidget {
  const ScreenUndefined0000({super.key});

  @override
  State<ScreenUndefined0000> createState() => _ScreenUndefined0000State();
}

class _ScreenUndefined0000State extends State<ScreenUndefined0000> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Row(
            children:
            [
              Icon(Icons.question_mark),
              Text("______________________________"),
            ],
          ),
          onTap: () {
          },
        ),
      ),
    );
  }
}

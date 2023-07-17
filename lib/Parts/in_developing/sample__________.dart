import 'package:flutter/material.dart';

class sample__________ extends StatefulWidget {
  const sample__________({super.key});

  @override
  State<sample__________> createState() => _sample__________State();
}

class _sample__________State extends State<sample__________> {
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

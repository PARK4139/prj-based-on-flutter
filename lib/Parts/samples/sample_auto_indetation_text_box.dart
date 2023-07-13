import 'package:flutter/material.dart';

class sample_auto_indetation_text_box extends StatefulWidget {
  const sample_auto_indetation_text_box({super.key});

  @override
  State<sample_auto_indetation_text_box> createState() => _sample_auto_indetation_text_boxState();
}

class _sample_auto_indetation_text_boxState extends State<sample_auto_indetation_text_box> {
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

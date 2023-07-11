import 'package:flutter/material.dart';

class SampleMethodOperationAfterSeconds extends StatefulWidget {
  const SampleMethodOperationAfterSeconds({super.key});

  @override
  State<SampleMethodOperationAfterSeconds> createState() => _SampleMethodOperationAfterSecondsState();
}

class _SampleMethodOperationAfterSecondsState extends State<SampleMethodOperationAfterSeconds> {
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

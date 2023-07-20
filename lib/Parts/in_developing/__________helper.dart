import 'package:flutter/material.dart';

class __________Helper extends StatefulWidget {
  const __________Helper({super.key});

  @override
  State<__________Helper> createState() => __________HelperState();
}

class __________HelperState extends State<__________Helper> {
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

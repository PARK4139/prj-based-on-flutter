import 'package:flutter/material.dart';

class __________Helper extends StatefulWidget {
  @override
  State<__________Helper> createState() => __________HelperState();

  const __________Helper();
}

class __________HelperState extends State<__________Helper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Row(
            children: [
              Icon(Icons.question_mark),
              Text("______________________________"),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

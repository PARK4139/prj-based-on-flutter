import 'package:flutter/material.dart';

import 'sample_routing_screen_second.dart';

class SampleRoutingScreenFirst extends StatefulWidget {
  const SampleRoutingScreenFirst({Key? key}) : super(key: key);

  @override
  State<SampleRoutingScreenFirst> createState() => _SampleRoutingScreenFirstState();
}

class _SampleRoutingScreenFirstState extends State<SampleRoutingScreenFirst> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: TextButton(
        child: const Text('GO TO SCREEN_SECOND', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SampleRoutingScreenSecond()));
        },
      ),
    );
  }
}

import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import '../in_operating/My_functions.dart';

class SampleGridSystem2 extends StatefulWidget {

  const SampleGridSystem2({
    Key? key,
  }) : super(key: key);

  @override
  State<SampleGridSystem2> createState() => _SampleGridSystem2State();
}

class _SampleGridSystem2State extends State<SampleGridSystem2> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.purple,
        ),
      ],
    );
  }
}

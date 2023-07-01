import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import '../in_operating/My_functions.dart';

class SampleGridSystem1 extends StatefulWidget {

  const SampleGridSystem1({
    Key? key,
  }) : super(key: key);

  @override
  State<SampleGridSystem1> createState() => _SampleGridSystem1State();
}

class _SampleGridSystem1State extends State<SampleGridSystem1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

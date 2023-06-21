import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import 'MyFunctions.dart';

class Button_general extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  const Button_general({
    Key? key,
    required this.text,
    required this.background_color,
    required this.color,
    required this.font_size,
    required this.font_weight,
    required this.padding_vertical,
    required this.padding_horizontal,
    required this.border_radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background_color,
        borderRadius: border_radius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: padding_horizontal,
        vertical: padding_vertical,
      ),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: font_size,
            fontWeight: font_weight,
          ),
        ),
        onPressed: foo,
      ),
    );
  }

  void foo() {
    print('foo');
  }
}
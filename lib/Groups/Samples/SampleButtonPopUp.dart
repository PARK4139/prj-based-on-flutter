import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import '../MyFavoriteThings/MyFunctions.dart';

class SampleButtonPopUp extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  const SampleButtonPopUp({
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
        onPressed: () {
// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return Container(
//       height: 10.0,
//       width: 10.0,
//       color: Colors.white,
//     );
//   },
// );


          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    clipBehavior: Clip.none, children: <Widget>[
                    Positioned(
                      right: -40.0,
                      top: -40.0,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Form(
// key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              child: Text("Submitß"),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('AlertDialog Title'),
                                      content: const SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text('This is a demo alert dialog.'),
                                            Text('Would you like to approve of this message?'),
                                            Text('Would you like to approve of this message?'),
                                            Text('Would you like to approve of this message?'),
                                            Text('Would you like to approve of this message?'),
                                            Text('Would you like to approve of this message?'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Approve'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
// if (_formKey.currentState.validate()) {
//   _formKey.currentState.save();
// }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                  ),
                );
              });
        },
      ),
    );
  }

}
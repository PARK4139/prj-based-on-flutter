import 'package:flutter/material.dart';

class Screen_carrot_market_Chatting extends StatefulWidget {
  const Screen_carrot_market_Chatting({Key? key}) : super(key: key);

  @override
  State<Screen_carrot_market_Chatting> createState() => _Screen_carrot_market_ChattingState();
}

class _Screen_carrot_market_ChattingState extends State<Screen_carrot_market_Chatting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Placeholder(fallbackHeight: 140),
            Placeholder(fallbackHeight: 140),
            Placeholder(fallbackHeight: 140),
            Placeholder(fallbackHeight: 140),
          ],
        ),
      ),
    );
  }
}

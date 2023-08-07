import 'package:flutter/material.dart';

class ScreenCarrotMarketChatting extends StatefulWidget {
  const ScreenCarrotMarketChatting({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarketChatting> createState() => _ScreenCarrotMarketChattingState();
}

class _ScreenCarrotMarketChattingState extends State<ScreenCarrotMarketChatting> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
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

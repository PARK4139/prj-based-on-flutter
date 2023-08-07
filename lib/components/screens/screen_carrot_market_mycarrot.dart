import 'package:flutter/material.dart';

class ScreenCarrotMarketMyCarrot extends StatefulWidget {
  const ScreenCarrotMarketMyCarrot({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarketMyCarrot> createState() => _ScreenCarrotMarketMyCarrotState();
}

class _ScreenCarrotMarketMyCarrotState extends State<ScreenCarrotMarketMyCarrot> {
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

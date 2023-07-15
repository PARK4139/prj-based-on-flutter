import 'package:flutter/material.dart';

class ScreenCarrotMarketArroundMe extends StatefulWidget {
  const ScreenCarrotMarketArroundMe({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarketArroundMe> createState() => _ScreenCarrotMarketArroundMeState();
}

class _ScreenCarrotMarketArroundMeState extends State<ScreenCarrotMarketArroundMe> {
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

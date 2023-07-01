import 'package:flutter/material.dart';

class Screen_carrot_market_MyCarrot extends StatefulWidget {
  const Screen_carrot_market_MyCarrot({Key? key}) : super(key: key);

  @override
  State<Screen_carrot_market_MyCarrot> createState() => _Screen_carrot_market_MyCarrotState();
}

class _Screen_carrot_market_MyCarrotState extends State<Screen_carrot_market_MyCarrot> {
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

import 'package:flutter/material.dart';

class Screen_carrot_market_ArroundMe extends StatefulWidget {
  const Screen_carrot_market_ArroundMe({Key? key}) : super(key: key);

  @override
  State<Screen_carrot_market_ArroundMe> createState() => _Screen_carrot_market_ArroundMeState();
}

class _Screen_carrot_market_ArroundMeState extends State<Screen_carrot_market_ArroundMe> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Placeholder(fallbackHeight: 140),
          Placeholder(fallbackHeight: 140),
          Placeholder(fallbackHeight: 140),
          Placeholder(fallbackHeight: 140),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Screen_carrot_market_home_sub_to_write extends StatefulWidget {
  const Screen_carrot_market_home_sub_to_write({Key? key}) : super(key: key);

  @override
  State<Screen_carrot_market_home_sub_to_write> createState() => _Screen_carrot_market_home_sub_to_writeState();
}

class _Screen_carrot_market_home_sub_to_writeState extends State<Screen_carrot_market_home_sub_to_write> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('writing', style: TextStyle(fontSize: 14, color: Colors.grey)),
          elevation: 1,
          foregroundColor: Colors.grey,
        ),
        body: Placeholder());
  }
}

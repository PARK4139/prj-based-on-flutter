import 'package:flutter/material.dart';

class Screen_carrot_market_home_sub_to_search extends StatefulWidget {
  const Screen_carrot_market_home_sub_to_search({Key? key}) : super(key: key);

  @override
  State<Screen_carrot_market_home_sub_to_search> createState() => _Screen_carrot_market_home_sub_to_searchState();
}

class _Screen_carrot_market_home_sub_to_searchState extends State<Screen_carrot_market_home_sub_to_search> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('search', style: TextStyle(fontSize: 14, color: Colors.grey)),
          elevation: 1,
          foregroundColor: Colors.grey,
        ),
        body: Placeholder());
  }
}

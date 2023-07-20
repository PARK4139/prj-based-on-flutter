import 'package:flutter/material.dart';

class ScreenCarrotMarketHomeSubToSearch extends StatefulWidget {
  const ScreenCarrotMarketHomeSubToSearch({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarketHomeSubToSearch> createState() => _ScreenCarrotMarketHomeSubToSearchState();
}

class _ScreenCarrotMarketHomeSubToSearchState extends State<ScreenCarrotMarketHomeSubToSearch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('search', style: TextStyle(fontSize: 14, color: Colors.grey)),
          elevation: 1,
          foregroundColor: Colors.grey,
        ),
        body: const Placeholder());
  }
}

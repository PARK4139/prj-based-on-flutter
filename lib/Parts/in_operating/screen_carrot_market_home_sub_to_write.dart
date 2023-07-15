import 'package:flutter/material.dart';

class ScreenCarrotMarketHomeSubToWrite extends StatefulWidget {
  const ScreenCarrotMarketHomeSubToWrite({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarketHomeSubToWrite> createState() => _ScreenCarrotMarketHomeSubToWriteState();
}

class _ScreenCarrotMarketHomeSubToWriteState extends State<ScreenCarrotMarketHomeSubToWrite> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('writing', style: TextStyle(fontSize: 14, color: Colors.grey)),
          elevation: 1,
          foregroundColor: Colors.grey,
        ),
        body: const SafeArea(child: Placeholder()));
  }
}

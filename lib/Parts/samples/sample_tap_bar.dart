import 'package:flutter/material.dart';

class SampleTapBar extends StatefulWidget {
  @override
  State<SampleTapBar> createState() => _SampleTapBarState();
}

class _SampleTapBarState extends State<SampleTapBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarView Demo'),
        bottom: TabBar(
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: TabBarView(
        children: [
          Center(child: Text('Tab 1')),
          Center(child: Text('Tab 2')),
          Center(child: Text('Tab 3')),
        ],
        controller: TabController(length: 3, initialIndex: _selectedIndex, vsync: AnimatedGridState()),
      ),
    );
    ;
  }
}

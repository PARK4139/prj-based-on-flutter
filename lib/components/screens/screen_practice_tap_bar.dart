import 'package:flutter/material.dart';

class ScreenPracticeTapBar extends StatefulWidget {
  const ScreenPracticeTapBar({super.key});

  @override
  State<ScreenPracticeTapBar> createState() => _ScreenPracticeTapBarState();
}

class _ScreenPracticeTapBarState extends State<ScreenPracticeTapBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: const [
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
        controller: TabController(length: 3, initialIndex: _selectedIndex, vsync: AnimatedGridState()),
        children: const [
          Center(child: Text('Tab 1')),
          Center(child: Text('Tab 2')),
          Center(child: Text('Tab 3')),
        ],
      ),
    );
  }
}

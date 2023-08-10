
import 'package:flutter/material.dart';

class ScreenSplash11 extends StatelessWidget {
  const ScreenSplash11({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.blueAccent, backgroundColor: Colors.grey),
      ),
    );
  }
}

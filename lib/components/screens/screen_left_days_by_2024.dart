import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenLeftDaysBy2024 extends StatefulWidget {
  const ScreenLeftDaysBy2024({super.key});

  @override
  State<ScreenLeftDaysBy2024> createState() => _ScreenLeftDaysBy2024State();
}

class _ScreenLeftDaysBy2024State extends State<ScreenLeftDaysBy2024> {
  late final int diffDays;
  late final DateTime selectedDate;

  late final DateTime specificDay;

  late final DateTime now;

  @override
  void initState() {
    super.initState();
    specificDay = DateTime(2024, 01, 01);
    now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    diffDays = now.difference(specificDay).inDays;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    // final DateTime now = DateTime.now();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              /*앱바*/Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /*뒤로가기 버튼*/ InkWell(
                    child: const Icon(Icons.chevron_left, size: 40, color: Colors.white),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              /*메인컨테이너*/ Expanded(
                child: Center(
                  child: SizedBox(
                    child: Text(
                      "D$diffDays",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

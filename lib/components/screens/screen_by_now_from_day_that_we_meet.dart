import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/super_helper.dart';

class ScreenByNowFromDayThatWeMeet extends StatefulWidget {
  const ScreenByNowFromDayThatWeMeet({super.key});

  @override
  State<ScreenByNowFromDayThatWeMeet> createState() => _ScreenByNowFromDayThatWeMeetState();
}

class _ScreenByNowFromDayThatWeMeetState extends State<ScreenByNowFromDayThatWeMeet> {
  late int diffDayCount;

  late List<Widget> items;

  late Timer scheduler;

  late PageController pageController;

  int currentPage = 0;

  late DateTime selectedDate; //이것을 위젯트리 상태관리에 넣거나 DB에 저장하도록 추후 수정하기

  @override
  void initState() {
    super.initState();
    items = [
      for (int i = 1; i <= 80; i=i+3) Image.asset('asset/images/sky_best ($i).jpg', fit: BoxFit.contain),
    ];
    pageController = PageController(viewportFraction: 0.8, initialPage: currentPage);
    scheduler = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if (currentPage < items.length) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(seconds: 1),
        // curve: Curves.easeIn,
        curve: Curves.linear,
      );
    });
    // selectedDate = DateTime(DateTime.now().year, 01, 01);/*OPERATION*/
    selectedDate = DateTime(2019, 08 , 10);
    diffDayCount = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).difference(selectedDate).inDays;
  }

  @override
  void dispose() {
    scheduler.cancel();
    pageController.dispose();

    super.dispose(); //super.dispose() 는 일반적으로 아래에 작성해야하는 것 같음.
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.transparent /*상태바 투명하게*/));

    // final DateTime now = DateTime.now();
    return Scaffold(
      body: ListView(
        children: [
          /*커스텀 앱바*/ Container(
            color: Colors.pink.shade50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                /*뒤로가기 버튼*/ InkWell(
                  child: const Icon(Icons.chevron_left, size: 40, color: Colors.white),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          /*메인컨테이너*/ Container(
            color: Colors.pink.shade50,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  // height: 185 - 30 + 30 + 30 + 30 + 30 - 22 + 44,
                  // height: 185 - 30 + 30 + 30 + 30 + 30 - 22 + 44+16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          /*5초 후에 사라지는 alert 위젯*/
                          //나중에 하자
                        },
                        child: const Text(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'Parisienne',
                          ),
                          "U & I",
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white,
                            duration: const Duration(milliseconds: 1000),
                            content: Text('사랑해💕💕.\n우리 다음에 만나요!', style: TextStyle(color: Colors.pinkAccent.shade100)),
                          ));
                        },
                        child: const Text(
                          "우리 처음 만난날",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'sunFlower',
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),

                      /*데이트피커*/ TextButton(
                        onPressed: () {
                          showCupertinoDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.white,
                                  height: 300.0,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    // mode: CupertinoDatePickerMode.dateAndTime,
                                    // mode: CupertinoDatePickerMode.time,
                                    onDateTimeChanged: (DateTime date) {
                                      printWithoutError(date);
                                      setState(() {
                                        selectedDate = date;
                                        diffDayCount = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).difference(selectedDate).inDays;
                                      });
                                    },
                                    initialDateTime: selectedDate,
                                    maximumYear: DateTime.now().year,
                                    minimumDate: DateTime(DateTime.now().year - 50, 01, 01), //50년 전까지 가능
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "${selectedDate.year}.${selectedDate.month}.${selectedDate.day}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                child: Container(
                                  color: Colors.white,
                                  child: SizedBox(
                                    height: 300.0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text('사랑해💖💗', style: TextStyle(color: Colors.pinkAccent.shade100)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('나도💕', style: TextStyle(color: Colors.pinkAccent.shade100)),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('난 아니야💔', style: TextStyle(color: Colors.grey.shade300)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.favorite, size: 30, color: Colors.red)),

                      Text(
                        "D+$diffDayCount",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // SizedBox(height: 5),
                    ],
                  ),
                ),
                /*포토프레임*/ SizedBox(
                  height: 450 - 50 - 50,
                  child: PageView.builder(
                    dragStartBehavior: DragStartBehavior.start,
                    clipBehavior: Clip.hardEdge,
                    controller: pageController,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      // return Transform.scale(scale: 3,child: Container(padding: const EdgeInsets.all(50),child: items[index]));
                      return Expanded(child: Container(padding: const EdgeInsets.all(40), child: items[index]));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

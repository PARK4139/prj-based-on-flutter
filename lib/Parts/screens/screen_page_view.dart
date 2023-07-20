import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenPracticePageView extends StatefulWidget {
  const ScreenPracticePageView({super.key});

  @override
  State<ScreenPracticePageView> createState() => _ScreenPracticePageViewState();
}

class _ScreenPracticePageViewState extends State<ScreenPracticePageView> {
  late List<Widget> items;

  late Timer timer;

  late PageController pageController;

  int currentPage = 0;

  late int nextPage;

  @override
  void initState() {
    super.initState();
    items = [
      // Image.asset('asset/images/my_lovely_dog_sky.jpg', fit: BoxFit.cover),
      Image.asset('asset/images/my_lovely_dog_sky.jpg', fit: BoxFit.contain),
      Image.asset('asset/images/my_lovely_dog_sky.jpg', fit: BoxFit.contain),
      Image.asset('asset/images/my_lovely_dog_sky.jpg', fit: BoxFit.contain),
      Image.asset('asset/images/my_lovely_dog_sky.jpg', fit: BoxFit.contain),
      // Image.asset('asset/images/my_lovely_dog_sky.jpg', fit: BoxFit.fill),
      // Image.asset('asset/images/my_lovely_dog_sky.jpg', fit: BoxFit.fitHeight),
      // Image.asset('asset/images/my_lovely_dog_sky.jpg', fit: BoxFit.fitWidth),
    ];
    pageController = PageController(viewportFraction: 0.8, initialPage: currentPage);
    timer = Timer.periodic(const Duration(milliseconds: 3000), (timer) {
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
  }

  @override
  void dispose() {
    timer.cancel();
    pageController.dispose();

    super.dispose();
    // timer.cancel();   // <--이렇게 아래에 있으면 안된다,
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            /*커스텀 앱바*/ Container(
              color: Colors.black87,
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
            SizedBox(
              height: 650,
              child: PageView.builder(
                dragStartBehavior: DragStartBehavior.start,
                clipBehavior: Clip.hardEdge,
                controller: pageController,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // return Transform.scale(scale: 3,child: Container(padding: const EdgeInsets.all(50),child: items[index]));
                  return items[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

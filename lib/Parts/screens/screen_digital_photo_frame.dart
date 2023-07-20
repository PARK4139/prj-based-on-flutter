import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenDigitalPhotoFrame extends StatefulWidget {
  const ScreenDigitalPhotoFrame({super.key});

  @override
  State<ScreenDigitalPhotoFrame> createState() => _ScreenDigitalPhotoFrameState();
}

class _ScreenDigitalPhotoFrameState extends State<ScreenDigitalPhotoFrame> {
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
    timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
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

    super.dispose(); //super.dispose() 는 일반적으로 아래에 작성해야하는 것 같음.
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
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
            /*포토프레임*/SizedBox(
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

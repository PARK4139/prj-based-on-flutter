import 'package:flutter/material.dart';

import '../helpers/circle_box_maker.dart';
import '../helpers/super_helper.dart';

class ScreenVideoPlayer extends StatefulWidget {
  const ScreenVideoPlayer({super.key});

  @override
  State<ScreenVideoPlayer> createState() => _ScreenVideoPlayerState();
}

class _ScreenVideoPlayerState extends State<ScreenVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /*임시메인컨테이너*/ Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF2A3A7C), Color(0xFF000118)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /*투명 앱바*/ SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              child: const Row(
                                children: [
                                  Icon(Icons.arrow_left, size: 30, color: Colors.white),
                                  Text("Navigation", style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text(MyMents.informPop, style: const TextStyle(color: Colors.white))));
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    MySeperators.withChildLess(height: 200),
                    /*메인아이콘 컨테이너*/ Container(
                      height: 180,
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      decoration: BoxDecoration(
                        color: null,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: GestureDetector(
                        onTap:(){
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                        child: Column(
                          children: [
                            /*무지개 그라데이션 컨테이너*/ Transform.translate(
                              offset: const Offset(0, 0),
                              child: Transform.scale(
                                scale: 25000,
                                child: CircleBoxHelper(
                                  item: Container(
                                    height: 0.01,
                                    decoration: BoxDecoration(
                                      gradient: RadialGradient(colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.blue.shade900, Colors.purple].reversed.toList()),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            /*리니어그라데이션 컨테이너*/ Transform.translate(
                              offset: const Offset(0+20, 0),
                              child: Transform.scale(
                                scale: 9000,
                                child: Container(
                                  height: 0.01,
                                  width: 0.01,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.red, Colors.orange, Colors.yellow ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Transform.translate(offset: const Offset(0, 0 - 20), child: Transform.scale(scale: 12000, child: CircleBoxHelper(item: StripedBoxHelper(colors: const [Colors.black], ratioX: 0.01, ratioY: 0.01)))),
                            Transform.translate(offset: const Offset(0, 0 - 10), child: Transform.scale(scale: 9.0, child: const Icon(Icons.play_circle, color: Colors.white))),
                          ],
                        ),
                      ),
                    ),
                    MySeperators.withChildLess(height: 50),
                    /*버튼*/ InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('VIDEO', style: MyTextStyles.textStyle20230722_1841),
                          Text('PLAYER', style: MyTextStyles.textStyle20230722_1841.copyWith(fontWeight: FontWeight.w800)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/source/remote/pm_api_helper.dart';
import '../../utils/super_helper.dart';

class ScreenRoadCctv extends StatefulWidget {
  const ScreenRoadCctv({super.key});

  @override
  State<ScreenRoadCctv> createState() => _ScreenRoadCctvState();
}

class _ScreenRoadCctvState extends State<ScreenRoadCctv> {
  late int diffDayCount;

  late List<Widget> items;

  late Timer scheduler;

  late PageController pageController;

  int currentPage = 0;

  late DateTime selectedDate;

  String dateAndTime = "";

  double pm10Value = 0.0;
  String pm10Level = "";

  double pm25Value = 0.0;
  String pm25Level = "";

  @override
  void initState() {
    super.initState();
    items = [
      for (int i = 1; i <= 80; i = i + 3) Image.asset('asset/images/sky_best ($i).jpg', fit: BoxFit.contain),
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
    selectedDate = DateTime(2019, 08, 10);
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

    // debugSomethingSimple(ourRegions.values.toList().runtimeType.toString());
    // debugSomething(ourRegions.values.toList());

    // final DateTime now = DateTime.now();
    return Scaffold(
      bottomNavigationBar: ConvexAppBar.badge(const {0: '99+', 1: 'New', 2: Colors.red},
        style: TabStyle.flip,
        // curveSize: 30,
        // top: -50,
        // height: 50,
badgeColor: MyColors.orange,
        backgroundColor: MyColors.black12,
        color: MyColors.whiteWithOpacity40Percent,
        activeColor: MyColors.white,
        items: const [
          TabItem(icon: Icons.home, title: '홈'),
          TabItem(icon: Icons.map, title: '지도'),
          TabItem(icon: Icons.add, title: '설정'),
          TabItem(icon: Icons.add, title: '기타'),
          TabItem(icon: Icons.message, title: '메시지'),
          TabItem(icon: Icons.people, title: '프로필',),
        ],
        onTap: (int i) => debugSomething('click index=$i',troubleShootingId: "20230822020151"),
      ),
      // bottomNavigationBar: ConvexButton.fab(
      //   onTap: () => setState(() => debugSomething('clicked',troubleShootingId: "20230822020152")),
      // ),
      backgroundColor: MyColors.black,
      body: FutureBuilder(
          future: Pm25ApiService.getPm25s(),
          builder: (context, snapshot2) {
            // debugSomething(snapshot2.data );
            if (snapshot2.data != null) {
              for (int i = 0; i < snapshot2.data!.length; i++) {
                // printSeparatorWithMkr();
                // debugSomethingWithoutMent(snapshot2.data![i].dataTime.split(":").first );
                // debugSomethingWithoutMent(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH]));
                // printSeparatorWithMkr();
                if (snapshot2.data![i].dataTime.split(":").first == formatDate(DateTime.now().add(const Duration(hours: -1)), [yyyy, '-', mm, '-', dd, ' ', HH])) {
                  pm25Value = int.parse(snapshot2.data![i].seoul).toDouble();
                  pm25Level = koreanStateMaker(pm25Value);
                  // debugSomething(pm25Value.toString() );
                  // debugSomething(pm25Level.toString() );
                }
              }
            }
            return FutureBuilder(
                future: Pm10ApiService.getPm10s(),
                builder: (context, snapshot) {
                  // debugSomething(snapshot.data );
                  if (snapshot.data != null) {
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      if (snapshot.data![i].dataTime.split(":").first == formatDate(DateTime.now().add(const Duration(hours: -1)), [yyyy, '-', mm, '-', dd, ' ', HH])) {
                        pm10Value = int.parse(snapshot.data![i].seoul).toDouble();
                        pm10Level = koreanStateMaker(pm10Value);
                        // debugSomething(pm10Value.toString() );
                        // debugSomething(pm10Level.toString() );
                      }
                    }
                    return CustomScrollView(
                      slivers: [
                        MySliverAppBar(snapshot.data!),
                        const SliverToBoxAdapter(child: SizedBox(height: 30)), //같은 논리로 SizedBox(height: 5) 또한  SliverToBoxAdapter() 로 감싸 넣어야 가능하다
                        MyCard(
                          title: "도로 cctv 관제",
                          cardContents: SizedBox(
                            height: 320,
                            child: LayoutBuilder(builder: (context, constraint) {
                              for (int i = 0; i < snapshot.data!.length; i++) {
                                // debugSomethingWithoutMent(snapshot.data![i].dataTime);
                              }

                              return ListView(
                                scrollDirection: Axis.vertical,
                                physics: const PageScrollPhysics(),
                                children: [
                                  for (int i = 0; i < snapshot.data!.length; i++) MyMiniRow(time: snapshot.data![i].dataTime, imgPath: "${snapshot.data![i].seoul} ㎍/㎥", level: koreanStateMaker(int.parse(snapshot.data![i].seoul).toDouble()), height: constraint.maxHeight / 10 + 0.7),
                                ],
                              );
                            }),
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 300)),
                      ],
                    );
                    // }
                  }

                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text(MyMents.inLoading(title: "공공데이터포털의 API를 통해\n 미세먼지 정보"), style: const TextStyle(color: MyColors.white))),
                        const SizedBox(height: 30),
                        const Center(child: MyLinearProgressIndicatorSimple()),
                      ],
                    ),
                  );
                });
          }),
    );
  }

  String koreanStateMaker(double pm10stat) {
    final String pm10KoreanLevel;
    if (0 <= pm10Value && pm10Value <= 15) {
      pm10KoreanLevel = "좋은";
    } else if (16 <= pm10Value && pm10Value <= 50) {
      pm10KoreanLevel = "보통";
    } else if (51 <= pm10Value && pm10Value <= 100) {
      pm10KoreanLevel = "나쁜";
    } else if (101 <= pm10Value) {
      pm10KoreanLevel = "매우나쁜";
    } else {
      pm10KoreanLevel = "???";
    }
    return pm10KoreanLevel;
  }
}

class MyCard extends StatelessWidget {
  String title;

  dynamic cardContents;

  MyCard({required this.title, required this.cardContents});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        // margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
            bottomRight: Radius.circular(4.0),
          ),
        ),
        color: MyColors.greyWithOpacity90Percent,
        // color: MyColors.white,//DEBUG CODE
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Column() 에 crossAxisAlignment: CrossAxisAlignment.stretch, 코드를 사용하면 ListView() 와 유사한 느낌이 든다.
          children: [
            Container(
              decoration: const BoxDecoration(
                color: MyColors.color0xff00675b,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              child: Text(
                title,
                style: MyTextStyles.sunFlower.copyWith(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            cardContents,
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends StatefulWidget {
  List<Pm10> snapShotData;

  MySliverAppBar(this.snapShotData);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: MyColors.color0xff009688,
      /*앱바의 기본높이를 커스텀 설정*/ expandedHeight: 350,
      /*스크롤하면 사라질 공간*/ flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            // color: Colors.black,//DEBUG CODE
            margin: const EdgeInsets.only(top: kToolbarHeight),
            child: Builder(builder: (context) {
              for (int i = 0; i < widget.snapShotData.length; i++) {
                // debugSomethingWithoutMent(widget.snapShotData[i].dataTime.split(":").first );
                // debugSomethingSimple(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH]));

                // 00 시에는 나타나지 않는 이슈발견 및 처리
                // "2023-08-04 24:00" 인 경우 UI가 나타나지 않음.
                // ex) "2023-08-04 24:00"을  "2023-08-05 00:00"로 바뀌도록 처리
                if (widget.snapShotData[i].dataTime.split(":").first.split(" ").last == "24") {
                  widget.snapShotData[i].dataTime =
                      "${widget.snapShotData[i].dataTime.split(" ").first.split("-")[0]}-${widget.snapShotData[i].dataTime.split(" ").first.split("-")[1]}-${(int.parse(widget.snapShotData[i].dataTime.split(" ").first.split("-").last) + 1).toString().padLeft(2, "0")} 00:00";
                }

                if (widget.snapShotData[i].dataTime.split(":").first == formatDate(DateTime.now().add(const Duration(hours: -1)), [yyyy, '-', mm, '-', dd, ' ', HH])) {
                  // debugSomethingWithoutMent(widget.snapShotData[i].dataTime.split(":").first);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${widget.snapShotData[i].dataTime} 선택 cctv 기준정보", style: MyTextStyles.sunFlower.copyWith(fontSize: 20)),
                      /*텍스트버튼*/ TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.snapShotData[i].seoul, style: TextStyle(color: Colors.pink.shade50, fontSize: 100, fontWeight: FontWeight.w100)),
                            Text('㎍/㎥', style: TextStyle(color: Colors.pink.shade50, fontSize: 30, fontWeight: FontWeight.w100)),
                          ],
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                        },
                      ),
                    ],
                  );
                }
              }
              return const CircularProgressIndicator();
            }),
          ),
        ),
      ),
    );
  }
}

class MyMiniRow extends StatelessWidget {
  final String time;
  final String imgPath;

  /*오염수준*/
  final String level;

  double height;

  MyMiniRow({required this.time, required this.imgPath, required this.level, Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        color: MyColors.color0xff52c7b8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50 + 40,
                child: Text(
                  time,
                  style: MyTextStyles.sunFlower.copyWith(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  imgPath,
                  style: MyTextStyles.sunFlower.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  level,
                  style: MyTextStyles.sunFlower.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

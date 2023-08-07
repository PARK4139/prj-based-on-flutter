import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/super_helper.dart';
import '../in_developing/pm_api_helper.dart';

class ScreenParticularMatter extends StatefulWidget {
  const ScreenParticularMatter({super.key});

  @override
  State<ScreenParticularMatter> createState() => _ScreenParticularMatterState();
}

class _ScreenParticularMatterState extends State<ScreenParticularMatter> {
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
      backgroundColor: _OurColors.primaryColors,
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
                        // slivers: [] 에는 sliver 의 형태인 wiget만 들어갈 수 있는데, 아닌 위젯을 들어가게 하려면 SliverToBoxAdapter() 로 감싸 넣을 수 있다.
                        _OurSliverAppBar(snapshot.data!),
                        _OurCard(
                          title: "종류별 통계",
                          cardContents: SizedBox(
                            height: 150,
                            child: LayoutBuilder(builder: (context, constraint) {
                              return Builder(builder: (context) {
                                return ListView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const PageScrollPhysics(),
                                  children: [
                                    _OurMiniColumn(category: "미세먼지", level: pm10Level, stat: '$pm10Value㎍/㎥', width: constraint.maxWidth / 3),
                                    _OurMiniColumn(category: "초미세먼지", level: pm25Level, stat: '$pm25Value㎍/㎥', width: constraint.maxWidth / 3),
                                    _OurMiniColumn(category: "foo", level: 'foo', stat: 'foo', width: constraint.maxWidth / 3),
                                    // _OurMiniColumn(category: "foo", imgPath: "😘", level: '좋은', stat: 'foo', width: constraint.maxWidth / 3),
                                    // _OurMiniColumn(category: "foo", imgPath: "😘", level: '좋은', stat: 'foo', width: constraint.maxWidth / 3),
                                    // _OurMiniColumn(category: "foo", imgPath: "😘", level: '좋은', stat: 'foo', width: constraint.maxWidth / 3),
                                  ],
                                );
                              });
                            }),
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 30)), //같은 논리로 SizedBox(height: 5) 또한  SliverToBoxAdapter() 로 감싸 넣어야 가능하다
                        // SliverToBoxAdapter(
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        //     child: Column(
                        //       children: [
                        //         SizedBox(
                        //           height: 360,
                        //           child: LayoutBuilder(builder: (context, constraint) {
                        //             return ListView(
                        //               scrollDirection: Axis.vertical,
                        //               physics: const PageScrollPhysics(),
                        //               children: [
                        //                 Container(
                        //                   decoration: const BoxDecoration(
                        //                     color: _OurColors.darkColor,
                        //                     borderRadius: BorderRadius.only(
                        //                       topLeft: Radius.circular(4.0),
                        //                       topRight: Radius.circular(4.0),
                        //                     ),
                        //                   ),
                        //                   child: Text(
                        //                     "시간별 미세먼지",
                        //                     style: _TextStyles.titleTextStyle.copyWith(
                        //                       fontSize: 20,
                        //                     ),
                        //                     textAlign: TextAlign.center,
                        //                   ),
                        //                 ),
                        //                 for (int i = 0; i <= 23; i++) _MiniRow(time: "$i시", imgPath: "😘", level: '좋은', height: constraint.maxHeight / 10),
                        //               ],
                        //             );
                        //           }),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        const SliverToBoxAdapter(child: SizedBox(height: 30)),
                        _OurCard(
                          title: "시간별 미세먼지",
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
                                  for (int i = 0; i < snapshot.data!.length; i++) _OurMiniRow(time: snapshot.data![i].dataTime, imgPath: "${snapshot.data![i].seoul} ㎍/㎥", level: koreanStateMaker(int.parse(snapshot.data![i].seoul).toDouble()), height: constraint.maxHeight / 10 + 0.7),
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
                        Center(child: Text(MyMents.inLoading(title: "공공데이터포털의 API를 통해\n 미세먼지 정보"), style: const TextStyle(color: _OurColors.white))),
                        const SizedBox(height: 30),
                        const Center(child: _OurLinearProgressIndicatorSimple()),
                      ],
                    ),
                  );
                });
          }),
      drawer: const _OurDrawer(),
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

class _OurCard extends StatelessWidget {
  String title;

  dynamic cardContents;

  _OurCard({ required this.title, required this.cardContents});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
            bottomRight: Radius.circular(4.0),
          ),
        ),
        color: _OurColors.lightColor,
        // color: _OurColors.white,//DEBUG CODE
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Column() 에 crossAxisAlignment: CrossAxisAlignment.stretch, 코드를 사용하면 ListView() 와 유사한 느낌이 든다.
          children: [
            Container(
              decoration: const BoxDecoration(
                color: _OurColors.darkColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              child: Text(
                title,
                style: _OurTextStyles.titleTextStyle.copyWith(
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

class _OurColors {
  static const primaryColors = Color(0xff009688);
  static const darkColor = Color(0xff00675b);
  static const lightColor = Color(0xff52c7b8);
  static const white = Colors.white;
  static const green = Colors.green;
  static const lightGreenAccent = Colors.lightGreenAccent;
  static const black = Colors.black;
}

class _OurTextStyles {
  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontFamily: 'sunFlower',
    fontWeight: FontWeight.w700,
  );
}

class _OurSliverAppBar extends StatefulWidget {
  List<Pm10> snapShotData;

  _OurSliverAppBar(this.snapShotData);

  @override
  State<_OurSliverAppBar> createState() => _OurSliverAppBarState();
}

class _OurSliverAppBarState extends State<_OurSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: _OurColors.primaryColors,
      /*앱바의 기본높이를 커스텀 설정*/ expandedHeight: 350,
      /*스크롤하면 사라질 공간*/ flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            // color: Colors.black,//DEBUG CODE
            margin: const EdgeInsets.only(top: kToolbarHeight),
            /*margin 윗부분을 app bar의 기본높이 만큼 컨테이너의 외부에 빈공간을 만들어 drawer 와 겹치는 것을 회피.앱바를 앱바 내부에 만들때.사용할 수 있다*/
            //kToolbarHeight 는 material.dart에서 제공받는 app bar 의 기본높이값이다.
            //margin 은 빈공간 처럼 생각할 수 있다.
            child: Builder(builder: (context) {
              for (int i = 0; i < widget.snapShotData.length; i++) {
                // debugSomethingWithoutMent(widget.snapShotData[i].dataTime.split(":").first );
                // debugSomethingSimple(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH]));

                // 00 시에는 나타나지 않는 이슈발견 및 처리
                // "2023-08-04 24:00" 인 경우 UI가 나타나지 않음.
                // ex) "2023-08-04 24:00"을  "2023-08-05 00:00"로 바뀌도록 처리
                if (widget.snapShotData[i].dataTime.split(":").first.split(" ").last == "24") {
                  // debugSomethingWithoutMent(widget.snapShotData[i].dataTime);
                  // debugSomethingWithoutMent("${widget.snapShotData[i].dataTime.split(" ").first.split("-")[0]}-${widget.snapShotData[i].dataTime.split(" ").first.split("-")[1]}-${(int.parse(widget.snapShotData[i].dataTime.split(" ").first.split("-").last) + 1).toString().padLeft(2, "0")} 00:00");
                  widget.snapShotData[i].dataTime =
                      "${widget.snapShotData[i].dataTime.split(" ").first.split("-")[0]}-${widget.snapShotData[i].dataTime.split(" ").first.split("-")[1]}-${(int.parse(widget.snapShotData[i].dataTime.split(" ").first.split("-").last) + 1).toString().padLeft(2, "0")} 00:00";
                  // widget.snapShotData[i].dataTime == "2023-08-05 00:00";
                }

                // printSeparatorWithMkr();
                // debugSomethingWithoutMent(widget.snapShotData[i].dataTime.split(":").first);
                // debugSomethingWithoutMent(formatDate(DateTime.now().add(const Duration(hours: -1)), [yyyy, '-', mm, '-', dd, ' ', HH]));
                // printSeparatorWithMkr();
                if (widget.snapShotData[i].dataTime.split(":").first == formatDate(DateTime.now().add(const Duration(hours: -1)), [yyyy, '-', mm, '-', dd, ' ', HH])) {
                  // debugSomethingWithoutMent(widget.snapShotData[i].dataTime.split(":").first);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "서울",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'sunFlower',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Text(
                      // formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':',nn])+" 현재시간",
                      //   style: _OurTextStyles.titleTextStyle.copyWith(
                      //     fontSize: 20,
                      //   ),
                      // ),
                      Text(
                        "${widget.snapShotData[i].dataTime} 미세먼지 기준정보",
                        style: _OurTextStyles.titleTextStyle.copyWith(fontSize: 20),
                      ),
                      // 😀😁😂😂😂😃😄😄😅😆😇😈😉😊😋😌😍😍😎😎😏
                      // 😐😑😒😓😔😕😖😗😘😙😚😛😛😜😝😞😞😟😠😠😡
                      // 😢😣😤😥😦😧😨😩😪😫
                      // 😬
                      // 😭😮😮‍💨😯😰😱😲😳😴😴😵😵‍💫
                      // 😶🙁🙂🙃
                      // "🙂"
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

class _OurDrawer extends StatefulWidget {
  const _OurDrawer();

  @override
  State<_OurDrawer> createState() => _OurDrawerState();
}

class _OurDrawerState extends State<_OurDrawer> {
  Regions selectedRegion = Regions.seoul;

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.8,//이렇게 하고 싶은데...안됬음...
      decoration: const BoxDecoration(
        color: _OurColors.lightColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            // backgroundColor: Colors.transparent,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: const BoxDecoration(
              color: _OurColors.darkColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4.0),
              ),
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                "지역선택",
                style: _OurTextStyles.titleTextStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(4.0),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.725,
            child: ListView(
              children: [
                /*collection for 방식*/
                // for (String region in regions)
                //   ListTile(
                //     onTap: () => ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar),
                //     title: Text(
                //       region,
                //       style: _TextStyles.titleTextStyle.copyWith(
                //         fontSize: 18.0,
                //       ),
                //     ),
                //     tileColor: _OurColors.darkColor,
                //     focusColor: _OurColors.lightGreenAccent,
                //     hoverColor: _OurColors.lightGreenAccent,
                //     /*타일 셀렉트 상태*/selected: false/*false*//*true*/,
                //     selectedTileColor: _OurColors.lightColor,
                //     selectedColor: _OurColors.white,
                //   ),

                /*...(cascating operator) 방식*/
                // ...ourRegions
                //     .map((e) => ListTile(
                //           onTap: () {
                //             selectedRegion = regions.seoul;
                //           },
                //           title: Text(
                //             e,
                //             style: _OurTextStyles.titleTextStyle.copyWith(
                //               fontSize: 18.0,
                //             ),
                //           ),
                //           tileColor: _OurColors.white,
                //           focusColor: _OurColors.lightGreenAccent,
                //           hoverColor: _OurColors.lightGreenAccent,
                //           /*타일 셀렉트 상태*/
                //           // selected: false /*false*/ /*true*/,
                //           selected: e == "서울1" ? false : true,
                //           selectedTileColor: _OurColors.lightColor,
                //           selectedColor: _OurColors.black,
                //         ))
                //     .toList(),
                // .toList()의 결과는 [e] 인데 후처리로 regions의 앞에 ...(cascating operator) 를 이용해서 list 내부의 값을 각각 흩뿌릴 수 있다!! 매우 유용

                for (var entry in ourRegions.entries)
                  ListTile(
                    onTap: () {
                      selectedRegion = entry.key;
                      debugSomethingSimple(selectedRegion.toString());
                      isSelected = !isSelected;
                      debugSomethingSimple(isSelected.toString());
                    },
                    title: Text(
                      entry.value,
                      style: _OurTextStyles.titleTextStyle.copyWith(fontSize: 15.0, color: Colors.white60),
                    ),
                    tileColor: _OurColors.lightColor,
                    focusColor: _OurColors.lightGreenAccent,
                    hoverColor: _OurColors.lightGreenAccent,
                    /*타일 셀렉트 상태*/
                    selected: isSelected ? true : false,
                    // selected: true,
                    selectedTileColor: _OurColors.lightColor,
                    selectedColor: _OurColors.black,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum Regions {
  daegu,
  chungnam,
  incheon,
  daejeon,
  gyeongbuk,
  sejong,
  gwangju,
  jeonbuk,
  gangwon,
  ulsan,
  jeonnam,
  seoul,
  busan,
  jeju,
  chungbuk,
  gyeongnam,
  dataTime,
  dataGubun,
  gyeonggi,
  itemCode,
}

Map<Regions, String> ourRegions = {
  Regions.daegu: '대구',
  Regions.chungnam: '충남',
  Regions.incheon: '인천',
  Regions.daejeon: '대전',
  Regions.gyeongbuk: '경북',
  Regions.sejong: '세종',
  Regions.gwangju: '광주',
  Regions.jeonbuk: '전북',
  Regions.gangwon: '강원',
  Regions.ulsan: '울산',
  Regions.jeonnam: '전남',
  Regions.seoul: '서울',
  Regions.busan: '부산',
  Regions.jeju: '제주',
  Regions.chungbuk: '충북',
  Regions.gyeongnam: '경남',
  Regions.gyeonggi: '경기',
};

class _OurMiniColumn extends StatelessWidget {
  final String category;

  /*오염수준*/
  final String level;

  /*오염수치*/
  final String stat;

  const _OurMiniColumn({required this.category, required this.level, required this.stat, required this.width, Key? key}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _OurColors.lightColor,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(category, style: _OurTextStyles.titleTextStyle.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200)),
            // Text(imgPath, style: _OurTextStyles.titleTextStyle.copyWith(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w200)),
            Text(level, style: _OurTextStyles.titleTextStyle.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200)),
            Text(stat, style: _OurTextStyles.titleTextStyle.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }
}

class _OurMiniRow extends StatelessWidget {
  final String time;
  final String imgPath;

  /*오염수준*/
  final String level;

  double height;

  _OurMiniRow({required this.time, required this.imgPath, required this.level, Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        color: _OurColors.lightColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50 + 40,
                child: Text(
                  time,
                  style: _OurTextStyles.titleTextStyle.copyWith(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  imgPath,
                  style: _OurTextStyles.titleTextStyle.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  level,
                  style: _OurTextStyles.titleTextStyle.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),
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

class _OurProgressIndicatorWithSwitch extends StatefulWidget {
  const _OurProgressIndicatorWithSwitch();

  @override
  State<_OurProgressIndicatorWithSwitch> createState() => _OurProgressIndicatorWithSwitchState();
}

class _OurProgressIndicatorWithSwitchState extends State<_OurProgressIndicatorWithSwitch> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LinearProgressIndicator(
          value: controller.value,
          semanticsLabel: 'Linear progress indicator',
        ),
        Switch(
          value: determinate,
          onChanged: (bool value) {
            setState(() {
              determinate = value;
              if (determinate) {
                controller.stop();
              } else {
                controller
                  ..forward(from: controller.value)
                  ..repeat();
              }
            });
          },
        ),
      ],
    );
  }
}

class _OurLinearProgressIndicatorSimple extends StatefulWidget {
  const _OurLinearProgressIndicatorSimple();

  @override
  State<_OurLinearProgressIndicatorSimple> createState() => _OurLinearProgressIndicatorSimpleState();
}

class _OurLinearProgressIndicatorSimpleState extends State<_OurLinearProgressIndicatorSimple> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: controller.value,
      semanticsLabel: 'Linear progress indicator',
    );
  }
}

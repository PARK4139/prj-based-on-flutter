import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/super_helper.dart';

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

  late String dateAndTime;

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

    // final DateTime now = DateTime.now();
    return Scaffold(
      backgroundColor: _Colors.primaryColors,
      body: CustomScrollView(

        slivers: [
          // slivers: [] 에는 sliver 의 형태인 wiget만 들어갈 수 있는데, 아닌 위젯을 들어가게 하려면 SliverToBoxAdapter() 로 감싸 넣을 수 있다.
          _MainAppBar(),
          _MainCard(
            title: "종류별 통계",
            cardContents: SizedBox(
              height: 150,
              child: LayoutBuilder(builder: (context, constraint) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  children: [
                    _MiniColumn(category: "미세먼지", imgPath: "😘", level: '좋은', stat: '0㎍/㎥', width: constraint.maxWidth / 3),
                    _MiniColumn(category: "초미세먼지", imgPath: "😘", level: '좋은', stat: 'foo', width: constraint.maxWidth / 3),
                    _MiniColumn(category: "foo", imgPath: "😘", level: '좋은', stat: 'foo', width: constraint.maxWidth / 3),
                    _MiniColumn(category: "foo", imgPath: "😘", level: '좋은', stat: 'foo', width: constraint.maxWidth / 3),
                    _MiniColumn(category: "foo", imgPath: "😘", level: '좋은', stat: 'foo', width: constraint.maxWidth / 3),
                  ],
                );
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
          //                     color: _Colors.darkColor,
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
          const SliverToBoxAdapter(child: SizedBox(height: 30)) ,
          _MainCard(
            title: "시간별 미세먼지",
            cardContents: SizedBox(
              height: 320,
              child: LayoutBuilder(builder: (context, constraint) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  physics: PageScrollPhysics(),
                  children: [
                    for (int i = 0; i <= 23; i++) _MiniRow(time: "$i시", imgPath: "😘", level: '좋은', height: constraint.maxHeight / 10+0.7),
                  ],
                );
              }),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 300)),
        ],
      ),
      drawer: _MainDrawer(),
    );
  }
}

class _MainCard extends StatelessWidget {
  String title;

  dynamic cardContents;

  _MainCard({super.key, required this.title, required this.cardContents});

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
        color: _Colors.lightColor,
        // color: _Colors.white,//DEBUG CODE
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Column() 에 crossAxisAlignment: CrossAxisAlignment.stretch, 코드를 사용하면 ListView() 와 유사한 느낌이 든다.

          children: [
            Container(
              decoration: const BoxDecoration(
                color: _Colors.darkColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              child: Text(
                title,
                style: _TextStyles.titleTextStyle.copyWith(
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

class _Colors {
  static const primaryColors = Color(0xff009688);
  static const darkColor = Color(0xff00675b);
  static const lightColor = Color(0xff52c7b8);
  static const white = Colors.white;
  static const green = Colors.green;
  static const lightGreenAccent = Colors.lightGreenAccent;
  static const black = Colors.black;
}

class _TextStyles {
  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontFamily: 'sunFlower',
    fontWeight: FontWeight.w700,
  );
}

class _MainAppBar extends StatelessWidget {
  const _MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: _Colors.primaryColors,
      /*앱바의 기본높이를 커스텀 설정*/ expandedHeight: 350,
      /*스크롤하면 사라질 공간*/ flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            // color: Colors.black,//DEBUG CODE
            margin: const EdgeInsets.only(top: kToolbarHeight),
            /*margin 윗부분을 app bar의 기본높이 만큼 컨테이너의 외부에 빈공간을 만들어 drawer 와 겹치는 것을 회피.앱바를 앱바 내부에 만들때.사용할 수 있다*/
            //kToolbarHeight 는 material.dart에서 제공받는 app bar 의 기본높이값이다.
            //margin 은 빈공간 처럼 생각할 수 있다.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "서울",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'sunFlower',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]),
                  style: _TextStyles.titleTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),

                // 😀😁😂😂😂😃😄😄😅😆😇😈😉😊😋😌😍😍😎😎😏
                // 😐😑😒😓😔😕😖😗😘😙😚😛😛😜😝😞😞😟😠😠😡
                // 😢😣😤😥😦😧😨😩😪😫
                // 😬
                // 😭😮😮‍💨😯😰😱😲😳😴😴😵😵‍💫
                // 😶🙁🙂🙃
                /*텍스트버튼(추천)*/ TextButton(
                  child: Text("🙂", style: TextStyle(color: Colors.pink.shade50, fontSize: 100, fontWeight: FontWeight.w100)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                  },
                ),

                Text(
                  "보통",
                  style: _TextStyles.titleTextStyle.copyWith(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                Text(
                  "나쁘지 않네요!",
                  style: _TextStyles.titleTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MainDrawer extends StatelessWidget {
  const _MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: _Colors.darkColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              "지역선택",
              style: _TextStyles.titleTextStyle.copyWith(
                fontSize: 20.0,
              ),
            ),
          ),
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
          //     tileColor: _Colors.darkColor,
          //     focusColor: _Colors.lightGreenAccent,
          //     hoverColor: _Colors.lightGreenAccent,
          //     /*타일 셀렉트 상태*/selected: false/*false*//*true*/,
          //     selectedTileColor: _Colors.lightColor,
          //     selectedColor: _Colors.white,
          //   ),
          /*...(cascating operator) 방식*/
          ...regions
              .map((e) => ListTile(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar),
                    title: Text(
                      e,
                      style: _TextStyles.titleTextStyle.copyWith(
                        fontSize: 18.0,
                      ),
                    ),
                    tileColor: _Colors.white,
                    focusColor: _Colors.lightGreenAccent,
                    hoverColor: _Colors.lightGreenAccent,
                    /*타일 셀렉트 상태*/
                    // selected: false /*false*/ /*true*/,
                    selected: e == "서울1" ? false : true,
                    selectedTileColor: _Colors.lightColor,
                    selectedColor: _Colors.black,
                  ))
              .toList(),
          // .toList()의 결과는 [e] 인데 후처리로 regions의 앞에 ...(cascating operator) 를 이용해서 list 내부의 값을 각각 흩뿌릴 수 있다!! 매우 유용
        ],
      ),
    );
  }
}

List<String> regions = [
  '서울',
  '서울1',
  '서울2',
  '서울3',
  '서울4',
];

class _MiniColumn extends StatelessWidget {
  final String category;
  final String imgPath;

  /*오염수준*/
  final String level;

  /*오염수치*/
  final String stat;

  const _MiniColumn({required this.category, required this.imgPath, required this.level, required this.stat, required this.width, Key? key}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _Colors.lightColor,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(category, style: _TextStyles.titleTextStyle.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200)),
            Text(imgPath, style: _TextStyles.titleTextStyle.copyWith(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w200)),
            Text(level, style: _TextStyles.titleTextStyle.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200)),
            Text(stat, style: _TextStyles.titleTextStyle.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }
}

class _MiniRow extends StatelessWidget {
  final String time;
  final String imgPath;

  /*오염수준*/
  final String level;

  double height;

  _MiniRow({required this.time, required this.imgPath, required this.level, Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        color: _Colors.lightColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  time,
                  style: _TextStyles.titleTextStyle.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  imgPath,
                  style: _TextStyles.titleTextStyle.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 50,
                child: Text(
                  level,
                  style: _TextStyles.titleTextStyle.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/source/remote/netflixx_api_helper.dart';
import '../../main.dart';
import '../../utils/super_helper.dart';
import 'screen_netflix_home_sub.dart';
import 'screen_netflix_util.dart';

class ScreenNetflixHome extends StatefulWidget {
  const ScreenNetflixHome({Key? key}) : super(key: key);

  @override
  State<ScreenNetflixHome> createState() => _ScreenNetflixHomeState();
}

class _ScreenNetflixHomeState extends State<ScreenNetflixHome> {
  late List<Movie> movies;
  late int _imageSliderCurrentPage;

  @override
  void initState() {
    
    super.initState();
    initMovies();
    initImageSliderCurrentPage();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, //플러터 앱바에서 자동생성 버튼 숨김 : false
        // foregroundColor: Colors.red,//플러터 앱바에서 자동생성 버튼 숨김 : red
        title: Row(
          children: [
            /*뒤로가기 버튼*/ IconButton(
              tooltip: "뒤로가기",
              icon: const Icon(Icons.chevron_left, color: Colors.redAccent),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*넷플릭쓰 로고*/ Container(padding: const EdgeInsets.fromLTRB(0, 7, 0, 7), margin: const EdgeInsets.fromLTRB(0, 0, 0, 0), child: Image.asset('asset/images/app_netflix_logo.png', fit: BoxFit.contain, width: 30)),
                  /*TV 프로그램 버튼*/ InkWell(
                    onTap: () {
                     ScaffoldMessenger.of(context).showSnackBar( SnackBar(duration: const Duration(milliseconds: 1000),content: Text(MyMents.notReadyYet))); // setState(() {
                    },
                    child: Container(padding: const EdgeInsets.fromLTRB(0, 7, 0, 7), margin: const EdgeInsets.fromLTRB(0, 0, 0, 0), child: const Text('TV 프로그램', style: TextStyle(fontSize: 14, color: Colors.white38))),
                  ),
                  /*영화 버튼*/ InkWell(
                    onTap: () {
                     ScaffoldMessenger.of(context).showSnackBar( SnackBar(duration: const Duration(milliseconds: 1000),content: Text(MyMents.notReadyYet))); // setState(() {
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: const Text('영화', style: TextStyle(fontSize: 14, color: Colors.white38)),
                    ),
                  ),
          /*내가 찜한 콘텐츠*/InkWell(
                    onTap: () {
                     ScaffoldMessenger.of(context).showSnackBar( SnackBar(duration: const Duration(milliseconds: 1000),content: Text(MyMents.notReadyYet))); // setState(() {
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: const Text('내가 찜한 콘텐츠', style: TextStyle(fontSize: 14, color: Colors.white38)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            Center(
              child: SizedBox(
                height: 475,
                child: CarouselSlider(
                  items: [
                    for (Movie movie in movies)
                      Column(
                        children: [
                          /*메인 포스터 버튼*/ InkWell(
                            // TODO: IconButton, TextButton 이 아닌 경우에는 InkWell Button을 만들어 사용해야 여러 이슈를 피할 수 있다.
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenNetflixHomeSub(movies: movies)));
                            },
                            child: Transform.translate(
                              offset: const Offset(0, 0),
                              child: Transform.scale(
                                scale: 0.8,
                                child: Image.network(movie.imgUrl),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, -20 - 2 - 2 - 2),
                            child: Text(
                              movie.title,
                              style: const TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                  ],
                  activeIndex: 0,
                  autoplay: true,
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  onPageChanged: (index) {
                    setState(
                      () {
                        _imageSliderCurrentPage = index;
                      },
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*내가 찜한 콘텐츠 버튼*/ const SizedBox(
                  width: 80,
                  child: Column(
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 23),
                      SizedBox(height: 6),
                      Text('내가 찜한 콘텐츠', style: TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  ),
                ),
                /*재생 버튼*/ Container(
                  padding: const EdgeInsets.all(3),
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                     ScaffoldMessenger.of(context).showSnackBar( SnackBar(duration: const Duration(milliseconds: 1000),content: Text(MyMents.notReadyYet))); // setState(() {
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 3),
                        Icon(Icons.play_arrow, color: Colors.black, size: 22),
                        Text('재생', style: TextStyle(color: Colors.black, fontSize: 13)),
                        SizedBox(width: 3),
                        // SizedBox(width: 3),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: InkWell(
                    onTap: () {
                     ScaffoldMessenger.of(context).showSnackBar( SnackBar(duration: const Duration(milliseconds: 1000),content: Text(MyMents.notReadyYet))); // setState(() {
                    },
                    child: const Column(
                      children: [
                        Icon(Icons.info, color: Colors.white, size: 23),
                        SizedBox(height: 6),
                        Text('정보', style: TextStyle(color: Colors.white, fontSize: 10)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicatorMaker(movies, _imageSliderCurrentPage),
            ),
            const Text('미리보기', style: TextStyle(color: Colors.grey, fontSize: 15)),
            LateralSlideBuilder(items: circlesAndTitleListMaker(movies)),
            const Text('TV+코미디+가슴 뭉클', style: TextStyle(color: Colors.grey, fontSize: 15)),
            LateralSlideBuilder(items: posterListMaker(movies)),
            const Text('지금 뜨는 콘텐츠', style: TextStyle(color: Colors.grey, fontSize: 15)),
            LateralSlideBuilder(items: posterListMaker(movies)),
            const Text('절찬 스트리밍 중+시즌 3', style: TextStyle(color: Colors.grey, fontSize: 15)),
            LateralSlideBuilder(items: posterListMaker(movies)),
          ],
        ),
      ),
    );
  }

  void initMovies() {
    // Bloc cubit 사용해서 상태 Read
    MyAppStateCubit cubit = MyAppStateCubit();
    movies = cubit.state.moviesDummy;

    // Bloc cubit 사용해서 상태 Update
    MyAppState newState = cubit.state;
    cubit.emit(newState);
  }

  void initImageSliderCurrentPage() {
    _imageSliderCurrentPage = 0;
  }

  List<Widget> circlesAndTitleListMaker(List<Movie> movies) {
    List<Widget> lists = [
      for (Movie movie in movies)
        /*미리보기 원형 영화 포스터*/ Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: const Offset(-0, -20),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.amberAccent,
                    // borderRadius: BorderRadius.circular(100),
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(movie.imgUrl, height: 140 + 20),
                ),
              ),
              /*오프셋된 영화 타이틀*/ Transform.translate(
                offset: const Offset(-0, 30),
                child: Text(movie.title, style: const TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
    ];
    return lists;
  }

  List<Widget> posterListMaker(List<Movie> movies) {
    List<Widget> lists = [
      for (Movie movie in movies)
        /* 영화 포스터*/ Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: const Offset(-0, -0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.amberAccent,
                    // borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.network(movie.imgUrl, height: 180),
                ),
              ),
            ],
          ),
        ),
    ];
    return lists;
  }

  List<Widget> titleSliderMaker(List<Movie> movies) {
    String seperator = '    ';
    List<Widget> lists = [
      for (Movie movie in movies) Text(movie.title + seperator, style: const TextStyle(fontSize: 14, color: Colors.white38)),
    ];
    return lists;
  }
}


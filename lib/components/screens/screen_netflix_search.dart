import 'package:flutter/material.dart';

import '../../data/source/remote/netflixx_api_helper.dart';
import '../../main.dart';
import '../../utils/super_helper.dart';

class ScreenNetflixSearch extends StatefulWidget {
  const ScreenNetflixSearch({Key? key}) : super(key: key);

  @override
  State<ScreenNetflixSearch> createState() => _ScreenNetflixSearchState();
}

class _ScreenNetflixSearchState extends State<ScreenNetflixSearch> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String serchText = "";

  late List<Movie> moviesSearched;
  late MyAppStateCubit cubit;

  // _ScreenNetflixSearchState() {
  //위젯상태의 생성자를 이용한 방법
  // _searchController.addListener(() {
  //   setState(() {
  //     serchText = _searchController.text;
  //     printWithoutError('focusNode.hasFocus:${_focusNode.hasFocus}');
  //   });
  // });
  // }

  @override
  void initState() {
    super.initState();
    cubit = MyAppStateCubit();
    moviesSearched = cubit.state.moviesDummy;
    if (serchText.isEmpty) {
      moviesSearched = cubit.state.moviesDummy;
    } else {}
    _searchController.addListener(() {
      setState(() {
        serchText = _searchController.text;
        debugSomething(serchText);
        // printWithoutError('focusNode.hasFocus:${_focusNode.hasFocus}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: const TextStyle(color: Colors.white60, fontSize: 15, height: 1), //height: 1 는 cursor 의 높이를 설정.
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 0, top: 0, left: 0, right: 0),
                    filled: true,
                    fillColor: Colors.white12,
                    prefixIcon: GestureDetector(
                      // onTap: () {},
                      onTap: null,
                      child: const Icon(Icons.search, color: Colors.white60, size: 20),
                    ),
                    suffixIcon: GestureDetector(
                        child: const Icon(Icons.cancel, color: Colors.white60, size: 20),
                        onTap: () {
                          setState(() {
                            _searchController.clear();
                            serchText = "";
                            _focusNode.unfocus();
                          });
                        }),
                    hintText: '검색',
                    hintStyle: const TextStyle(color: Colors.white),
                    labelStyle: const TextStyle(color: Colors.white),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all((Radius.circular(7))),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all((Radius.circular(7))),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all((Radius.circular(7))),
                    ),
                  ),
                ),
              ),
            ),
            if (_searchController.text.isEmpty)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: const BorderRadius.all((Radius.circular(7))),
                  ),
                  // height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    semanticChildCount: 5,
                    children: posterListMaker(moviesSearched),
                  ),
                ),
              ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Container(
                  decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.all((Radius.circular(7))),
              )),
            ),
          ],
        ),
      ),
    );
  }
  /* 영화 포스터 위젯*/
  List<Widget> posterListMaker(List<Movie> movies) {
    List<Widget> lists = [
      for (Movie movie in movies)
      SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Image.asset(movie.imgUrl)
        ),
    ];
    return lists;
  }
}

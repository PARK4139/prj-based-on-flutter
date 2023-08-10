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
  String _serchText = "";
  late List<Movie> moviesSearched;
  late MyAppStateCubit cubit;

  late bool _isShown;

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

    /*Bloc cubit 사용해서 상태 Read*/
    cubit = MyAppStateCubit();
    moviesSearched = cubit.state.moviesDummy;


    _searchController.addListener(() {
      setState(() {
        _serchText = _searchController.text;
        debugSomething(_serchText);
      });
    });
    _isShown = true;
  }

  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _isShown = false;
        } else {
          _isShown = true;
        }
      });
    });
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
                  focusNode: _focusNode,
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
                            _isShown = true;
                            _serchText = "";
                            _searchController.clear();
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
              Container(
                height: MediaQuery.of(context).size.height * 0.36,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: const BorderRadius.all((Radius.circular(7))),
                ),
                width: MediaQuery.of(context).size.width * 0.9,

                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   semanticChildCount: 5,
                //   children: [
                //     for (Movie movie in moviesSearched) SizedBox(width: MediaQuery.of(context).size.width * 0.2, child: Image.network(movie.imgUrl)),
                //   ]
                // ),

                child: GridView(
                  // physics: const NeverScrollableScrollPhysics(), //스크롤바 고정 설정
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 0, mainAxisSpacing: 0),
                  children: [
                    for (Movie movie in moviesSearched) SizedBox(width: 90, child: Image.network(movie.imgUrl, fit: BoxFit.fitWidth)),
                  ],
                ),
              ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            if (_isShown == true)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: const BorderRadius.all((Radius.circular(7))),
                  ),
                ),
              ),
            if (_isShown == true) SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            if (_isShown == true)
              Expanded(
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: const BorderRadius.all((Radius.circular(7))),
                    ),
                  ),
                ),
              ),
            if (_isShown == true) SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          ],
        ),
      ),
    );
  }


}

import 'package:flutter/material.dart';

class ScreenNetflixSearch extends StatefulWidget {
  const ScreenNetflixSearch({Key? key}) : super(key: key);

  @override
  State<ScreenNetflixSearch> createState() => _ScreenNetflixSearchState();
}

class _ScreenNetflixSearchState extends State<ScreenNetflixSearch> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  String _serchText = "";




  _ScreenNetflixSearchState() {
    //상태위젯의 생성자를 이용한 방법
    _searchController.addListener(() {
      setState(() {
        _serchText = _searchController.text;
        print('focusNode.hasFocus:' + _focusNode.hasFocus.toString());
      });
    });
  }




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 60),
                Expanded(
                  flex: 6,
                  child: TextField(
                    // onTap: () {},
                    controller: _searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      prefixIcon: const Icon(Icons.search,
                          color: Colors.white60, size: 20),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.cancel,
                              color: Colors.white60, size: 20),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              _serchText = "";
                            });
                          }),
                      hintText: '검색',
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all((Radius.circular(10))),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all((Radius.circular(10))),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all((Radius.circular(10))),
                      ),
                    ),
                  ),
                ),
                _focusNode.hasFocus
                    ? Expanded(
                  flex: 3,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        _serchText = "";
                        _focusNode.unfocus();
                      });
                    },
                    child: const Text(
                      '취소',
                      style: TextStyle(color: Colors.tealAccent),
                    ),
                  ),
                )
                    : Expanded(
                  flex: 0,
                  child: Container(),
                )
              ],
            )));
  }
}

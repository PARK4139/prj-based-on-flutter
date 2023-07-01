import 'package:flutter/material.dart';

import 'my_data_layer.dart';

// data fetch for beginners
class Screen_webtoon_v1 extends StatefulWidget {
  const Screen_webtoon_v1({Key? key}) : super(key: key);

  @override
  State<Screen_webtoon_v1> createState() => _Screen_webtoon_v1State();
}

class _Screen_webtoon_v1State extends State<Screen_webtoon_v1> {
  List<WebToon> webtoons = [];
  bool isLoading = true;

  void initWebToons() async {
    setState(() async {
      webtoons = await ApiService.getTodaysToons(); //  ApiService.getTodaysToons() 가 async method 이기 때문에 await 를 붙여야 한다
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initWebToons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [for (var webtoon in webtoons) Text(webtoon.thumb)],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [for (var webtoon in webtoons) Text(webtoon.title)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

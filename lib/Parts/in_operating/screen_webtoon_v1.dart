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
      webtoons = await webtoonApiService.getTodaysToons(); //  ApiService.getTodaysToons() 가 async method 이기 때문에 await 를 붙여야 한다
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
      // backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [for (var webtoon in webtoons) Text(webtoon.thumb,style: TextStyle(color: Colors.black),)],
            ),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [for (var webtoon in webtoons) Text(webtoon.title,style: TextStyle(color: Colors.black),)],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import 'my_data_layer.dart';

//data fetch with stateless wiget
class Screen_webtoon_v2 extends StatelessWidget {
  Screen_webtoon_v2({Key? key}) : super(key: key);
  Future<List<WebToon>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                for (var webtoon in snapshot.data!) Text(webtoon.title), //collection for 로 webToon.title 을 가져온다.     개발자가 null이 아님을 확신을 할 때 !를 붙여줄 수 있다...
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

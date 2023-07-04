import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_netflix_util.dart';

import 'my_data_layer.dart';

 
class Screen_webtoon_detail extends StatefulWidget {
  String item_id;

  Screen_webtoon_detail({Key? key, required this.item_id}) : super(key: key);

  @override
  State<Screen_webtoon_detail> createState() => _Screen_webtoon_detailState();
}

class _Screen_webtoon_detailState extends State<Screen_webtoon_detail> {

  // Future<List<WebToon>> webtoons = webtoonApiService.getTodaysToons();  //이거말고 에피소드 webtoonDetailApiService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Row(
          children: [
            SizedBox(width: 85),
            Text(
              "오늘의 웹툰",
              style: TextStyle(color: Colors.green, fontSize: 16)
            ),
          ],
        )),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(widget.item_id)),
        ],
      ),
    );
  }
}

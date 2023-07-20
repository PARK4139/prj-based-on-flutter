import 'package:flutter/material.dart';

 
class ScreenWebtoonDetail extends StatefulWidget {
  String itemId;

  ScreenWebtoonDetail({Key? key, required this.itemId}) : super(key: key);

  @override
  State<ScreenWebtoonDetail> createState() => _ScreenWebtoonDetailState();
}

class _ScreenWebtoonDetailState extends State<ScreenWebtoonDetail> {

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
              "오늘도 웹툰",
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
          Center(child: Text(widget.itemId)),
        ],
      ),
    );
  }
}

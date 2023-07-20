import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/screens/screen_netflix_util.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/screens/screen_webtoon_detail.dart';

import '../data_layer/my_data_layer.dart';

class ScreenWebtoon extends StatefulWidget {
  const ScreenWebtoon({Key? key}) : super(key: key);

  @override
  State<ScreenWebtoon> createState() => _ScreenWebtoonState();
}

class _ScreenWebtoonState extends State<ScreenWebtoon> {
  Future<List<Webtoon>> webtoons = webtoonApiService.getTodaysToons();

  int _imageSliderCurrentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Center(
            child: Row(
          children: [
            SizedBox(width: 85),
            Text("오늘도 웹툰", style: TextStyle(color: Colors.green, fontSize: 16)),
          ],
        )),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          /*이미지*/ SizedBox(
            height: 600,
            child: FutureBuilder(
              future: webtoons,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CarouselSlider(
                    items: [
                      for (Webtoon webtoon in snapshot.data!)
                        Column(
                          children: [
                            /*메인 포스터 버튼*/ GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenWebtoonDetail(itemId: webtoon.id)));
                              },
                              child: Transform.translate(
                                offset: const Offset(0, 50),
                                child: Transform.scale(
                                  scale: 1.7,
                                  // child: Container(height: 30 * 4, width: 30 * 3, child: Image.network(webtoon.thumb, fit: BoxFit.fitWidth)),
                                  child: SizedBox(height: 30 * 4, width: 30 * 3, child: Image.asset('asset/images/app_webtoon_logo.jpg')),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0,  20+20+20+20+20+20 ),
                              child: Text(
                                webtoon.title,
                                style: const TextStyle(color: Colors.black54   , fontSize: 20),
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
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

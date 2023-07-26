import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/screens/screen_netflix_util.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/screens/screen_webtoon_detail.dart';

import '../helpers/api_helper.dart';

class ScreenPracticeApiConnection2 extends StatefulWidget {
  const ScreenPracticeApiConnection2({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeApiConnection2> createState() => _ScreenPracticeApiConnection2State();
}

class _ScreenPracticeApiConnection2State extends State<ScreenPracticeApiConnection2> {
  Future<List<Webtoon>> webtoons = WebtoonApiService.getTodaysToons();

  int imageSliderCurrentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenWebtoonDetail(webtoon: webtoon)));
                          },
                          child: Column(
                            children: [
                              /*포스터 섬네일*/ Transform.translate(
                                offset: const Offset(0, 50),
                                child: Transform.scale(
                                  scale: 1.7,
                                  child: SizedBox(height: 30 * 4, width: 30 * 3, child: Image.network(webtoon.thumb, fit: BoxFit.fitWidth)),
                                ),
                              ),
                              /*포스터 제목*/ Transform.translate(offset: const Offset(0, 20 + 20 + 20 + 20 + 20 + 20), child: Text(webtoon.title, style: const TextStyle(color: Colors.black54, fontSize: 20))),
                            ],
                          ),
                        ),
                    ],
                    activeIndex: 0,
                    autoplay: true,
                    viewportFraction: 0.8,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index) {
                      setState(
                        () {
                          imageSliderCurrentPage = index;
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prj_app_mvp/components/screens/screen_netflix_util.dart';
import 'package:prj_app_mvp/components/screens/screen_webtoon_detail.dart';

import '../../data/source/remote/webtoon_api_helper.dart';
import '../../utils/super_helper.dart';

class ScreenWebtoonAPI2 extends StatefulWidget {
  const ScreenWebtoonAPI2({Key? key}) : super(key: key);

  @override
  State<ScreenWebtoonAPI2> createState() => _ScreenWebtoonAPI2State();
}

class _ScreenWebtoonAPI2State extends State<ScreenWebtoonAPI2> {
  Future<List<Webtoon>> webtoons = WebtoonApiService.getTodaysToons();

  int imageSliderCurrentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 30),
          SizedBox(
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
                          child: Builder(builder: (context) {
                            debugSomething(MyUrls.networkImageTest,troubleShootingId: "20230811183916");

                            return Column(
                              children: [
                                /*포스터 섬네일*/ Transform.translate(
                                  offset: const Offset(0, 50),
                                  child: Transform.scale(
                                    scale: 1.7,
                                    child: SizedBox(
                                      height: 30 * 4,
                                      width: 30 * 3,
                                      // child:CachedNetworkImage(
                                      //   placeholder: (context, url) => const CircularProgressIndicator(),
                                      //   imageUrl: MyUrls.testImageOfFlutterOfiicial,
                                      // ),
                                    child: Image.network(MyUrls.networkImageTest,
                                          errorBuilder: (context, error, stackTrace) => Text(
                                                '$context\n'
                                                // '${error}\n'
                                                // '${stackTrace}',
                                                '',
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 10,
                                                ),
                                              ),
                                          fit: BoxFit.fitHeight),
                                      //   child:  ExtendedImage.network(MyUrls.testImageOfFlutterOfiicial,  cache: true,fit: BoxFit.fitWidth),
                                    // child:  ExtendedImage.network(MyUrls.testImageOfFlutterOfiicial,  cache: true,fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                ),
                                /*포스터 제목*/ Transform.translate(offset: const Offset(0, 20 + 20 + 20 + 20 + 20 + 20), child: Text(webtoon.title, style: const TextStyle(color: Colors.black54, fontSize: 20))),
                              ],
                            );
                          }),
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

import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/api_helper.dart';


class ScreenWebtoonDetail extends StatefulWidget {
  Webtoon webtoon;

  ScreenWebtoonDetail({Key? key, required this.webtoon}) : super(key: key);

  @override
  State<ScreenWebtoonDetail> createState() => _ScreenWebtoonDetailState();
}

class _ScreenWebtoonDetailState extends State<ScreenWebtoonDetail> {

  // Future<List<WebToon>> webtoons = webtoonApiService.getTodaysToons();  //이거말고 에피소드 webtoonDetailApiService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Center(
            child: Row(
          children: [
            const SizedBox(width: 85),
            Text(
                widget.webtoon.id,
              style: const TextStyle(color: Colors.green, fontSize: 16)
            ),
          ],
        )),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*사진컨테이너*/
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
                height: 300,
                width: 200,
                child: Image.asset(widget.webtoon.thumb, fit: BoxFit.cover)),
          ),
          // /*사진컨테이너*/ Center(
          //   child: Container(
          //     height: 300,
          //     width: 200,
          //     decoration:   BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage(widget.webtoon.thumb),
          //         fit: BoxFit.cover,
          //         // fit: BoxFit.contain,
          //         // fit: BoxFit.fitHeight,
          //         // fit: BoxFit.fill,
          //         // fit: BoxFit.none,
          //         // fit: BoxFit.scaleDown, //scaleDown 이 마음에 든다 //디지털 액자에도 이걸 적용하면 될것 같음
          //       ),
          //     ),
          //   ),
          // ),
          Center(child: Text(widget.webtoon.title)),
        ],
      ),
    );
  }
}

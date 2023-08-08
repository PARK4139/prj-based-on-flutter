import 'package:flutter/material.dart';

import '../../data/source/remote/webtoon_api_helper.dart';
import '../../utils/super_helper.dart';



class ScreenWebtoonDetail extends StatefulWidget {

  Webtoon webtoon;

  ScreenWebtoonDetail({Key? key, required this.webtoon}) : super(key: key);

  @override
  State<ScreenWebtoonDetail> createState() => _ScreenWebtoonDetailState();
}

class _ScreenWebtoonDetailState extends State<ScreenWebtoonDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*사진컨테이너*/
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SizedBox(
                height: 300,
                width: 200,
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
                    fit: BoxFit.cover),
              ),
            ),
            Center(child: Text(widget.webtoon.title)),
          ],
        ),
      ),
    );
  }
}

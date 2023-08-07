import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';

class ScreenImageNetworkTest extends StatefulWidget {
  const ScreenImageNetworkTest({Key? key}) : super(key: key);

  @override
  State<ScreenImageNetworkTest> createState() => _ScreenImageNetworkTestState();
}

// 첫 이미지 로딩은 속도 유사함
// 첫 로딩 이후 속도 순서:  Image.asset Image < CachedNetworkImage = ExtenedImage <  Image.network < FadeImage

class _ScreenImageNetworkTestState extends State<ScreenImageNetworkTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/sample.gif', width: 150),
            Image.network('https://i.pinimg.com/originals/e9/73/0a/e9730ab2e35d7ec8ac7e432099b5e6d9.gif', width: 150),
            FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: 'https://i.pinimg.com/originals/e9/73/0a/e9730ab2e35d7ec8ac7e432099b5e6d9.gif', width: 150),
            CachedNetworkImage(imageUrl: "https://i.pinimg.com/originals/e9/73/0a/e9730ab2e35d7ec8ac7e432099b5e6d9.gif", placeholder: (context, url) => const CircularProgressIndicator(), errorWidget: (context, url, error) => const Icon(Icons.error), width: 150),
            ExtendedImage.network("https://i.pinimg.com/originals/e9/73/0a/e9730ab2e35d7ec8ac7e432099b5e6d9.gif", width: 150, cache: true)
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:transparent_image/transparent_image.dart';

// import 'package:file/file.dart';
// import 'package:file/local.dart';
// import 'package:flutter_cache_manager/src/storage/file_system/file_system.dart' as c;
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';
class ScreenFileNetworkTest extends StatefulWidget {
  const ScreenFileNetworkTest({Key? key}) : super(key: key);

  @override
  State<ScreenFileNetworkTest> createState() => _ScreenFileNetworkTestState();
}

class _ScreenFileNetworkTestState extends State<ScreenFileNetworkTest> {
  @override
  Widget build(BuildContext context) {

    //파일을 캐시저장소내에 file202308220024로 저장
    String fileURL = "";
    DefaultCacheManager().getSingleFile(fileURL, key: 'file202308220024');



    //캐시저장소내 file202308220024의 파일경로 를 filePath에 저장
    var pathOfFile202308220024;
    DefaultCacheManager().getFileFromCache('file202308220024').then((cacheLocate) {
      pathOfFile202308220024 = cacheLocate;     //cacheLocate == 캐시저장소내 file202308220024의 파일경로
    });


    // 이렇게 여러번 불러드릴 데이터는 캐시저장소를 거쳐서 사용하면 서버리소스 사용을 줄일 수 있다. 경제/속도면에서도 빠르다.
    // AudioPlayer player = AudioPlayer();
    // player.setFilePath(pathOfFile202308220024);
    // player.play();
















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

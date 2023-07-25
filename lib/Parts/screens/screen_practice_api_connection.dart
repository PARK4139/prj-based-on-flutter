import 'package:flutter/material.dart';

import '../helpers/api_helper.dart';

// data fetch for beginners
class ScreenPracticeApiConnection extends StatefulWidget {
  const ScreenPracticeApiConnection({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeApiConnection> createState() => _ScreenPracticeApiConnectionState();
}

class _ScreenPracticeApiConnectionState extends State<ScreenPracticeApiConnection> {
  List<Webtoon> webtoons = [];
  bool isLoading = true;

  void initWebToons() async {
    setState(() async {
      webtoons = await WebtoonApiService.getTodaysToons(); //  ApiService.getTodaysToons() 가 async method 이기 때문에 await 를 붙여야 한다
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    // ScaffoldMessenger.of(context).showSnackBar();
    // SnackBar(content: Text("웹툰 정보를 가져오는 중입니다. 잠시만 기다려 주세요."));
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("웹툰 정보를 가져오는 중입니다. 잠시만 기다려 주세요.")));
    // ScaffoldMessenger 는 Scaffold() 내에서 사용을 제안(보장)하며, showSnackBar() 는 build() 블록 내에 사용할 수 없다

    initWebToons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
        leading: /*뒤로가기 버튼*/ InkWell(
          child: const Icon(Icons.chevron_left, color: Colors.green),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        height: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var webtoon in webtoons) Text(webtoon.thumb, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var webtoon in webtoons) Text(webtoon.title, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

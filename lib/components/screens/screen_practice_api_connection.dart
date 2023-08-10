import 'package:flutter/material.dart';

import '../../data/source/remote/webtoon_api_helper.dart';
import '../../utils/super_helper.dart';


// data fetch for beginners
class ScreenWebtoonAPI extends StatefulWidget {
  const ScreenWebtoonAPI({Key? key}) : super(key: key);

  @override
  State<ScreenWebtoonAPI> createState() => _ScreenWebtoonAPIState();
}

class _ScreenWebtoonAPIState extends State<ScreenWebtoonAPI> {
  List<Webtoon> webtoons = [];
  bool isLoading = true;

  void initWebToons() async {
      webtoons = await WebtoonApiService.getTodaysToons(); //  ApiService.getTodaysToons() 가 async method 이기 때문에 await 를 붙여야 한다
      setState(() {
        isLoading = false;
      });
  }

  @override
  void initState() {
    super.initState();


    initWebToons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Builder(
          builder: (context) {
            /*ScaffoldMessenger 는 Scaffold() 내에서 사용을 제안(보장)하며, showSnackBar() 는 build() 블록 내에 사용할 수 없다*/
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 2000), content: Text("API를 통해 정보를 가져오는 중입니다. 잠시만 기다려 주세요.")));
            return const Text('');
          }
        ),
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
                  for (var webtoon in webtoons) Text(MyUrls.networkImageTest, style: const TextStyle(color: Colors.white)),
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

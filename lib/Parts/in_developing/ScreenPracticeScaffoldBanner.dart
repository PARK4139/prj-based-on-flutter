import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/screen_index_colorful.dart';

class ScreenPracticeScaffoldBanner extends StatelessWidget {
  const ScreenPracticeScaffoldBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("배너 버튼"),
          onPressed: () {
            ScaffoldMessenger.of(context).showMaterialBanner(
              const MaterialBanner(
                content: Text('이것은 배너 입니다. 첫 번째 페이지로 이동 합니다.'),
                actions: [
                  TextButton(
                    onPressed: null,
                    child: Text('확인'),
                  ),
                ],
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   ScreenIndexColorful(isDarkMode: true)),
            );
          },
        ),
      ),
    );
  }
}
import 'dart:math';

import 'package:flutter/material.dart';

class ScreenFutureBuilder extends StatefulWidget {
  const ScreenFutureBuilder({Key? key}) : super(key: key);

  @override
  _ScreenFutureBuilderState createState() => _ScreenFutureBuilderState();
}

class _ScreenFutureBuilderState extends State<ScreenFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<int>(
          future: getFutureNumber(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            // FutureBuilder의 snapshot.data 는 최초에 null 인데. 유용한 cashing 기능이 있다!,
            //  setState()가 첫번째 작동 이후로는 로딩 중에 값은 null이 아닌 이전에 불러드린 값이 casing 되어 가져와진다.
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: SizedBox(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        snapshot.hasData
                            ? Container()
                            : const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.red,
                                backgroundColor: Colors.grey,
                              ),
                        Text(
                          'FutureBuilder',
                          style: textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Text('ConState : ${snapshot.connectionState}', style: textStyle),
                Text('Data : ${snapshot.hasData ? snapshot.data : "loading..."}', style: textStyle),
                Text('Error : ${snapshot.error}', style: textStyle),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('setState'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<int> getFutureNumber() async {
    await Future.delayed(Duration(seconds: 3));
     // throw Exception('디버깅을 위해 의도적인 에러가 발생했습니다.');의도적 에러 발생하는 방법, debug 에 넣어서 호출하여 사용하자.
    return Random().nextInt(100);
  }
}

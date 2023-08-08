

import 'package:flutter/material.dart';

class ScreenStreamBuilder extends StatefulWidget {
  const ScreenStreamBuilder({Key? key}) : super(key: key);

  @override
  _ScreenStreamBuilderState createState() => _ScreenStreamBuilderState();
}

class _ScreenStreamBuilderState extends State<ScreenStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<int>(
          stream: getStreamNumbers(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'StreamBuilder',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'ConState : ${snapshot.connectionState}',
                  style: textStyle,
                ),
                Text(
                  'Data : ${snapshot.data}',
                  style: textStyle,
                ),
                Text(
                  'Error : ${snapshot.error}',
                  style: textStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text('setState'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Stream<int> getStreamNumbers() async* {
    for(int i = 0 ; i < 100; i ++){
      if(i == 60){
        throw Exception('i == 60');
      }
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
}
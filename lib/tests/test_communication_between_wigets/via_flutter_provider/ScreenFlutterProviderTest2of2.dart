import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';

import 'ScreenFlutterProviderTest1of2.dart';

class Taker extends StatelessWidget {
  const Taker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer3<FooMaker, FooMaker2, FooMaker3>(
        builder: (BuildContext context, FooMaker a, FooMaker2 b, FooMaker3 c) {
          return Container(
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(a.getGreetingMent()),
                Text(b.getGreetingMent()),
                Text(c.getGreetingMent()),
              ],
            ),
          );
        },
      ),
    );
  }
}

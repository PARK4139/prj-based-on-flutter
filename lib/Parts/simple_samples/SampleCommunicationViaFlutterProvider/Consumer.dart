import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';

import 'Provider.dart';

class ScreenConsuming extends StatelessWidget {
  const ScreenConsuming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<MyProvider1, MyProvider2>(
        builder: (BuildContext context, MyProvider1 a, MyProvider2 b) {
          return Container(
            constraints: const BoxConstraints.expand(),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(a.greet1()),
                  Text(b.greet2()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

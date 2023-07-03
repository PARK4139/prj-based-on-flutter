
import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';

import 'Consumer.dart';

class MyProvider1 {
  String greet1() => 'Hello';

  void dispose() => print('$this::dispose');
}

class MyProvider2 {
  MyProvider2() {
    print('$this::init');
  }

  String greet2() => 'Hello everyone';

  void dispose() => print('$this::dispose');
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const ScreenProviding(),
    );
  }
}

class ScreenProviding extends StatelessWidget {
  const ScreenProviding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('GO TO HOME'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) {
                final foo = MyProvider1();
                final bar1 = MyProvider2();

                return Providers(
                  providers: [
                    Provider<MyProvider2>.value(
                      bar1,
                      disposer: (v) => v.dispose(),
                    ),
                  ],
                  child: Provider<MyProvider1>.value(
                    foo,
                    disposer: (v) => v.dispose(),
                    child: const ScreenConsuming(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

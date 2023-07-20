// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';

import '../../helpers/super_helper.dart';

class Foo {
  Foo() {}

  String foo() => 'Hello';

  void dispose() => printWithoutErrorOrPrintWithError('$this::dispose');
}

class Bar1 {
  Bar1() {}

  String bar1() => 'Hello everyone';

  void dispose() => printWithoutErrorOrPrintWithError('$this::dispose');
}

class Bar2 {
  Bar2() {}

  String bar2() => 'Fall in love with Flutter';

  void dispose() => printWithoutErrorOrPrintWithError('$this::dispose');
}

class ProvidingPage extends StatelessWidget {
  const ProvidingPage({Key? key}) : super(key: key);

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
                final foo = Foo();
                final bar1 = Bar1();
                return Providers(
                  providers: [
                    Provider<Bar1>.value(
                      bar1,
                      disposer: (v) => v.dispose(),
                    ),
                    Provider<Bar2>.factory(
                      (context) => Bar2(),
                      disposer: (v) => v.dispose(),
                    ),
                  ],
                  child: Provider<Foo>.value(
                    foo,
                    disposer: (v) => v.dispose(),
                    child: const ConsumingPage(),
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

class ConsumingPage extends StatelessWidget {
  const ConsumingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer3<Foo, Bar1, Bar2>(
        builder: (BuildContext context, Foo a, Bar1 b, Bar2 c) {
          return Container(
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(a.foo()),
                Text(b.bar1()),
                Text(c.bar2()),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';

import '../../helpers/super_helper.dart';
import 'taker.dart';


class FooMaker {
  FooMaker();

  String getGreetingMent() => 'Hello';

  void dispose() => printWithoutError('$this::dispose');
}

class FooMaker2 {
  FooMaker2();

  String getGreetingMent() => 'Hello everyone';

  void dispose() => printWithoutError('$this::dispose');
}

class FooMaker3 {
  FooMaker3();

  String getGreetingMent() => 'Fall in love with Flutter';

  void dispose() => printWithoutError('$this::dispose');
}

class Sender extends StatelessWidget {
  const Sender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('통신?'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) {
                final fooMaker = FooMaker();
                final fooMaker2 = FooMaker2();
                return Providers(
                  providers: [
                    Provider<FooMaker2>.value(
                      fooMaker2,
                      disposer: (v) => v.dispose(),
                    ),
                    Provider<FooMaker3>.factory(
                      (context) => FooMaker3(),
                      disposer: (v) => v.dispose(),
                    ),
                  ],
                  child: Provider<FooMaker>.value(
                    fooMaker,
                    disposer: (v) => v.dispose(),
                    child: const Taker(),
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

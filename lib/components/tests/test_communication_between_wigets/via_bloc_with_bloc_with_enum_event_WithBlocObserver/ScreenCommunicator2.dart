import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'WigetTreeCommunicationHelper.dart';


void main() {
  // Bloc.observer = CounterObserver();//BlocObserver를 사용위한 코드, flutter_bloc 사용을 위한 필수코드는 아님
  runApp(const ScreenCommunicator2());
}


class ScreenCommunicator2 extends StatelessWidget {
  const ScreenCommunicator2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  /*BloC 구현 컨테이너*/BlocProvider(
        create: (context) => CounterBloc(),
        child: const ScreenStateTakerSub(),
      ),
    );
  }
}

class ScreenStateTakerSub extends StatelessWidget {
  const ScreenStateTakerSub({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                /*상태데이터 가져와서 화면 뿌리기 */
                BlocBuilder<CounterBloc, int>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Text('int : $state'),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

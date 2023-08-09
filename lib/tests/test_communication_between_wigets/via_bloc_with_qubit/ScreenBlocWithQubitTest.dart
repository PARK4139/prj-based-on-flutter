import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




void main() {
  // Bloc.observer = CounterObserver();//BlocObserver를 사용위한 코드, flutter_bloc 사용을 위한 필수코드는 아님
  runApp(App());
}

/*bloc 을 사용하는데 있어 cubit 을 사용하는 방법*/
// 상태관리에 이 방법이 가장 마음에 든다.
// 한동안 더 기능이 필요하기 전까지는 이것만 쓸 것 같다.


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: /*BloC 구현 컨테이너*/ BlocProvider(
        create: (context) => ScreenBlocWithQubitTestCubit(),
        child: ScreenBlocWithQubitTest(),
      ),
    );
  }
}


class ScreenBlocWithQubitTest extends StatelessWidget {
  ScreenBlocWithQubitTest({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();

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
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'name'),
                ),
                TextFormField(
                  controller: countryController,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    /*상태데이터 저장*/
                    BlocProvider.of<ScreenBlocWithQubitTestCubit>(context).saveScreenState(
                      name: nameController.text,
                      country: countryController.text,
                    );
                  },
                  child: const Text('상태데이터 저장'),
                ),
                ElevatedButton(
                  onPressed: () {
                    /*상태데이터 업데이트 비지니스 로직 수행*/
                    BlocProvider.of<ScreenBlocWithQubitTestCubit>(context).increaseScreenStateCount();
                  },
                  child: const Text('.increaseCount() 비지니스 로직 수행'),
                ),
                ElevatedButton(
                  onPressed: () {
                    /*상태데이터 업데이트 비지니스 로직 수행*/
                    BlocProvider.of<ScreenBlocWithQubitTestCubit>(context).resetScreenState();
                  },
                  child: const Text('.resetScreenState() 비지니스 로직 수행'),
                ),

                /*상태데이터 가져오기 *///이제 다른 wiget 에서도 상태를 손 쉽게 가져올 수 있어!
                BlocBuilder<ScreenBlocWithQubitTestCubit, ScreenState>(
                  builder: (context, ScreenState screenState) {
                    return Column(
                      children: [
                        Text('name : ${screenState.name}'),
                        Text('count : ${screenState.count}'),
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


// State
class ScreenState {
  final String name;
  final int count;

  ScreenState({this.name = '', this.count = 0});
}

// Cubit
class ScreenBlocWithQubitTestCubit extends Cubit<ScreenState> {
  ScreenBlocWithQubitTestCubit() : super(ScreenState());

  void saveScreenState({required String name, required String country}) {
    final ScreenState cityState = ScreenState(name: name);
    emit(cityState);
  }

  void increaseScreenStateCount() {
    final currentState = state;
    final newState = ScreenState(name: currentState.name, count: currentState.count + 1);
    emit(newState);
  }

  void resetScreenState() {
    // final currentState = state;
    final newState = ScreenState(name: "", count: 0);
    emit(newState);
  }
}


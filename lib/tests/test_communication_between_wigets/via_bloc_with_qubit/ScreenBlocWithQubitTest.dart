import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';

/* bloc 을 사용하는데 있어 cubit 을 사용하는 방법*/
// 상태관리에 이 방법이 가장 마음에 든다.
// 한동안 고급 부가 기능이 필요하기 전까지는 이것만 쓸 것 같다.
// 현 테스트에서는 BlocProvider() 를 위젯트리에서 두번째 사용했다, 위젯트리의 상단에는 App 근처에서 적용했다.

void main() {
  // Bloc.observer = CounterObserver();//BlocObserver를 사용위한 코드, ㅍ수코드는 아님
  runApp(ScreenBlocWithQubitTest());
}

class ScreenBlocWithQubitTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: /*BloC 구현 컨테이너*/ BlocProvider(
        create: (context) => ScreenBlocWithQubitTestCubit(),
        child: ScreenBlocWithQubitTestSub(),
      ),
    );
  }
}

class ScreenBlocWithQubitTestSub extends StatelessWidget {
  ScreenBlocWithQubitTestSub({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child:  SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.height * 0.6,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'name'),
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
                      child: const Text('name 저장'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        /*상태데이터 업데이트*/
                        BlocProvider.of<ScreenBlocWithQubitTestCubit>(context).increaseScreenStateCount();
                      },
                      child: const Text('.increaseCount()'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        /*상태데이터 업데이트*/
                        BlocProvider.of<ScreenBlocWithQubitTestCubit>(context).resetScreenState();
                      },
                      child: const Text('.resetScreenState()'),
                    ),

                    /*상태데이터 가져오기 */ //이제 다른 wiget 에서도 상태를 손 쉽게 가져올 수 있어!
                    BlocBuilder<ScreenBlocWithQubitTestCubit, ScreenState>(
                      builder: (context, ScreenState screenState) {
                        return Column(
                          children: [
                            Text('name : ${screenState.name}'),
                            screenState.count == 0 ? const Text('count : ') : Text('count : ${screenState.count}'),
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

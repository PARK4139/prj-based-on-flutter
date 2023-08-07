import 'package:flutter_bloc/flutter_bloc.dart';

//CounterEvent
enum CounterEvent { increment, decrement, reset }

//CounterBloc
class CounterBloc extends Bloc<CounterEvent, int> {
  // 초기값 설정
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    // 이벤트에 따라 상태 변화를 시켜준 뒤 리턴해준다
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.reset:
        yield 0;
        break;
    }
  }
}

//Observer
//CounterObserver
// 나중에 하자
// 일단 flutter_bloc을 통한 event 에 따른 데이터 변화를 observe 할 수 있는 class 라고만 알자
// class CounterObserver extends BlocObserver {
//   @override
//   void onCreate(Cubit cubit) {
//     super.onCreate(cubit);
//     print('onCreate -- cubit: ${cubit.runtimeType}');
//   }
//
//   @override
//   void onChange(Cubit cubit, Change change) {
//     super.onChange(cubit, change);
//     print('onChange -- cubit: ${cubit.runtimeType}, change: $change');
//   }
//
//   @override
//   void onError(Cubit cubit, Object error, StackTrace stackTrace) {
//     print('onError -- cubit: ${cubit.runtimeType}, error: $error');
//     super.onError(cubit, error, stackTrace);
//   }
//
//   @override
//   void onClose(Cubit cubit) {
//     super.onClose(cubit);
//     print('onClose -- cubit: ${cubit.runtimeType}');
//   }
// }

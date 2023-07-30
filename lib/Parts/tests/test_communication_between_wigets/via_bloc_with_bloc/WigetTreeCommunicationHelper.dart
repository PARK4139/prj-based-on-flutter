import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

//ScreenState
class ScreenState {
  final String name;
  final String country;

  ScreenState({this.name = '', this.country= ''});
}

//ScreenEvent
abstract class ScreenEvent {}

class CreateScreenEvent extends ScreenEvent {
  final String name;
  final String age;
  CreateScreenEvent({required this.name, required this.age});
}

//ScreenBloc
class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc() : super(ScreenState()) {

    //이벤트 리스너
    on<CreateScreenEvent>(generateScreen);
    // on<CreateScreenEvent>(generateScreen,  transformer: debounce(const Duration(milliseconds: 300)));
  }

  // 이벤트 리스너 구현부
  FutureOr<void> generateScreen(CreateScreenEvent event, Emitter<ScreenState> emit) {
    final ScreenState city = ScreenState(name: event.name, country: event.age);
    emit(city);
  }

  // EventTransformer<T> debounce<T>(Duration duration) {
  //   return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  // }
}

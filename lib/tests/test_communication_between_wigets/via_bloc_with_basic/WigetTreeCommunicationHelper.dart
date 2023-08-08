import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

//UserFormInputScreenState
class UserFormInputScreenState {
  final String name;
  final int age;

  UserFormInputScreenState({this.name = '', this.age=0});
}

//UserFormInputScreenEvent
abstract class UserFormInputScreenEvent {}

class CreateUserFormInputScreenEvent extends UserFormInputScreenEvent {
  final String name;
  final String age;
  CreateUserFormInputScreenEvent({required this.name, required this.age});
}

//UserFormInputScreenBloc
class UserFormInputScreenBloc extends Bloc<UserFormInputScreenEvent, UserFormInputScreenState> {
  UserFormInputScreenBloc() : super(UserFormInputScreenState()) {

    //이벤트 리스너
    on<CreateUserFormInputScreenEvent>(createUserFormInputScreen);
  }

  // 이벤트 리스너 구현부
  FutureOr<void> createUserFormInputScreen(CreateUserFormInputScreenEvent event, Emitter<UserFormInputScreenState> emit) {
    final UserFormInputScreenState user = UserFormInputScreenState(name: event.name, age: int.tryParse(event.age) ?? 0);
    emit(user);
  }
}

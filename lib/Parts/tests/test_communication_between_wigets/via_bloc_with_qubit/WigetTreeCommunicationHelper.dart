import 'package:flutter_bloc/flutter_bloc.dart';

//ScreenState
class ScreenState {
  final String name;
  final String country;
  final int count;

  ScreenState({this.name = '', this.country = '', this.count = 0});
}

//ScreenCubit
class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenState());

  void generateScreenState({required String name, required String country}) {
    final ScreenState cityState = ScreenState(name: name, country: country);
    emit(cityState);
  }

  void increaseCount() {
    final currentState = state;
    final newState = ScreenState(country: currentState.country, name: currentState.name, count: currentState.count + 1);
    emit(newState);
  }

  void resetScreenState() {
    // final currentState = state;
    final newState = ScreenState(country: "", name: "", count: 0);
    emit(newState);
  }
}

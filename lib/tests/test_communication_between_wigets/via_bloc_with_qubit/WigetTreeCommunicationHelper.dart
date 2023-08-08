import 'package:flutter_bloc/flutter_bloc.dart';

// State
class ScreenState {
  final String name;
  final String country;
  final int count;

  ScreenState({this.name = '', this.country = '', this.count = 0});
}

// Cubit
class ScreenCommunicatorCubit extends Cubit<ScreenState> {
  ScreenCommunicatorCubit() : super(ScreenState());

  void saveScreenState({required String name, required String country}) {
    final ScreenState cityState = ScreenState(name: name, country: country);
    emit(cityState);
  }

  void increaseScreenStateCount() {
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

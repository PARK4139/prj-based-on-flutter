import 'package:flutter/material.dart';

class Sender with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count++;
    notifyListeners(); //notifyListeners 함수를 실행하지 않으면, 다른 위젯들에서 해당 값이 변경되었는지 인식하지 못합니다.
  }

  void remove() {
    _count--;
    notifyListeners(); //notifyListeners 함수를 실행하지 않으면, 다른 위젯들에서 해당 값이 변경되었는지 인식하지 못합니다.
  }
}

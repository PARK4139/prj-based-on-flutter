import 'package:flutter/material.dart';

class ScreenChangeNotifierTest1of2 with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
    //notifyListeners() 를 수행함으로서 해당메소드를 통해 데이터가 update 되었다는 정보를 전달하는 역할,notifyListeners 함수를 실행하지 않으면, 다른 위젯들에서 해당 값이 변경되었는지 인식하지 못합니다.
  }

  void remove() {
    _count--;
    notifyListeners();
  }
}
// 이 테스트도 아주 약간 유의미 해보임...위젯트리 상태관리 라이브러리를 공부하는 것이 효율적일 것 같다.
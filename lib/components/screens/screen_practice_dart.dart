import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../utils/super_helper.dart';



class ScreenUndefined0000 extends StatefulWidget {
  const ScreenUndefined0000({super.key});

  @override
  State<ScreenUndefined0000> createState() => _ScreenUndefined0000State();
}

class _ScreenUndefined0000State extends State<ScreenUndefined0000> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /*커스텀 앱바*/ Container(
            color: Colors.black87,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                /*뒤로가기 버튼*/ InkWell(
                  child: const Icon(Icons.chevron_left, size: 40, color: Colors.redAccent),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Center(
            child: InkWell(
              child: const Column(
                children: [
                  Icon(Icons.question_mark),
                  Text("______________________________"),
                ],
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class FooFoo {
  // const vs final
  // 재초기화 제한 기능.

  final DateTime now_ = DateTime.now();

  List<int> integers = [1, 2, 3]; //int list

  List<String> strings = ['1', '2', '3']; //String list

  String foo(String foo, String foofoo) => ' $foo $foofoo '; //positional arguments

  String foo2({required String foo, required String foofoo}) => ' $foo $foofoo '; //named arguments

  String foo3(String foo, String foofoo, [String? foofoofoo = 'foo']) => ' $foo $foofoo ${foofoofoo!}'; //optional arguments

  String? dataTypePrinter(String? foo) {
    if (foo is String) {
      printWithoutError('$foo\'s data type : String');
    } else if (foo is int) {
      printWithoutError('$foo\'s data type : int');
    } else if (foo is double) {
      printWithoutError('$foo\'s data type : double');
    } else if (foo is List<String>) {
      printWithoutError('$foo\'s data type : List<String>');
    } else if (foo is List<int>) {
      printWithoutError('$foo\'s data type : List<int>');
    }
    return foo;
  }

  String? think(dynamic foo) {
    if (foo! is! String) {
      printWithoutError('$foo\'s data type : String');
    } else if (foo == null) {
      foo ??= 'it was null'; //foo 가 null 이면 'it was null' 로서 초기화.
      printWithoutError('$foo');
    }
    return foo;
  }

  List<String> reverseListMaker(List<String> list) => list.reversed.toList();

  String printMapInfo(Map<String, String> info) => '${info['name']}\n${info['age']}\n${info['address']}';
}

class ChattingRoomMember {
  //class 의 property. 즉, field 는 var 를 사용할 수 없다. explict vairable 을 사용해야한다.
  String name = 'foo';
  int lv = 1;
  int xp = 1500;
  int mp = 1000;
  int hp = 1000;
  int exp = 1000;
  int age = 0;
  String address = 'foo';
  String job = '';
  String loginAccoundUserId;
  String loginAccoundUserPw;
  String loginOk;

  // all args constructor method
  ChattingRoomMember({
    required this.name,
    required this.lv,
    required this.xp,
    required this.mp,
    required this.hp,
    required this.exp,
    required this.age,
    required this.address,
    required this.loginAccoundUserId,
    required this.job,
    required this.loginAccoundUserPw,
    required this.loginOk,
  }) {
    login(loginAccoundUserId: loginAccoundUserId, loginAccoundUserPw: loginAccoundUserPw);
  }

  //
  // ChattingRoomMember.create_worrior_player({
  //     required this.name,
  //     required this.age
  // }):
  //     this.name = name,
  //     this.age  =  age,
  //     this.job='worrior',
  //     this.xp=100,
  //     this.hp=4000;
  //
  // ChattingRoomMember.create_magitian_player({
  //   required this.name, required this.age
  // }) :
  //     this.name = name,
  //     this.age=age,
  //     this.job='magitian',
  //     this.xp=4000,
  //     this.hp=100,

  // ChattingRoomMember.fromJson(Map<String, dynamic> playerJson):
  //       name = playerJson['name'],
  //       name = playerJson['xp'],
  //       name = playerJson['job'];

  String convertChattingRoomMemberInfo(Map<String, String> info) => '${info['name']}\n${info['age']}\n${info['address']}\n${info['lv']}\n${info['xp']}\n${info['mp']}\n${info['hp']}\n${info['exp']}';

  String login({
    required String loginAccoundUserId,
    required String loginAccoundUserPw,
  }) =>
      'foo';

  // String getChattingRoomMemberInfo() => '$name\n$lv\n$xp\n$hp\n$mp\n$exp\n$age\n$address';

  @override
  String toString() => 'ChattingRoomMember{name: $name, lv: $lv, xp: $xp, mp: $mp, hp: $hp, exp: $exp, age: $age, address: $address, job: $job, login_accound_user_id: $loginAccoundUserId, login_accound_user_pw: $loginAccoundUserPw, login_ok: $loginOk}';
}

//abstract class
//자식객체 메소드 생성제한기능
abstract class Creature {
  //abstract field
  /*컨셉이 존재하지 않는 것으로 보임.*/

  //abstract method
  void sleep() {}

  void walk(String placeFrom, String placeTo) {}

  void eat(String food) {}
}

class Cameleon extends Creature {
  // void walk() {}
  // void walk(String place_from) {}
  // void walk(String place_from, String place_to) {}
  // String walk(String place_from, String place_to) {}
}

class Coach extends Creature {
  //constructor 에서 field 에 대해서 초기화하는 것을 권고하는 것으로 보인다.
  late String name;

  Coach({required this.name});

  @override
  void sleep() {
    printWithoutError('caach is sleeping now');
  }

  @override
  void walk(String placeFrom, String placeTo) {
    printWithoutError('caach is walking now from $placeFrom to $placeTo');
  }

  @override
  void eat(String food) {
    printWithoutError('caach is eating now');
  }
}

class Director extends Coach {
  Director({required super.name});
  //부모 변수 사용
  //부모 변수에
  //변수를 선언 초기화하지 않음




  //부모 변수 사용 + 내 변수 사용
  //부모 변수에 저장 + 내 변수에도 저장
  // Director({required super.name}) : name = name; //내 변수를 초기화





  //부모 함수 사용
  //함수를 선언하지 않음


  //부모 함수 사용 + 내 함수 사용
  //부모 함수 사용 + overrided 함수 사용
  @override
  void sleep() {
    // TODO: implement sleep
    super.sleep();
    printWithoutError('it is important thing thiat human sleep');
  }


}

//collaboration mixin and with
//부모 관계를 만들지 않고 mixin 의 field 나 method 를 가져와서 사용할 수 있다
mixin MagitianDefaultProperties {
  final int expDefault = 0;
  final int strongDefault = 5;
  final int intelligenceDefault = 100;
}
mixin MagitianDefaultMethod {
  void training() {
    printWithoutError('in training...');
  }
}

class ChattingRoomMemberMixined with MagitianDefaultProperties, MagitianDefaultMethod {}

//java 와 유사하게 코드의 entry point 는 main 이라는 이름을 가진 method 에서 시작된다.
void main() {
  dynamic foo;
  FooFoo foofoo = FooFoo();
  foo = foofoo.integers;
  foo = foofoo.foo('1', '2'); //'positional arguments'
  foo = foofoo.foo2(foofoo: '2', foo: '1'); //'named arguments'
  foo = foofoo.foo3('1', '2', '3'); //'optional arguments'
  foo = foofoo.foo3('1', '2'); //'optional arguments'
  foo = foofoo.integers;
  foo = foofoo.reverseListMaker(foo);
  foo = foofoo.reverseListMaker(foo);
  foo = foofoo.printMapInfo({'character_name': 'Jung Hoon Park'});
  foo = foofoo.printMapInfo({'name': 'Jung Hoon Park'});

  // ChattingRoomMember player = new ChattingRoomMember(); // flutter 스타일 가이드에서는 에서는 사용 비추천
  dynamic player;
  player = ChattingRoomMember(name: 'pjh4139', lv: 0, xp: 0, mp: 0, hp: 100000, exp: 0, age: 30, address: 'foo', loginAccoundUserId: 'Or가리튜닝', job: '어쌔신', loginAccoundUserPw: '0000', loginOk: 'ok'); // no argument constructor method + instance
  printWithoutError(player.getChattingRoomMemberInfo());
  printWithoutError(player.toString());

  dynamic director;
  director = Director(name: '박정훈 감독');
  director.sleep();
  printWithoutError(director.name);

  player = ChattingRoomMemberMixined();
  printWithoutError(player.expDefault); //mixin 을 호출을 해보니 android studio 에서 자동완성 지원않음. development experience 는 마음에 안듬
  printWithoutError(player.strongDefault);
  printWithoutError(player.intelligenceDefault);
  printWithoutError(player.training());

  //
  // // typedef : define s
  // typedef Operation = int Function(int x, int y, int z);
  // int add(int x, int y, int z) => x + y + z;
  // int subtract(int x, int y, int z) => x - y - z;
  // int complexCalculate(int x, int y, int z, Operation operation) => operation(x, y, z);
  // // typedef : define e
  //
  //
  // // typedef : call s
  // Opreation operation;
  // int result;
  //
  //
  // operation = add;
  // result = operation(10, 20, 30);
  // printWithoutErrorOrPrintWithError(result);
  //
  //
  // operation = subtract;
  // result = operation(10, 20, 30);
  // printWithoutErrorOrPrintWithError(result);
  //
  //
  // operation = complexCalculate;
  // result = operation(10, 20, 30, add);
  // printWithoutErrorOrPrintWithError(result);
  //
  //
  // operation = complexCalculate;
  // int result = operation(10, 20, 30, subtract);
  // printWithoutErrorOrPrintWithError(result)
  // // typedef : call e
  //
  //
  // // const constructorr 의 특징
  // 위에서 내가
  // ChattingRoomMember() 로 instance 들을 만들었을 때는
  // instance 들은 서로 모두 다른데
  // const ChattingRoomMember() 로 instance 들을 만들었을 때는
  // instance 들은 서로 같다.(혹쉬 싱글턴 패턴?)
  //
  //
  // //getter(내가 알던 방식)
  // String getChattingRoomFirstMemberName() => this.members[0].name;
  //
  // printWithoutErrorOrPrintWithError(player.getChattingRoomFirstMemberName());
  //
  //
  // //getter(dart 방식?)
  // String get ChattingRoomFirstMemberName{ // 소괄호 없음.
  // return this.members[0].name;
  // }
  //
  // printWithoutErrorOrPrintWithError(player.ChattingRoomFirstMemberName);
  //
  //
  // //setter(내가 알던 방식)
  // void setChattingRoomFirstMemberName(String FirstMemberName){
  //   this.members[0].name = FirstMemberName;
  // }
  //
  //
  // player.setChattingRoomFirstMemberName("박정훈");
  //
  //
  // //setter(dart 방식?)
  // set ChattingRoomFirstMemberName(){
  //  this.members[0].name = FirstMemberName;
  // }
  //
  // player.ChattingRoomFirstMemberName("박정훈");
  // player.ChattingRoomFirstMemberName = "박정훈";
  //
  //
  //
  //
  // //immutable programming concept
  // // final 과 const 를 많이 쓰는 것.
  // // 성능에도 좋으니까
  //
  //
  // // 필드에 final const 를 넣은 것은 한편으로는 해당 필드에 대한 setter 를 사용하지 않겠다는 뉘앙스가 풍긴다. 해당 필드에  final const 가 붙어 있다면 만들지 말자
  // // final 과 const 를 붙이게 된다면 setter 를 지우자. constructor 에서 받겠지 뭐.
  //
  //
  //
  // // 해당 파일에서만 private 컨셉 을 붙이면 다른 파일해서는 import 해서 호출 할 수 없다.
  // // class / constructor / method / field 모두 private 를 붙이면 되는데
  // // dart 에서는 간단하게 underscore 를 앞에 붙이면 끝이다.
  // // _뭐시기  이렇게 된건 모두 다른 파일에서 불러 올 수 없다.
  //
  //
  //
  //
  // //inheritance
  // //제대로 모르고 쓴 듯 하다.
  // //일단 부모의 기능을 쓰는 것은 맞다.
  // //부모의 기능을 호출하기 위해 constructor 와 super() 를 연계하는 법
  //
  // class grandParent{
  //   String name;
  //   grandParent({this.name});
  // }
  //
  // class parent extends grandParent{
  //   parent(String name):
  //     super(name : name);
  // }
  //
  // class child extends parent{
  //   child(String name):
  //     super(name : name);
  //
  // }
  //
  //
  // var me = child('박정훈');
  // printWithoutErrorOrPrintWithError(me.name);
  //
  //
  // printWithoutErrorOrPrintWithError(me is grandParent);
  // printWithoutErrorOrPrintWithError(me is parent);
  // printWithoutErrorOrPrintWithError(me is child);
  // printWithoutErrorOrPrintWithError(me is me);
  //
  //
  //
  //
  // //method override
  // //메소드 덮어쓰기
  // parent 의 method 가 아닌 변화된 메소드를 사요할 수 있다!
  //
  //
  // //암시적인 method override
  // bool isSleep(){
  // return isSleepState;
  // }
  //
  //
  // //위의 메소드와 동일하다 //명시적인 method override
  // @override // @override 없어도 무방
  // bool isSleep(){
  // return super.isSleepState; // super 없어도 무방
  // }
  //
  //
  //
  // enum State {
  //   approved,
  //   rejected,
  //
  // }
  //
  // chattingRoomUsingPermission = State.approved;
  // chattingRoomUsingPermission = State.rejected;
  //

  /*const vs final*/
  // const DateTime now_ = DateTime.now();//const 는 build time 에 초기화되는데 DateTime.now() 는 run time 에 초기화되도록 만들어진 값을 만들어낸다. 따라서 const 를 붙일 수 없다.
  final DateTime now_ = DateTime.now(); //final 는 run time 에 초기화되는 값.
  printWithoutError(now_);

  printWithoutError('-------------------------------------- 지금시간을 출력');
  DateTime now = DateTime.now();
  printWithoutError(now);

  printWithoutError('-------------------------------------- 특정시간을 출력');
  DateTime specificDay = DateTime(
    2017,
    11,
    23,
  );

  printWithoutError(specificDay);

  printWithoutError('-------------------------------------- 지금시간을 적당하게 출력');
  printWithoutError(now);
  printWithoutError(now.year);
  printWithoutError(now.month);
  printWithoutError(now.day);
  printWithoutError(now.hour);
  printWithoutError(now.minute);
  printWithoutError(now.second);
  printWithoutError(now.millisecond);
  printWithoutError(formatDate(DateTime.now(), [yyyy, '', mm, '', dd]));
  printWithoutError(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
  printWithoutError(formatDate(DateTime.now(), [yyyy, '', mm, '', dd]));
  printWithoutError(formatDate(DateTime.now(), [yyyy, ' ', mm, ' ', dd, ' ', HH, ' ', nn, ' ', ss, ' ', SSS]));
  printWithoutError(formatDate(DateTime.now(), [yyyy, '', mm, '', dd, '', HH, '', nn, '', ss, '', SSS]));
  printWithoutError(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss, '.', SSS]));
  printWithoutError(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]));
  printWithoutError(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));

  Duration duration = const Duration(seconds: 60);

  printWithoutError(duration);
  printWithoutError(duration.inDays);
  printWithoutError(duration.inHours);
  printWithoutError(duration.inMinutes);
  printWithoutError(duration.inSeconds);
  printWithoutError(duration.inMilliseconds);

  printWithoutError('-------------------------------------- now 와 specificDay 날짜 차이 비교');
  printWithoutError(specificDay);

  final difference = now.difference(specificDay);
  printWithoutError(difference);
  printWithoutError(difference.inDays);
  printWithoutError(difference.inHours);
  printWithoutError(difference.inMinutes);




  printWithoutError('-------------------------------------- 지금으로 부터 특정날짜 전인지 후인지 확인');
  printWithoutError(now.isAfter(specificDay));
  printWithoutError(now.isBefore(specificDay));

  printWithoutError('-------------------------------------- 지금으로 부터 10시간 뒤 시간');
  printWithoutError(now);
  printWithoutError(now.add(const Duration(hours: 10)));

  printWithoutError('-------------------------------------- 지금으로 부터 10시간 전 시간');
  printWithoutError(now);
  printWithoutError(now.subtract(const Duration(hours: 10)));

  printWithoutError('-------------------------------------- "123" 에서 [1_suffix, 2_suffix, 3_suffix] 로 변환'); //쪼개서 suffix 붙이기
  printWithoutError("123");
  printWithoutError("123".toString().split("")); //[1, 2, 3]
  printWithoutError("123".toString().split("").map((x) => '${x}_suffix')); //요까지하면 iteralble 일것임. 실험 해보자
  printWithoutError("123".toString().split("").map((x) => '${x}_suffix').toList()); //[1_suffix, 2_suffix, 3_suffix]

  printWithoutError('-------------------------------------- "foo.jpg,foo.png,foo.gif" 에서 [prefix_foo, prefix_foo, prefix_foo] 로 변환');//쪼개서 prefix 붙이기
  printWithoutError("foo.jpg,foo.png,foo.gif");
  printWithoutError("foo.jpg,foo.png,foo.gif".toString().split(","));//[foo.jpg,foo.png,foo.gif]
  printWithoutError("foo.jpg,foo.png,foo.gif".toString().split("").map((x)=>'prefix_$x').toList());//[prefix_foo.jpg, prefix_foo.jpg, prefix_foo.jpg]

  printWithoutError(123.toString().split("").map((e) => 'asset/images/random_numbers/$e.png').toList());




  /*entries 아주 유용하다 key, value 로 값을 받을 수 있게 해준다.*/
  printWithoutError([123,456,789].asMap().entries.toList()[1].key);
  printWithoutError([123,456,789].asMap().entries.toList()[1].value);

  /*이건 테스트해보자*/
  printWithoutError([123,456,789].asMap().entries.first.key);
  printWithoutError([123,456,789].asMap().entries.first.key);


  /*인덱스 붙여서 출력*/ //굳이 필요할까 싶긴한데
  printWithoutError([123,456,789].asMap().entries.map((e) => '${e.key}:${e.value}',));
  printWithoutError([123,456,789].asMap().entries.map((e) => '${e.key}:${e.value}',).toList());






}

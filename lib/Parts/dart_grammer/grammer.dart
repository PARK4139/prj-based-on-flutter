class FooFoo {
  // const vs final
  // 재초기화 제한 기능.

  DateTime now = DateTime.now();

  /*const vs final*/
  // const DateTime now__ = DateTime.now();//const 는 build time 에 초기화되는데 DateTime.now() 는 run time 에 초기화되도록 만들어진 값을 만들어낸다. 따라서 const 를 붙일 수 없다.
  final DateTime now_ = DateTime.now(); //final 는 run time 에 초기화되는 값.

  List<int> integers = [1, 2, 3]; //int list

  List<String> strings = ['1', '2', '3']; //String list

  String foo(String foo, String foofoo) => ' ' + foo + ' ' + foofoo + ' '; //positional arguments

  String foo2({required String foo, required String foofoo}) => ' ' + foo + ' ' + foofoo + ' '; //named arguments

  String foo3(String foo, String foofoo, [String? foofoofoo = 'foo']) => ' ' + foo + ' ' + foofoo + ' ' + foofoofoo!; //optional arguments

  String? dataTypePrinter(String? foo) {
    if (foo is String) {
      print('$foo\'s data type : String');
    } else if (foo is int) {
      print('$foo\'s data type : int');
    } else if (foo is dynamic) {
      print('$foo\'s data type : dynamic');
    } else if (foo is double) {
      print('$foo\'s data type : double');
    } else if (foo is List<String>) {
      print('$foo\'s data type : List<String>');
    } else if (foo is List<int>) {
      print('$foo\'s data type : List<int>');
    }
    return foo;
  }

  String? think(String? foo) {
    if (foo! is! String) {
      print('$foo\'s data type : String');
    } else if (foo == null) {
      foo ??= 'it was null'; //foo 가 null 이면 'it was null' 로서 초기화.
      print('$foo');
    }
    return foo;
  }

  List<String> reverseListMaker(List<String> list) => list.reversed.toList();

  String printMapInfo(Map<String, String> info) => '${info['name']}\n${info['age']}\n${info['address']}';
}

class Player {
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
  String login_accound_user_id;
  String login_accound_user_pw;
  String login_ok;

  // all args constructor method
  Player({
    required this.name,
    required this.lv,
    required this.xp,
    required this.mp,
    required this.hp,
    required this.exp,
    required this.age,
    required this.address,
    required this.login_accound_user_id,
    required this.job,
    required this.login_accound_user_pw,
    required this.login_ok,
  }) {
    login(login_accound_user_id: login_accound_user_id, login_accound_user_pw: login_accound_user_pw);
  }

  //
  // Player.create_worrior_player({
  //     required this.name,
  //     required this.age
  // }):
  //     this.name = name,
  //     this.age  =  age,
  //     this.job='worrior',
  //     this.xp=100,
  //     this.hp=4000;
  //
  // Player.create_magitian_player({
  //   required this.name, required this.age
  // }) :
  //     this.name = name,
  //     this.age=age,
  //     this.job='magitian',
  //     this.xp=4000,
  //     this.hp=100,

  // Player.fromJson(Map<String, dynamic> playerJson):
  //       name = playerJson['name'],
  //       name = playerJson['xp'],
  //       name = playerJson['job'];

  String convertPlayerInfo(Map<String, String> info) => '${info['name']}\n${info['age']}\n${info['address']}\n${info['lv']}\n${info['xp']}\n${info['mp']}\n${info['hp']}\n${info['exp']}';

  String login({
    required String login_accound_user_id,
    required String login_accound_user_pw,
  }) =>
      'foo';

  // String getPlayerInfo() => '$name\n$lv\n$xp\n$hp\n$mp\n$exp\n$age\n$address';

  @override
  String toString() => 'Player{name: $name, lv: $lv, xp: $xp, mp: $mp, hp: $hp, exp: $exp, age: $age, address: $address, job: $job, login_accound_user_id: $login_accound_user_id, login_accound_user_pw: $login_accound_user_pw, login_ok: $login_ok}';
}

//abstract class
//자식객체 메소드 생성제한기능
abstract class Creature {
  //abstract field
  /*컨셉이 존재하지 않는 것으로 보임.*/

  //abstract method
  void sleep() {}

  void walk(String place_from, String place_to) {}

  void eat(String food) {}
}

class cameleon extends Creature {
  // void walk() {}
  // void walk(String place_from) {}
  // void walk(String place_from, String place_to) {}
  // String walk(String place_from, String place_to) {}
}

class Coach extends Creature {
  //constructor 에서 field 에 대해서 초기화하는 것을 권고하는 것으로 보인다.
  late String name;

  Coach({required String name}) {
    this.name = name;
  }

  void sleep() {
    print('caach is sleeping now');
  }

  void walk(String departure, String destination) {
    print('caach is walking now from $departure to $destination');
  }

  void eat(String food) {
    print('caach is eating now');
  }
}

class Director extends Coach {
  //부모 변수 사용
  //부모 변수에 저장
  // Director({required super.name});
  //변수를 선언 초기화하지 않음

  //부모 변수 사용 + 내 변수 사용
  //부모 변수에 저장 + 내 변수에도 저장
  String name; //내 변수를 선언
  Director({required super.name}) : this.name = name; //내 변수를 초기화

  //부모 함수 사용
  //함수를 선언하지 않음

  //부모 함수 사용 + 내 함수 사용
  //부모 함수 사용 + overrided 함수 사용
  @override
  void sleep() {
    // TODO: implement sleep
    super.sleep();
    print('it is important thing thiat human sleep');
  }
}

//collaboration mixin and with
//부모 관계를 만들지 않고 mixin 의 field 나 method 를 가져와서 사용할 수 있다
mixin MagitianDefaultProperties {
  final int ExpDefault = 0;
  final int StrongDefault = 5;
  final int IntelligenceDefault = 100;
}
mixin MagitianDefaultMethod {
  void Training() {
    print('in training...');
  }
}

class Player_mixined with MagitianDefaultProperties, MagitianDefaultMethod {}

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

  // Player player = new Player(); // flutter 스타일 가이드에서는 에서는 사용 비추천
  dynamic player;
  player = Player(name: 'pjh4139', lv: 0, xp: 0, mp: 0, hp: 100000, exp: 0, age: 30, address: 'foo', login_accound_user_id: 'Or가리튜닝', job: '어쌔신', login_accound_user_pw: '0000', login_ok: 'ok'); // no argument constructor method + instance
  print(player.getPlayerInfo());
  print(player.toString());

  dynamic director;
  director = Director(name: '박정훈 감독');
  director.sleep();
  print(director.name);

  player = Player_mixined();
  print(player.ExpDefault); //mixin 을 호출을 해보니 android studio 에서 자동완성 지원않음. development experience 는 마음에 안듬
  print(player.StrongDefault);
  print(player.IntelligenceDefault);
  print(player.Training());
}

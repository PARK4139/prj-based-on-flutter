import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SampleToggle());
}

class SampleToggle extends StatefulWidget {
  @override
  State<SampleToggle> createState() => _SampleToggleState();
}

class _SampleToggleState extends State<SampleToggle> {
  final LocalStorage storage = LocalStorage('foo.foo');
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    initCheckState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('${isChecked.toString() ?? '아직 로컬스토리지에서 값을 가져오지 못했습니다.'}'),
        // 혹시 ?? 하기 싫으면 futureBuilder 사용하면 되는게 아닌가 싶다.
        //future에 Build되기 전까지는 rotary indicator 시현되도록 할수 있는 기능이 있는 futureBuilder.
        //테스트 해보자.
        onPressed: () {
          setState(() {
            onToogleIsChecked();
          });
        },
      ),
    );
  }

  void onToogleIsChecked() {
    setState(() {
      if (isChecked == true) {
        isChecked = false;
      } else {
        isChecked = true;
      }
      storage.setItem('isChecked', isChecked);
    });
  }

  void initCheckState() {
    setState(() {
      if (storage.getItem('isChecked') == null) {
        isChecked = false;
        storage.setItem('isChecked', isChecked);
      } else {
        isChecked = storage.getItem('isChecked');
      }
    });
  }
}

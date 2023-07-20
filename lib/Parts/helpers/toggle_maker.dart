import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ToggleMaker());
}

class ToggleMaker extends StatefulWidget {
  @override
  State<ToggleMaker> createState() => _ToggleMakerState();
}

class _ToggleMakerState extends State<ToggleMaker> {
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
        child: Text(isChecked.toString()),
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

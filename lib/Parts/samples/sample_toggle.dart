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

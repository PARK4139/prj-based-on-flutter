import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SampleCheckBox());
}

class SampleCheckBox extends StatefulWidget {
  @override
  State<SampleCheckBox> createState() => _SampleCheckBoxState();
}

class _SampleCheckBoxState extends State<SampleCheckBox> {
  final LocalStorage storage = LocalStorage('foo.foo');
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    initIsChecked();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: isChecked ? Icon(Icons.check_box_outlined, color: Colors.lightBlueAccent) : Icon(Icons.check_box_outline_blank, color: Colors.lightBlueAccent),
        onPressed: onToogleIsChecked,
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

  void initIsChecked() {
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

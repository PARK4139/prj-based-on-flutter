import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  /*5*/ WidgetsFlutterBinding.ensureInitialized();
  runApp(const CheckBoxMaker());
}

class CheckBoxMaker extends StatefulWidget {
  const CheckBoxMaker({super.key});

  @override
  State<CheckBoxMaker> createState() => _CheckBoxMakerState();
}

class _CheckBoxMakerState extends State<CheckBoxMaker> {
  /*1*/
  final LocalStorage storage = LocalStorage('foo.foo');

  /*2*/
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    /*3*/
    initIsChecked();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: isChecked ? const Icon(Icons.check_box_outlined, color: Colors.lightBlueAccent) : const Icon(Icons.check_box_outline_blank, color: Colors.lightBlueAccent),
        onPressed: /*4*/ onToogleIsChecked,
      ),
    );
  }

  /*5*/
  void onToogleIsChecked() {
    setState(() {
      if (isChecked == true) {
        isChecked = false;
      } else {
        isChecked = true;
      }
      storage.setItem('isChecked202307041307', isChecked);
    });
  }

  /*6*/
  void initIsChecked() {
    setState(() {
      if (storage.getItem('isChecked202307041307') == null) {
        isChecked = false;
        storage.setItem('isChecked202307041307', isChecked);
      } else {
        isChecked = storage.getItem('isChecked202307041307');
      }
    });
  }
}

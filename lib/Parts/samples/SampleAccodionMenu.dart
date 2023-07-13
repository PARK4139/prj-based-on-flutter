import 'package:flutter/material.dart';


class SampleAccodionMenu extends StatefulWidget {
  @override
  _SampleAccodionMenuState createState() => _SampleAccodionMenuState();
}

class _SampleAccodionMenuState extends State<SampleAccodionMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Expanded(
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Option 1'),
                    ),
                  );
                },
                child: const Text('Option 1'),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Option 2'),
                    ),
                  );
                },
                child: const Text('Option 2'),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Option 3'),
                    ),
                  );
                },
                child: const Text('Option 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
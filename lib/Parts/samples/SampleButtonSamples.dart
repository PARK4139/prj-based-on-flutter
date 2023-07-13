import 'package:flutter/material.dart';

class SampleButtonSamples extends StatefulWidget {
  const SampleButtonSamples({super.key});

  @override
  State<SampleButtonSamples> createState() => _SampleButtonSamplesState();
}

class _SampleButtonSamplesState extends State<SampleButtonSamples> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        /*버튼스타일*/ FloatingActionButton(
        mini: false,
        backgroundColor: Colors.blue.shade900,
        splashColor: Colors.black,
        onPressed: () {},
        hoverElevation: 1.5,
        shape: StadiumBorder(side: BorderSide(color: Colors.blue, width: 4)),
        elevation: 1.5,
        child: Icon(
          Icons.message,
          color: Colors.red,
        ),
      ),
        Text("______________________________"),
        /*버튼스타일*/ Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 4),
          color: Colors.yellow,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          iconSize: 56,
          icon: Icon(Icons.message),
          onPressed: () {},
        ),
      ),
        Text("______________________________"),
        /*버튼스타일*/ Material(
        type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigoAccent, width: 4.0),
            color: Colors.indigo[900],
            shape: BoxShape.circle,
          ),
          child: InkWell(
            //This keeps the splash effect within the circle
            borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.message,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
        Text("______________________________"),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Buttons_icon_with_text extends StatefulWidget {
  Icon icon;

  Text text;

  Function onPressed;

  Buttons_icon_with_text({required this.icon, required this.text, required this.onPressed});

  @override
  State<Buttons_icon_with_text> createState() => _Buttons_icon_with_textState();
}

class _Buttons_icon_with_textState extends State<Buttons_icon_with_text> {
  _Buttons_icon_with_textState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: IconButton(
        onPressed: () {
          widget.onPressed();
        },
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            const SizedBox(height: 5),
            widget.text,
          ],
        ),
      ),
    );
  }
}

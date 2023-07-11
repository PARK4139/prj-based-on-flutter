import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SampleHyperlink extends StatefulWidget {
  @override
  State<SampleHyperlink> createState() => _SampleHyperlinkState();
}

class _SampleHyperlinkState extends State<SampleHyperlink> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return /*google 하이퍼링크*/ TextButton(
      onPressed: () {
        launchUrl(Uri.parse('https://www.google.com')); //Uri 인수는 텍스트 URL 인수보다 더 안전하고 신뢰할 수 있습니다.
      },
      child: Text('google'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NaverRoutingButtonMaker extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius? borderRadius;

  const NaverRoutingButtonMaker({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.borderRadius,
  }) : super(key: key);

  @override
  State<NaverRoutingButtonMaker> createState() => _NaverRoutingButtonMakerState();
}

class _NaverRoutingButtonMakerState extends State<NaverRoutingButtonMaker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget.paddingHorizontal,
        vertical: widget.paddingVertical,
      ),
      child: TextButton(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.color,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
          ),
          onPressed: () {
            final Uri url = Uri.parse("https://naver.com");
            openNewTab(url);
          }),
    );
  }

  Future<void> openNewTab(
    Uri url, {
    String? hostOperatingEnvironment, //아래도 이게 꼭 필요하다
  }) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
    setState(() {});
  }
}

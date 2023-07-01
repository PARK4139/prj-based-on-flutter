import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Button_to_route_to_naver extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  const Button_to_route_to_naver({
    Key? key,
    required this.text,
    required this.background_color,
    required this.color,
    required this.font_size,
    required this.font_weight,
    required this.padding_vertical,
    required this.padding_horizontal,
    required this.border_radius,
  }) : super(key: key);

  @override
  State<Button_to_route_to_naver> createState() => _Button_to_route_to_naverState();
}

class _Button_to_route_to_naverState extends State<Button_to_route_to_naver> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.background_color,
        borderRadius: widget.border_radius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget.padding_horizontal,
        vertical: widget.padding_vertical,
      ),
      child: TextButton(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.color,
              fontSize: widget.font_size,
              fontWeight: widget.font_weight,
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

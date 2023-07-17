import 'package:flutter/material.dart';

class LateralSlideBuilder extends StatelessWidget {
  final List<Widget> items;

  const LateralSlideBuilder({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}

class CarouselSlider extends StatelessWidget {
  final List<Widget> items;
  final int activeIndex;
  final Function(int) onPageChanged;

  CarouselSlider({
    required this.items,
    this.activeIndex = 0,
    required this.onPageChanged,
    required bool autoplay,
    required double viewportFraction,
    required double aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8),
      onPageChanged: onPageChanged,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }
}

class Button_to_play extends StatefulWidget {
  late Function onPressed;

  Button_to_play({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<Button_to_play> createState() => _Button_to_playState();
}

class _Button_to_playState extends State<Button_to_play> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Transform.translate(
            offset: const Offset(300, -20),
            child: Container(
              height: 45,
              width: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35), color: Colors.deepOrange),
              child: IconButton(
                onPressed: () {
                  widget.onPressed();
                },
                icon: Container(
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 3),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(width: 3),
                          Text('재생', style: TextStyle(color: Colors.white, fontSize: 15)),
                          SizedBox(width: 3),
                          // SizedBox(width: 3),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Widget> IndicatorMaker(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(
      Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(shape: BoxShape.circle, color: _currentPage == i ? Color.fromRGBO(255, 255, 255, 0.9) : Color.fromRGBO(255, 255, 255, 0.4)),
      ),
    );
  }

  return results;
}

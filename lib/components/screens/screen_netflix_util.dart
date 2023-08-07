import 'package:flutter/material.dart';

class LateralSlideBuilder extends StatelessWidget {
  final List<Widget> items;

  const LateralSlideBuilder({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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

  const CarouselSlider({super.key,
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

class ButtonToPlay extends StatefulWidget {
  late Function onPressed;

  ButtonToPlay({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ButtonToPlay> createState() => _ButtonToPlayState();
}

class _ButtonToPlayState extends State<ButtonToPlay> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(300, -20),
          child: Container(
            height: 45,
            width: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(35), color: Colors.deepOrange),
            child: IconButton(
              onPressed: () {
                widget.onPressed();
              },
              icon: const Column(
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
      ],
    );
  }
}

List<Widget> indicatorMaker(List list, int currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(
      Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(shape: BoxShape.circle, color: currentPage == i ? const Color.fromRGBO(255, 255, 255, 0.9) : const Color.fromRGBO(255, 255, 255, 0.4)),
      ),
    );
  }

  return results;
}

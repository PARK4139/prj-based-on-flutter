import 'package:flutter/material.dart';

import '../components/screens/screen_carrot_market_home_sub_to_write.dart';





class CarrotMarketFloatingWritingButtonMaker extends StatefulWidget {
  const CarrotMarketFloatingWritingButtonMaker({Key? key}) : super(key: key);

  @override
  State<CarrotMarketFloatingWritingButtonMaker> createState() => _CarrotMarketFloatingWritingButtonMakerState();
}

class _CarrotMarketFloatingWritingButtonMakerState extends State<CarrotMarketFloatingWritingButtonMaker> {
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
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenCarrotMarketHomeSubToWrite()));
                },
                child: Column(
                  children: [
                    Transform.translate(
                      offset: const Offset(0,9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 3),
                          Transform.scale(scale: 1.6, child: const Text('+', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w300))),
                          const SizedBox(width: 3),
                          const Text('글쓰기', style: TextStyle(color: Colors.white, fontSize: 12)),
                          const SizedBox(width: 3),
                        ],
                      ),
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

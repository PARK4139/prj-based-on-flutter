import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_carrot_market_home_sub_to_write.dart';

class ButtonToWriteForCarrotMarket extends StatefulWidget {
  const ButtonToWriteForCarrotMarket({Key? key}) : super(key: key);

  @override
  State<ButtonToWriteForCarrotMarket> createState() => _ButtonToWriteForCarrotMarketState();
}

class _ButtonToWriteForCarrotMarketState extends State<ButtonToWriteForCarrotMarket> {
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

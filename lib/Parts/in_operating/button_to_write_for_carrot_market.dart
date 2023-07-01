import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_carrot_market_home_sub_to_write.dart';

class Button_to_write_for_carrot_market extends StatefulWidget {
  const Button_to_write_for_carrot_market({Key? key}) : super(key: key);

  @override
  State<Button_to_write_for_carrot_market> createState() => _Button_to_write_for_carrot_marketState();
}

class _Button_to_write_for_carrot_marketState extends State<Button_to_write_for_carrot_market> {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_carrot_market_home_sub_to_write()));
                },
                icon: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 3),
                          Transform.scale(child: Text('+', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w300)), scale: 1.6),
                          SizedBox(width: 3),
                          Text('글쓰기', style: TextStyle(color: Colors.white, fontSize: 12)),
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

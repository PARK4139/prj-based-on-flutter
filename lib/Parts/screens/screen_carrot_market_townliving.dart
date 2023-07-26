import 'package:flutter/material.dart';

class ScreenCarrotMarketTownLiving extends StatefulWidget {
  const ScreenCarrotMarketTownLiving({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarketTownLiving> createState() => _ScreenCarrotMarketTownLivingState();
}

class _ScreenCarrotMarketTownLivingState extends State<ScreenCarrotMarketTownLiving> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            height: 60,
            padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
            // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, color: Colors.deepOrangeAccent),
                      tooltip: "뒤로가기",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 1, 0),
                  child: const Row(
                    children: [
                      Text('삼평동', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Icon(Icons.arrow_drop_down_sharp, size: 30, color: Colors.grey),
                      SizedBox(width: 30),
                      SizedBox(width: 30),
                      SizedBox(width: 30),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder()));
                    },
                    icon: const Icon(Icons.search),
                    iconSize: 25,
                    color: Colors.grey,
                    padding: const EdgeInsets.fromLTRB(0, 0, 1, 0)),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder()));
                    },
                    icon: const Icon(Icons.account_circle_outlined),
                    iconSize: 25,
                    color: Colors.grey,
                    padding: const EdgeInsets.fromLTRB(0, 0, 1, 0)),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder()));
                    },
                    icon: const Icon(Icons.notifications_active_outlined),
                    iconSize: 25,
                    color: Colors.grey,
                    padding: const EdgeInsets.fromLTRB(0, 0, 1, 0)),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return const Placeholder(fallbackHeight: 140);
        },
      ),
    );
  }
}

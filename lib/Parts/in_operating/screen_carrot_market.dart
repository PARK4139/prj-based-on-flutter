import 'package:flutter/material.dart';

import 'button_to_write_for_carrot_market.dart';
import 'screen_carrot_market_arround_me.dart';
import 'screen_carrot_market_chatting.dart';
import 'screen_carrot_market_home.dart';
import 'screen_carrot_market_mycarrot.dart';
import 'screen_carrot_market_townliving.dart';

// physics: NeverScrollableScrollPhysics(),
// ,
class ScreenCarrotMarket extends StatefulWidget {
  const ScreenCarrotMarket({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarket> createState() => _ScreenCarrotMarketState();
}

class _ScreenCarrotMarketState extends State<ScreenCarrotMarket> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ButtonToWriteForCarrotMarket(),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        labelBehavior: labelBehavior,
        destinations: const <Widget>[
          NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.home, size: 18), Text('홈', style: TextStyle(fontSize: 9))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.home, size: 18), Text('홈', style: TextStyle(fontSize: 9))]),
          ),
          NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.article_outlined, size: 18), Text('동네생활', style: TextStyle(fontSize: 9))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.article_outlined, size: 18), Text('동네생활', style: TextStyle(fontSize: 9))]),
          ),
          NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.pin_drop_outlined, size: 18), Text('내 근처', style: TextStyle(fontSize: 9))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.pin_drop_outlined, size: 18), Text('내 근처', style: TextStyle(fontSize: 9))]),
          ),
          NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.chat_bubble_outline_rounded, size: 18), Text('채팅', style: TextStyle(fontSize: 9))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.chat_bubble_outline_rounded, size: 18), Text('채팅', style: TextStyle(fontSize: 9))]),
          ),
          NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.perm_identity_outlined, size: 18), Text('나의 당근', style: TextStyle(fontSize: 9))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.perm_identity_outlined, size: 18), Text('나의 당근', style: TextStyle(fontSize: 9))]),
          ),
        ],
      ),
      body: <Widget>[
        Builder(
          builder: (context) {
            return const ScreenCarrotMarketHome();
          },
        ),
        Builder(
          builder: (context) {
            return const ScreenCarrotMarketTownLiving();

          },
        ),
        Builder(
          builder: (context) {
            return const ScreenCarrotMarketArroundMe();
          },
        ),
        Builder(
          builder: (context) {
            return const ScreenCarrotMarketChatting();
          },
        ),
        Builder(
          builder: (context) {
            return const ScreenCarrotMarketMyCarrot();
          },
        ),
        // Container(
        //   color: Colors.black,
        //   child: Container(
        //     height: 50,
        //     child: const TabBar(
        //       labelColor: Colors.white,
        //       unselectedLabelColor: Colors.white60,
        //       indicatorColor: Colors.transparent,
        //       tabs: <Widget>[
        //
        //       ],
        //     ),
        //   ),
        // ),
      ][currentPageIndex],
    );
  }
}

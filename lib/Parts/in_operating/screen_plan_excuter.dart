import 'package:flutter/material.dart';

import 'button_to_write_for_carrot_market.dart';
import 'screen_carrot_market_arround_me.dart';
import 'screen_carrot_market_chatting.dart';
import 'screen_carrot_market_home.dart';
import 'screen_carrot_market_mycarrot.dart';
import 'screen_carrot_market_townliving.dart';

// physics: NeverScrollableScrollPhysics(),
// ,
class Screen_life_checklist extends StatefulWidget {
  const Screen_life_checklist({Key? key}) : super(key: key);

  @override
  State<Screen_life_checklist> createState() => _Screen_life_checklistState();
}

class _Screen_life_checklistState extends State<Screen_life_checklist> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonToWriteForCarrotMarket(),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        labelBehavior: labelBehavior,
        destinations: <Widget>[
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
            return ScreenCarrotMarketHome();
          },
        ),
        Builder(
          builder: (context) {
            return ScreenCarrotMarketTownLiving();
          },
        ),
        Builder(
          builder: (context) {
            return ScreenCarrotMarketArroundMe();
          },
        ),
        Builder(
          builder: (context) {
            return ScreenCarrotMarketChatting();
          },
        ),
        Builder(
          builder: (context) {
            return ScreenCarrotMarketMyCarrot();
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

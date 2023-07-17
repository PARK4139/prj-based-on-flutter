import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/screens/screen_netflix_home.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/screens/screen_netflix_more.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/screens/screen_netflix_search.dart';

import 'screen_netflix_saved_contents_list.dart';

// physics: NeverScrollableScrollPhysics(),
// ,
class ScreenNetFlix extends StatefulWidget {
  const ScreenNetFlix({Key? key}) : super(key: key);

  @override
  State<ScreenNetFlix> createState() => _ScreenNetFlixState();
}

class _ScreenNetFlixState extends State<ScreenNetFlix> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        labelBehavior: labelBehavior,
        destinations: const <Widget>[
          /*홈*/ NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.home, size: 18, color: Colors.white), Text('홈', style: TextStyle(fontSize: 9, color: Colors.white))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.home, size: 18, color: Colors.white), Text('홈', style: TextStyle(fontSize: 9, color: Colors.white))]),
          ),
          /*검색*/ NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.search, size: 18, color: Colors.white), Text('검색', style: TextStyle(fontSize: 9, color: Colors.white))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.search, size: 18, color: Colors.white), Text('검색', style: TextStyle(fontSize: 9, color: Colors.white))]),
          ),
          /*저장한 콘텐츠 목록 */ NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.save_alt, size: 18, color: Colors.white), Text('저장한 콘텐츠 목록', style: TextStyle(fontSize: 9, color: Colors.white))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.save_alt, size: 18, color: Colors.white), Text('저장한 콘텐츠 목록', style: TextStyle(fontSize: 9, color: Colors.white))]),
          ),
          /*더보기 */ NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.list, size: 18, color: Colors.white), Text('더보기', style: TextStyle(fontSize: 9, color: Colors.white))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.list, size: 18, color: Colors.white), Text('더보기', style: TextStyle(fontSize: 9, color: Colors.white))]),
          ),
        ],
      ),
      body: <Widget>[
        Builder(
          builder: (context) {
            return ScreenNetflixHome();
          },
        ),
        Builder(
          builder: (context) {
            return ScreenNetflixSearch();
          },
        ),
        Builder(
          builder: (context) {
            return ScreenNetflixSavedContentsList();
          },
        ),
        Builder(
          builder: (context) {
            return Screen_netflix_more();
          },
        ),
      ][currentPageIndex],
    );
  }
}

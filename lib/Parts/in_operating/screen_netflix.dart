import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_netflix_home.dart';

import '../in_operating/screen_netflix_more.dart';
import '../in_operating/screen_netflix_search.dart';
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,mkr
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
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.search, size: 18), Text('검색', style: TextStyle(fontSize: 9))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.search, size: 18), Text('검색', style: TextStyle(fontSize: 9))]),
          ),
          NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.save_alt, size: 18), Text('저장한 콘텐츠 목록', style: TextStyle(fontSize: 9))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.save_alt, size: 18), Text('저장한 콘텐츠 목록', style: TextStyle(fontSize: 9))]),
          ),
          NavigationDestination(
            label: '',
            selectedIcon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.list, size: 18), Text('더보기', style: TextStyle(fontSize: 9))]),
            icon: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.list, size: 18), Text('더보기', style: TextStyle(fontSize: 9))]),
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

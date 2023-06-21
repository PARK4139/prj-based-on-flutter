import 'dart:async';

import 'package:flutter/material.dart';

import '../inDeveloping/Buttons.dart';
import '../inDeveloping/Model and API.dart';

import 'Screen_code_sniffets.dart';
import 'Screen_web_maintennace.dart';



//data fetch for beginners
// class CustomScreenWebToon extends StatefulWidget {
//   const CustomScreenWebToon({Key? key}) : super(key: key);
//
//   @override
//   State<CustomScreenWebToon> createState() => _CustomScreenWebToonState();
// }
//
// class _CustomScreenWebToonState extends State<CustomScreenWebToon> {
//   List<ModelWebToon> webtoons = [];
//   bool isLoading = true;
//
//
//   // Future<void> waitForWebToons() async {   // Future<void> 일 필요 없나?
//   void waitForWebToons() async {
//     webtoons= await ApiService.getTodaysToons();   //  ApiService.getTodaysToons() 가 async method 이기 때문에 await 를 붙여야 한다
//     isLoading = false ;
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     waitForWebToons();
//   }
//
//   //
//   // void foo(Timer timer) {
//   //   setState(() {
//   //     print('Foo()');
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     print(webtoons);
//     print(isLoading);
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: Column(
//         children: [
//           Flexible(
//             flex: 1,
//             child: Container(
//               // alignment: Alignment.bottomCenter,
//               alignment: Alignment.center,
//               child: Text(
//                 '$webtoons',
//                 style: TextStyle(
//                   color: Theme.of(context).cardColor,
//                   fontSize: 10,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//           // Flexible(
//           //   flex: 3,
//           //   child: Center(
//           //     child: Padding(
//           //       padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
//           //       child: Row(
//           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //         children: [
//           //           // Container(
//           //           //   child: SizedBox(
//           //           //     width: 5,
//           //           //   ),
//           //           // ),
//           //           Container(
//           //             child: TextButton(
//           //               onPressed: foo,
//           //               child: Text(
//           //                   '$webtoons',
//           //                 style: TextStyle(
//           //                   color: Theme.of(context).cardColor,
//           //                   fontSize: 20,
//           //                 ),
//           //               ),
//           //             ),
//           //           ),
//           //           Container(
//           //             child: IconButton(
//           //               color: Theme.of(context).cardColor,
//           //               onPressed: foo,
//           //               iconSize: 120,
//           //               icon: Icon(
//           //                 // true ? Icons.play_circle_outline : Icons.pause_circle_outline,
//           //                 // false ? Icons.play_circle_outline : Icons.pause_circle_outline,
//           //                 isRunning ? Icons.pause_circle_outline : Icons.play_circle_outline,
//           //               ),
//           //             ),
//           //           ),
//           //           Container(
//           //             child: TextButton(
//           //               onPressed: foo,
//           //               child: Text(
//           //                 'CURRENT\nLAP\nRESET',
//           //                 style: TextStyle(
//           //                   color: Theme.of(context).cardColor,
//           //                   fontSize: 20,
//           //                 ),
//           //               ),
//           //             ),
//           //           ),
//           //         ],
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           // Flexible(
//           //   flex: 1,
//           //   child: Row(children: [
//           //     Expanded(
//           //       child: Container(
//           //         decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(50)),
//           //         child: Column(
//           //           mainAxisAlignment: MainAxisAlignment.center,
//           //           children: [
//           //             Text(
//           //               'Pomodoro',
//           //               style: TextStyle(
//           //                 fontSize: 20,
//           //                 fontWeight: FontWeight.w600,
//           //                 color: Theme.of(context).textTheme.headline1!.color,
//           //               ),
//           //             ),
//           //             Text(
//           //               '$pomodoros',
//           //               style: TextStyle(
//           //                 fontSize: 58,
//           //                 fontWeight: FontWeight.w600,
//           //                 color: Theme.of(context).textTheme.headline1!.color,
//           //               ),
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //     ),
//           //   ]),
//           // ),
//         ],
//       ),
//     );
//   }
//
//
// }

//data fetch with stateless wiget
class Screen_web_toon_v2 extends StatelessWidget {
  Screen_web_toon_v2({Key? key}) : super(key: key);

  Future<List<ModelWebToon>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print('snapshot.hasData');//DEVELOPMENT
            return ListView(
              children: [
                for (var webtoon in snapshot.data!) Text(webtoon.title), //collection for 로 webToon.title 을 가져온다.     개발자가 null이 아님을 확신을 할 때 !를 붙여줄 수 있다...
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}



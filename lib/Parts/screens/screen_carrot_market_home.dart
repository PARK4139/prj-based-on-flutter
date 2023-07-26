import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/screens/screen_carrot_market_home_sub_to_notificate_info.dart';

import '../helpers/api_helper.dart';
import '../helpers/super_helper.dart';
import 'screen_carrot_market_home_sub_to_search.dart';
import 'screen_carrot_market_home_sub_to_set_category.dart';

class ScreenCarrotMarketHome extends StatefulWidget {
  const ScreenCarrotMarketHome({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarketHome> createState() => _ScreenCarrotMarketHomeState();
}

class _ScreenCarrotMarketHomeState extends State<ScreenCarrotMarketHome> {
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
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const App()));
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 1, 0),
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text(MyMents.notReadyYet)));
                    },
                    child: const Row(
                      children: [
                        Text('달안동', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Icon(Icons.arrow_drop_down_sharp, size: 30, color: Colors.grey),
                        SizedBox(width: 30),
                        SizedBox(width: 30),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenCarrotMarketHomeSubToSetCategory()));
                    },
                    icon: const Icon(Icons.menu),
                    iconSize: 25,
                    color: Colors.grey,
                    padding: const EdgeInsets.fromLTRB(0, 0, 1, 0)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenCarrotMarketHomeSubToSearch(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search),
                    iconSize: 25,
                    color: Colors.grey,
                    padding: const EdgeInsets.fromLTRB(0, 0, 1, 0)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenCarrotMarketHomeSubToNotificateInfo(),
                        ),
                      );
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
        itemCount: 10,
        itemBuilder: (context, index) {
          return const UserCardForHome();
        },
      ),
    );
  }
}

class UserCardForHome extends StatefulWidget {
  const UserCardForHome({Key? key}) : super(key: key);

  @override
  State<UserCardForHome> createState() => _UserCardForHomeState();
}

class _UserCardForHomeState extends State<UserCardForHome> {
  // dummy data
  List<CarrotUserCardInfos> carrotUserCardInfos = [
    CarrotUserCardInfos.fromMap({
      'userItemImgUrl': 'asset/images/app_carrot_market_logo.png',
      'itemCategory': '반려식물',
      'userLocation': '안양시 동안구 석수동',
      'userUploadingTime': '6분 전',
      'itemPrice': 180000,
      'heartCount': 1,
      'chattingRequestCount': 2,
    })
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54.withOpacity(0.8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 130,
            width: 130,
            child: Image.asset(carrotUserCardInfos[0].userItemImgUrl ,fit: BoxFit.fitWidth),
            // child: FadeInImage(
            //   // image: NetworkImage(carrot_user_card_infos[0].userItemImgUrl),//외부 주소로 img 받아 올때
            //   image: AssetImage(carrotUserCardInfos[0].userItemImgUrl),
            //   placeholder: const AssetImage("assets/notReadyYet.jpg"),
            //   imageErrorBuilder: (context, error, stackTrace) {
            //     // return Image.asset('asset/images/error.jpg', fit: BoxFit.fitWidth);
            //     return const Center(child: CircularProgressIndicator());
            //   },
            //   fit: BoxFit.fitWidth,
            // ),
          ),
          // Image.network(carrot_user_card_infos[0].userItemImgUrl, fit: BoxFit.contain)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(carrotUserCardInfos[0].itemCategory, style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w400)),
              Text('${carrotUserCardInfos[0].userLocation} * ${carrotUserCardInfos[0].userUploadingTime}', style: const TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w400)),
              Text('${carrotUserCardInfos[0].itemPrice}원', style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w600)),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 1, width: 200),
                  const Icon(Icons.question_answer_outlined, size: 15, color: Colors.black38),
                  const SizedBox(height: 1, width: 1),
                  Text(carrotUserCardInfos[0].chattingRequestCount.toString(), style: const TextStyle(color: Colors.black38, fontSize: 10)),
                  const SizedBox(height: 2, width: 2),
                  const Icon(Icons.favorite_border, size: 15, color: Colors.black38),
                  const SizedBox(height: 1, width: 1),
                  Text(carrotUserCardInfos[0].heartCount.toString(), style: const TextStyle(color: Colors.black38, fontSize: 10)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserCardForActivityNotification extends StatefulWidget {
  const UserCardForActivityNotification({Key? key}) : super(key: key);

  @override
  State<UserCardForActivityNotification> createState() => _UserCardForActivityNotificationState();
}

class _UserCardForActivityNotificationState extends State<UserCardForActivityNotification> {
  // dummy data
  List<CarrotUserCardForActivityNotificationInfos> cardInfos = [
    CarrotUserCardForActivityNotificationInfos.fromMap({
      'notificationImgUrl': 'asset/images/app_carrot_market_logo.png',
      'notificationDescription1': '♨♨달안동 이웃을 사로잡은 금주의 인기매물,지금 만나보세요!',
      'notificationDescription2': '정훈94님께 소중한 나눔으로 환경보호 실천한 사연 전해요.',
      'notificationUploadingTime': '6분 전',
    })
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54.withOpacity(0.8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 90,
            width: 90,
            child: FadeInImage(
              // image: NetworkImage(carrot_user_card_infos[0].userItemImgUrl),//외부 주소로 img 받아 올때
              image: AssetImage(cardInfos[0].notificationImgUrl),
              placeholder: const AssetImage("assets/placeholder.jpg"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('asset/images/error.jpg', fit: BoxFit.fitWidth);
              },
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cardInfos[0].notificationDescription1, style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w400)),
              const SizedBox(height: 3),
              Text(cardInfos[0].notificationDescription2.toString(), style: const TextStyle(color: Colors.black38, fontSize: 10)),
              const SizedBox(height: 3),
              Text(cardInfos[0].notificationUploadingTime.toString(), style: const TextStyle(color: Colors.black38, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

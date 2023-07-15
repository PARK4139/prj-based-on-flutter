import 'package:flutter/material.dart';

import 'screen_carrot_market_home.dart';

class ScreenCarrotMarketHomeSubToNotificateInfo extends StatefulWidget {
  const ScreenCarrotMarketHomeSubToNotificateInfo({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarketHomeSubToNotificateInfo> createState() => _ScreenCarrotMarketHomeSubToNotificateInfoState();
}

class _ScreenCarrotMarketHomeSubToNotificateInfoState extends State<ScreenCarrotMarketHomeSubToNotificateInfo> {

  late bool isTargetText1AsEdit;

  @override
  void initState() {
    super.initState();
    initIsTargetText1AsEdit();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              children: [
                const Text('알림', style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w700)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: TextButton(
                          child: isTargetText1AsEdit ? const Text('편집', style: TextStyle(fontSize: 14, color: Colors.grey)) : const Text('완료', style: TextStyle(fontSize: 14, color: Colors.grey)),
                          onPressed: () {
                            Navigator.pop(context);
                            toogleTargetText1();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 1,
            foregroundColor: Colors.grey,
            backgroundColor: Colors.white,
            bottom: const TabBar(
              tabs: [
                Tab(child: Text('활동 알림', style: TextStyle(fontSize: 14, color: Colors.grey))),
                Tab(child: Text('키워드 알림', style: TextStyle(fontSize: 14, color: Colors.grey))),
              ],
              indicatorColor: Colors.deepOrange,
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const UserCardForActivityNotification();
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('받은 알림이 없어요.\n키워드를 등록하고 알림을 받아보세요.', textAlign: TextAlign.center),
                  const SizedBox(height: 15),
                  Container(
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepOrange),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 23),
                              Text('키워드 등록하기', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toogleTargetText1() {
    if (isTargetText1AsEdit == true) {
      isTargetText1AsEdit = false;
    } else {
      isTargetText1AsEdit = true;
    }
  }

  void initIsTargetText1AsEdit() {
    isTargetText1AsEdit = true;
  }
}

import 'package:flutter/material.dart';

import '../../data/source/remote/road_cctv_api_helper.dart';
import '../../utils/super_helper.dart';

class ScreenApisTest extends StatefulWidget {
  const ScreenApisTest({super.key});

  @override
  State<ScreenApisTest> createState() => _ScreenApisTestState();
}

class _ScreenApisTestState extends State<ScreenApisTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: RoadCctvApiService.getRoadCctvs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Center(child: Text(snapshot.data![0].cctvurl, style: const TextStyle(color: MyColors.white))),
            );
          } else {
            return InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("API를 통해 데이터를 가져오는 중입니다", style: TextStyle(color: MyColors.white))),
                    SizedBox(height: 24.0),
                    MyLinearProgressIndicatorSimple(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

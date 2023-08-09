import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScreenEarthMap extends StatefulWidget {
  const ScreenEarthMap({super.key});

  @override
  State<ScreenEarthMap> createState() => ScreenEarthMapState();
}

class ScreenEarthMapState extends State<ScreenEarthMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlexCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _LakeCameraPosition = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  static const CameraPosition _AnyangCameraPosition = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.4027, 126.9279),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  static const LatLng _YeouidolatLng = LatLng(37.5233273, 126.921252);

  static const CameraPosition _YeouidoCameraPosition = CameraPosition(
    bearing: 233,
    target: _YeouidolatLng,
    tilt: 0.0,
    zoom: 15,
  );
  static const CameraPosition _SouthKoreaCameraPosition = CameraPosition(
    bearing: 0,
    target: LatLng(35.9078, 127.7669),
    tilt: 0,
    zoom: 7,
  );
  static const CameraPosition _initialCameraPosition = CameraPosition(
    bearing: 0, //숫자가 커질수록 반시계방향으로 돈다.
    target: LatLng(35.9078, 127.7669),
    tilt: 0, //지형을 보고자 할때 쓰면 될 것 같다.
    zoom: 0,
  );

  final List<MapType> mapTypes = [
    MapType.normal, //심플 지도
    MapType.terrain, //지형 지도
    MapType.satellite, //위성 지도
    MapType.hybrid, //하이브리드 느낌의 지도
  ];
  late MapType currentMapType;
  late int currentIndex;

  late bool IsMyLocationDisplay;



  @override
  void initState() {
    // currentIndex =0;//before 코드
    currentIndex = mapTypes.indexOf(MapType.hybrid); //after 코드, MapType.hybrid 가 제일 있어보여서 default로 선정하였다.
    IsMyLocationDisplay=false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '타이틀',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      //   useMaterial3: true,
      // ),
      home: Scaffold(
        extendBodyBehindAppBar: true, //app bar 컬러를 반투명 하게 위한 코드
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,//app bar 컬러를 투명색으로 하기 위한 코드
          // title: const Text('반투명앱바'),
          backgroundColor: Colors.black.withOpacity(0.3),
          // backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*왼쪽서랍*/ Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(Icons.menu), tooltip: "왼쪽서랍",
                    );
                  },
                ),
                /*오른쪽서랍*/ Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(Icons.menu), tooltip: "오른쪽서랍",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black.withOpacity(0.3),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(5.0),
              border: const Border(
                top: BorderSide(color: Colors.black, width: 3.0),
                bottom: BorderSide(color: Colors.black, width: 3.0),
                left: BorderSide(color: Colors.black, width: 3.0),
                right: BorderSide(color: Colors.black, width: 3.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                GestureDetector(
                  onTap: _goToSouthKorea,
                  child: Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5.0),
                      border: const Border(
                        top: BorderSide(color: Colors.black, width: 1.5),
                        bottom: BorderSide(color: Colors.black, width: 1.5),
                        left: BorderSide(color: Colors.black, width: 1.5),
                        right: BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "_goToSouthKorea",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _goToTheLake,
                  child: Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5.0),
                      border: const Border(
                        top: BorderSide(color: Colors.black, width: 1.5),
                        bottom: BorderSide(color: Colors.black, width: 1.5),
                        left: BorderSide(color: Colors.black, width: 1.5),
                        right: BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "_goToTheLake",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _toogleMapType,
                  child: Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5.0),
                      border: const Border(
                        top: BorderSide(color: Colors.black, width: 1.5),
                        bottom: BorderSide(color: Colors.black, width: 1.5),
                        left: BorderSide(color: Colors.black, width: 1.5),
                        right: BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "_toogleMapType",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _toogleIsMyLocationDisplay,
                  child: Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5.0),
                      border: const Border(
                        top: BorderSide(color: Colors.black, width: 1.5),
                        bottom: BorderSide(color: Colors.black, width: 1.5),
                        left: BorderSide(color: Colors.black, width: 1.5),
                        right: BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "_toogleIsMyLocationDisplay",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapType: mapTypes[currentIndex],
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: IsMyLocationDisplay ? true : false,
              myLocationButtonEnabled: true,
            ),
            // /*커스텀서랍버튼*/Positioned(
            //   bottom: MediaQuery.of(context).size.height * 0.2,
            //   right: MediaQuery.of(context).size.width * 0.2,
            //   child: Builder(builder: (context) {
            //     /*Scaffold.of(context).openDrawer() 작동을 위해서 context 를 넘겨 받아야 해서 Builder() 를 사용*/
            //     return GestureDetector(
            //       onTap: () => Scaffold.of(context).openDrawer(),
            //       child: Container(
            //         height: 30,
            //         width: 300,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(10.0),
            //           border: const Border(
            //             top: BorderSide(color: Colors.black, width: 3.0),
            //             bottom: BorderSide(color: Colors.black, width: 3.0),
            //             left: BorderSide(color: Colors.black, width: 3.0),
            //             right: BorderSide(color: Colors.black, width: 3.0),
            //           ),
            //         ),
            //         child: const Center(
            //           child: Text(
            //             "Scaffold.of(context).openDrawer()",
            //             style: TextStyle(color: Colors.black),
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //       ),
            //     );
            //   }),
            // )
          ],
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_LakeCameraPosition));
  }

  Future<void> _goToSouthKorea() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_SouthKoreaCameraPosition));
  }

  Future<void> _goToCurrentLocation() async {
    GoogleMapController controller = await _controller.future;

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    CameraPosition _currentLocation = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
    );

    await controller.animateCamera(CameraUpdate.newCameraPosition(_currentLocation));
  }



  void _toogleMapType() {
    setState(() {
      currentIndex = (currentIndex + 1) % mapTypes.length; //리스트 내부를 차례대로 무한히 순회하며 index를 가져오는 코드
      print("_________________________________$currentIndex"); //debug code
    });
  }

  void _toogleIsMyLocationDisplay() {
       //아무 의미없어진 함수. 토글 버튼만들때 재활용 하자.
      print("__________________________________toogleIsMyLocationDisplay() s"); //debug code
      IsMyLocationDisplay = !IsMyLocationDisplay;
      print(IsMyLocationDisplay);
      print("__________________________________toogleIsMyLocationDisplay() e"); //debug code
    }
}

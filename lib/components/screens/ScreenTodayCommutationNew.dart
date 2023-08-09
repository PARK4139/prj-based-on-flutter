import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScreenCommutationManagement extends StatefulWidget {
  const ScreenCommutationManagement({Key? key}) : super(key: key);

  @override
  _ScreenCommutationManagementState createState() => _ScreenCommutationManagementState();
}

class _ScreenCommutationManagementState extends State<ScreenCommutationManagement> {
  GoogleMapController? mapController;

  static const LatLng _YeouidolatLng = LatLng(37.5233273, 126.921252);
  static const LatLng _SouthKoreaLatLng = LatLng(35.9078, 127.7669);
  static const LatLng checkableCircleLatLng = LatLng(37.4027, 126.9279);
  static const LatLng anyangLatLng = LatLng(37.4027, 126.9279);
  static const CameraPosition _YeouidoCameraPosition = CameraPosition(bearing: 233, target: _YeouidolatLng, tilt: 0.0, zoom: 15);
  static const CameraPosition _AnyangCameraPosition = CameraPosition(bearing: 192.8334901395799, target: anyangLatLng, tilt: 59.440717697143555, zoom: 19.151926040649414);
  static const CameraPosition _SouthKoreaCameraPosition = CameraPosition(bearing: 0, target: _SouthKoreaLatLng, tilt: 0, zoom: 7);
  static const CameraPosition _initialCameraPosition = CameraPosition(bearing: 0, target: checkableCircleLatLng, tilt: 0, zoom: 16);
  static const CameraPosition initialPosition = CameraPosition(bearing: 0, target: checkableCircleLatLng, tilt: 0, zoom: 16);
  static final double okDistance = 100;
  static final Circle checkableCircle = Circle(circleId: CircleId('withinDistanceCircle'), center: checkableCircleLatLng, fillColor: Colors.blue.withOpacity(0.5), radius: okDistance, strokeColor: Colors.blue, strokeWidth: 1);
  static final Circle uncheckableCircle = Circle(circleId: CircleId('notWithinDistanceCircle'), center: checkableCircleLatLng, fillColor: Colors.red.withOpacity(0.5), radius: okDistance, strokeColor: Colors.red, strokeWidth: 1);
  static final Circle checkedinCircle = Circle(circleId: CircleId('checkedinCircle'), center: checkableCircleLatLng, fillColor: Colors.green.withOpacity(0.5), radius: okDistance, strokeColor: Colors.green, strokeWidth: 1);
  static final Circle checkedOutCircle = Circle(circleId: const CircleId('checkedOutCircle'), center: checkableCircleLatLng, fillColor: Colors.white.withOpacity(0.5), radius: okDistance, strokeColor: Colors.white, strokeWidth: 1);
  static final Marker marker = Marker(markerId: MarkerId('marker'), position: checkableCircleLatLng);

  final List<MapType> mapTypes = [
    MapType.normal, //심플 지도
    MapType.terrain, //지형 지도
    MapType.satellite, //위성 지도
    MapType.hybrid //하이브리드 느낌의 지도
  ];
  late MapType currentMapType;
  late int currentIndex;

  bool isClientLocationServiceAndLocationPermissionAllowed = false;

  bool IsClientCheckedIn = false;
  bool IsClientCheckedOut = false;

  var isWithinChecableRange;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var gps = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

          mapController!.animateCamera(CameraUpdate.newLatLng(LatLng(gps.latitude, gps.longitude)));
        },
        child: Icon(
          Icons.my_location,
          color: Colors.blue.shade900,
        ),
        backgroundColor: Colors.white,
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
              /*위치권한허용버튼*/ GestureDetector(
                onTap: _determinePositionPermission,
                child: Container(
                  height: 30,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5.0),
                    border: const Border(top: BorderSide(color: Colors.black, width: 1.5), bottom: BorderSide(color: Colors.black, width: 1.5), left: BorderSide(color: Colors.black, width: 1.5), right: BorderSide(color: Colors.black, width: 1.5)),
                  ),
                  child: const Center(
                    child: Text("위치권한허용", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                  ),
                ),
              ),
              /*지도위치 토글*/ GestureDetector(
                onTap: _toogleMapType,
                child: Container(
                  height: 30,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5.0),
                    border: const Border(top: BorderSide(color: Colors.black, width: 1.5), bottom: BorderSide(color: Colors.black, width: 1.5), left: BorderSide(color: Colors.black, width: 1.5), right: BorderSide(color: Colors.black, width: 1.5)),
                  ),
                  child: const Center(
                    child: Text("지도모드 순환", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                  ),
                ),
              ),
              /*내 위치*/ GestureDetector(
                onTap: () async {
                  if (mapController == null) {
                    return;
                  }

                  final location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

                  mapController!.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(
                        location.latitude,
                        location.longitude,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 30,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5.0),
                    border: const Border(top: BorderSide(color: Colors.black, width: 1.5), bottom: BorderSide(color: Colors.black, width: 1.5), left: BorderSide(color: Colors.black, width: 1.5), right: BorderSide(color: Colors.black, width: 1.5)),
                  ),
                  child: const Center(
                    child: Text("내 위치", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                  ),
                ),
              ),
              /*화면 중심 위치*/ GestureDetector(
                onTap: () async {},
                child: Container(
                  height: 30,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5.0),
                    border: const Border(top: BorderSide(color: Colors.black, width: 1.5), bottom: BorderSide(color: Colors.black, width: 1.5), left: BorderSide(color: Colors.black, width: 1.5), right: BorderSide(color: Colors.black, width: 1.5)),
                  ),
                  child: const Center(
                    child: Text("화면 중심 위치", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.1,
        backgroundColor: Colors.white.withOpacity(0.9),
        // backgroundColor: Colors.black.withOpacity(0.3),
        foregroundColor: Colors.white,
        title: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('오늘도 근태관리', style: TextStyle(color: Colors.blue.shade900)),
            ],
          ),
        ),
        leading: /*왼쪽 지도기능 서랍버튼*/ Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu, color: Colors.blue.shade900.withOpacity(0.95)),
              tooltip: "왼쪽 지도기능 서랍버튼",
            );
          },
        ),
        actions: [
          /*오른쪽 지도기능 더보기버튼*/ Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.more_vert, color: Colors.blue.shade900.withOpacity(0.95)),
                tooltip: "오른쪽 지도 기능더보기버튼",
              );
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      //앱바 배경 반투명 설정
      body: FutureBuilder<String>(
        future: _determineLocationPermission(), //FutureBuilder() 의 future 에는 future 를 return하는 함수를 바인딩 해야합니다.
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          /*클라이언트 위치사용불허 루틴(ConnectionState.deniedForever) 의 경우 이 루틴을 벗어나기 위해서는 사용자가 앱을 재설치를 해야함.*/
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == '위치 권한이 허가 되었습니다.') {
            return StreamBuilder<Position>(
              stream: Geolocator.getPositionStream(), //현재위치가 바뀌는 이벤트를 수신하여 동작한다. 이게 StreamBuilder() 을 사용하는 큰이유이지 않을 까 싶다
              builder: (context, snapshot) {
                bool isWithinChecableRange = false;
                /*파랑서클 내에 있는지 빨간서클 내에 있는지 비교*/
                if (snapshot.hasData) {
                  final start = snapshot.data!;
                  print("start:${start}"); // myVariable
                  final end = checkableCircleLatLng;
                  print("end:${end}");

                  final distance = Geolocator.distanceBetween(
                    start.latitude,
                    start.longitude,
                    end.latitude,
                    end.longitude,
                  );

                  if (distance < okDistance) {
                    isWithinChecableRange = true;
                  }
                }
                return Column(
                  children: [
                    // SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight), //appBar 높이 만큼을 빈공간을 넣는다.
                    _MyGoogleMap(
                      initialPosition: initialPosition,
                      circle: IsClientCheckedOut
                          ? checkedOutCircle
                          : IsClientCheckedIn
                              ? checkedinCircle
                              : isWithinChecableRange
                                  ? checkableCircle
                                  : uncheckableCircle,
                      marker: marker,
                      onMapCreated: onMapCreated,
                      mapTypes: mapTypes,
                      currentIndex: currentIndex,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    if (isClientLocationServiceAndLocationPermissionAllowed == false)
                      /*위치권한허용*/ GestureDetector(
                        onTap: () {
                          // final result = checkLocationPermisstion();
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width - 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                right: BorderSide(width: 1, color: Colors.blue.shade900),
                                bottom: BorderSide(width: 1, color: Colors.blue.shade900),
                                left: BorderSide(width: 1, color: Colors.blue.shade900),
                                top: BorderSide(width: 1, color: Colors.blue.shade900),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                '위치권한허용',
                                style: TextStyle(color: Colors.blue.shade900),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    /*출근*/ if (!IsClientCheckedIn && isWithinChecableRange)
                      GestureDetector(
                        onTap: () {
                          onCheckInButtonPressed(isWithinChecableRange: isWithinChecableRange);
                        },
                        child: Builder(builder: (context) {
                          // final Color stateColor = IsClientCheckedIn
                          //     ? Colors.green
                          //     : isWithinChecableRange
                          //     ? Colors.blue.shade900
                          //     : Colors.red;
                          // Color stateColor;
                          // if (IsClientCheckedIn) {
                          //   stateColor = Colors.green;
                          // if (IsClientCheckedOut) {
                          //   stateColor = Colors.white;
                          // }
                          // } else {
                          // stateColor = Colors.blue.shade900;
                          // stateColor = Colors.red;
                          // }
                          final Color stateColor = Colors.blue.shade900;
                          return Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border(
                                  right: BorderSide(width: 1, color: stateColor),
                                  bottom: BorderSide(width: 1, color: stateColor),
                                  left: BorderSide(width: 1, color: stateColor),
                                  top: BorderSide(width: 1, color: stateColor),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(textAlign: TextAlign.center, '출근', style: TextStyle(color: stateColor)),
                              ],
                            ),
                          );
                        }),
                      ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    /*퇴근*/ if (!IsClientCheckedOut && isWithinChecableRange)
                      GestureDetector(
                        onTap: () {
                          onCheckOutButtonPressed(isWithinChecableRange: isWithinChecableRange);
                        },
                        child: Builder(builder: (context) {
                          final Color stateColor = IsClientCheckedOut
                              ? Colors.green
                              : isWithinChecableRange
                                  ? Colors.blue.shade900
                                  : Colors.red;
                          return Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border(
                                  right: BorderSide(width: 1, color: stateColor),
                                  bottom: BorderSide(width: 1, color: stateColor),
                                  left: BorderSide(width: 1, color: stateColor),
                                  top: BorderSide(width: 1, color: stateColor),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(textAlign: TextAlign.center, '퇴근', style: TextStyle(color: stateColor)),
                              ],
                            ),
                          );
                        }),
                      ),
                  ],
                );
              },
            );
          }

          return Center(
            child: Text(snapshot.data),
          );
        },
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  onCheckInButtonPressed({required bool isWithinChecableRange}) async {
    final clientAnswer = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(
            Icons.info_outlined,
            color: Colors.blue.shade900,
          ),
          content: Text('정말로 출근을 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                if (isWithinChecableRange == true) {
                  // DB 에 insert 되도록 추가 작업필요
                  setState(() {
                    IsClientCheckedIn = true;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 2000), content: Text('출근처리 되었습니다.')));
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 2000), content: Text('출근 가능한 장소가 아닙니다.\n출근처리 가능한 영역으로 이동해주세요.')));
                }
              },
              child: Text('출근'),
            ),
          ],
        );
      },
    );
  }

  onCheckOutButtonPressed({required bool isWithinChecableRange}) async {
    final clientAnswer = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Icon(
              Icons.info_outlined,
              color: Colors.blue.shade900,
            ),
            content: Text('정말로 퇴근을 하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('취소'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  if (IsClientCheckedIn == false) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 2000), content: Text('출근처리를 하셔야 퇴근처리가 가능합니다.\n출근처리를 수행해주세요.')));
                  } else {
                    if (isWithinChecableRange == true) {
                      setState(() {
                        IsClientCheckedOut = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 2000), content: Text('퇴근처리 되었습니다.')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 2000), content: Text('퇴근 가능한 장소가 아닙니다.\n퇴근처리 가능한 영역으로 이동해주세요.')));
                    }
                  }
                },
                child: Text('퇴근'),
              ),
            ],
          );
        });
  }

  Future<String> _determineLocationPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return '위치 서비스를 활성화 해주세요.';
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();

    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 세팅에서 허가해주세요.';
    }

    isClientLocationServiceAndLocationPermissionAllowed = true;
    return '위치 권한이 허가 되었습니다.';
  }

  AppBar renderAppBarViaCodeFactory() {
    return AppBar(
      title: const Text(
        '오늘도 출근',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
      actions: const [],
    );
  }

  void _toogleMapType() {
    setState(() {
      currentIndex = (currentIndex + 1) % mapTypes.length; //리스트 내부를 차례대로 무한히 순회하며 index를 가져오는 코드
      print("__________________________________________________________________ ${currentIndex}");
    });
  }

  Future<Position> _determinePositionPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('_________________________________ Location services are disabled._________________________________');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('_________________________________ Location permissions are denied _________________________________ ');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('_________________________________ Location permissions are permanently denied, we cannot request permissions. _________________________________ ');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    print("_________________________________ location permissions are granted _________________________________");
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<String> checkLocationPermisstion() async {
    //위치권한
    final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled(); //모바일 시스템 상에서 하로 스와이핑 시 아이콘과 연등되는 것으로 생각하면 된다.
    if (!isLocationServiceEnabled) {
      return _MyMents.pleaseMakeLocationServiceAble;
    }
    LocationPermission locationPermission = await Geolocator.checkPermission(); //현재 앱의 위치서비스 권한
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return _MyMents.pleaseDetermineLocationPermission;
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return _MyMents.pleaseDetermineLocationPermissionAtSetting;
    }

    return _MyMents.LocationPermissionsIsGranted;
  }
}

Future<String> checkPermisstion() async {
  //위치권한
  final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled(); //모바일 시스템 상에서 하로 스와이핑 시 아이콘과 연등되는 것으로 생각하면 된다.
  if (!isLocationServiceEnabled) {
    return _MyMents.pleaseMakeLocationServiceAble;
  }
  LocationPermission locationPermission = await Geolocator.checkPermission(); //현재 앱의 위치서비스 권한
  if (locationPermission == LocationPermission.denied) {
    locationPermission = await Geolocator.requestPermission();

    if (locationPermission == LocationPermission.denied) {
      return _MyMents.pleaseDetermineLocationPermission;
    }
  }

  if (locationPermission == LocationPermission.deniedForever) {
    return _MyMents.pleaseDetermineLocationPermissionAtSetting;
  }

  return _MyMents.LocationPermissionsIsGranted;
}

class _MyCircleId {
  static String commutingCheckableCircle = "commutingCheckableCircle";
}

class _MyMarkerId {
  static String commutingCheckableCircle = "commutingCheckableCircle";
}

class _MyMents {
  static String pleaseMakeLocationServiceAble = "위치 서비스 사용을 활성화 해주세요.";
  static String pleaseDetermineLocationPermission = "위치 권한을 허가해주세요.";
  static String pleaseDetermineLocationPermissionAtSetting = "위치 권한을 설정에서 허가해주세요.";
  static String LocationPermissionsIsGranted = '위치 권한이 허가 되었습니다.';
}

class _MyGoogleMap extends StatelessWidget {
  final CameraPosition _initialCameraPosition;
  final Circle circle;
  final Marker marker;
  final MapCreatedCallback onMapCreated;

  List<MapType> mapTypes;

  int currentIndex;

  _MyGoogleMap({
    required CameraPosition initialPosition,
    required this.circle,
    required this.marker,
    required this.onMapCreated,
    Key? key,
    required this.mapTypes,
    required this.currentIndex,
  })  : _initialCameraPosition = initialPosition,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: GoogleMap(
        mapType: mapTypes[currentIndex],
        initialCameraPosition: _initialCameraPosition,
        myLocationEnabled: true,
        /*내 위치 커스텀버튼으로 대체*/
        myLocationButtonEnabled: false,
        /*확장좋은 코드*/
        circles: Set.from([circle]),
        markers: {marker},
        onMapCreated: onMapCreated,
      ),
    );
  }
}

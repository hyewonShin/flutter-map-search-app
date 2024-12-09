import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapApp extends StatefulWidget {
  final lat;
  final lon;

  const NaverMapApp({required this.lat, required this.lon});

  @override
  State<NaverMapApp> createState() => _NaverMapAppState();
}

class _NaverMapAppState extends State<NaverMapApp> {
  bool _isInitialized = false; // NaverMapSdk 초기화 상태
  final Completer<NaverMapController> _mapControllerCompleter = Completer();

  @override
  void initState() {
    super.initState();
    _initialize(); // 초기화 시작
  }

  Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    try {
      await NaverMapSdk.instance.initialize(
        clientId: '', // 클라이언트 ID 설정
      );
      setState(() {
        _isInitialized = true; // 초기화 완료 상태 업데이트
      });
    } catch (e) {
      log("NaverMapSdk 초기화 실패: $e", name: "NaverMapApp");
    }
  }

  @override
  Widget build(BuildContext context) {
    // NaverMapController 객체의 비동기 작업 완료를 나타내는 Completer 생성
    final Completer<NaverMapController> mapControllerCompleter = Completer();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NaverMap(
          options: NaverMapViewOptions(
            initialCameraPosition: NCameraPosition(
                target: NLatLng(widget.lat, widget.lon),
                zoom: 10,
                bearing: 0,
                tilt: 0),
            indoorEnable: true, // 실내 맵 사용 가능 여부 설정
            locationButtonEnable: true, // 위치 버튼 표시 여부 설정
            consumeSymbolTapEvents: true, // 심볼 탭 이벤트 소비 여부 설정
          ),
          onMapReady: (controller) async {
            // 마커 생성
            final marker =
                NMarker(id: "test", position: NLatLng(widget.lat, widget.lon));

            // 지도에 마커 추가
            controller.addOverlay(marker);

            // 지도 준비 완료 시 호출되는 콜백 함수
            mapControllerCompleter
                .complete(controller); // Completer에 지도 컨트롤러 완료 신호 전송
            log("onMapReady", name: "onMapReady");
          },
        ),
      ),
    );
  }
}

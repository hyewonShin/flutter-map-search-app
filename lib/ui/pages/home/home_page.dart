import 'package:flutter/material.dart';
import 'package:flutter_map_search_app/core/geolocator_helper.dart';
import 'package:flutter_map_search_app/ui/pages/home/vworld_view_model.dart';
import 'package:flutter_map_search_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_map_search_app/ui/pages/home/widgets/Location_item.dart';
import 'package:flutter_map_search_app/ui/pages/home_detail/home_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            title: Consumer(builder: (context, ref, child) {
              return TextField(
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    final naverViewModel = ref.read(homeViewModel.notifier);
                    naverViewModel.searchMap(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: '입력해주세요',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 13),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              );
            }),
            actions: [
              Consumer(builder: (context, ref, child) {
                final viewModel = ref.read(vworldViewModel.notifier);
                ref.watch(vworldViewModel);
                final naverViewModel = ref.read(homeViewModel.notifier);

                return GestureDetector(
                  onTap: () async {
                    // 현재 위치 얻기
                    final position = await GeolocatorHelper.getPosition();

                    if (position != null) {
                      // vworld로 위경도로 주소 찾기
                      await viewModel.searchByLocation(
                        position.latitude,
                        position.longitude,
                      );

                      // Notifier가 관리하는 state(상태) 값을 읽어오기
                      final vworldResult = ref.read(vworldViewModel);

                      if (vworldResult.isNotEmpty) {
                        // 주소 결과를 사용하여 naverViewModel.searchMap 호출
                        naverViewModel.searchMap(vworldResult.toString());
                      }
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Icon(Icons.gps_fixed),
                  ),
                );
              }),
            ],
          ),
          body: Consumer(builder: (context, ref, child) {
            final addresses = ref.watch(homeViewModel);
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: addresses.length,
              itemBuilder: (BuildContext context, int index) {
                final data = addresses[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        String? validLink = data.link.length >= 5 &&
                                data.link.substring(0, 5) == "https"
                            ? data.link
                            : null;
                        return HomeDetailPage(
                          link: validLink,
                          title: data.title,
                          lat: data.lat,
                          lon: data.lon,
                        );
                      }));
                    },
                    child: item(data));
              },
            );
          })),
    );
  }
}

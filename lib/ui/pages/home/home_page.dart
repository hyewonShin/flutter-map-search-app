import 'package:flutter/material.dart';
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
          appBar: AppBar(
            title: Consumer(builder: (context, ref, child) {
              return TextField(
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    final viewModel = ref.read(homeViewModel.notifier);
                    viewModel.searchMap(value);
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
              GestureDetector(
                onTap: () {
                  print('위경도 아이콘 클릭');
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                  child: Icon(Icons.gps_fixed),
                ),
              )
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

                        return HomeDetailPage(validLink);
                      }));
                    },
                    child: item(data));
              },
            );
          })),
    );
  }
}

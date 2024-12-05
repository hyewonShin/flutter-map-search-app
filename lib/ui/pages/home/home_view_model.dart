import 'dart:async';

import 'package:flutter_map_search_app/data/model/location.dart';
import 'package:flutter_map_search_app/data/repository/location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AutoDisposeNotifier<List<Location>> {
  @override
  List<Location> build() {
    return [];
  }

  final locationRepository = LocationRepository();

  void searchMap(String query) async {
    final result = await locationRepository.findMap(query);

    state = result;
  }
}

final homeViewModel =
    NotifierProvider.autoDispose<HomeViewModel, List<Location>>(() {
  return HomeViewModel();
});

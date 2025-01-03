// 1. 상태클래스 만들기
// List<String>

// 2. 뷰모델 만들기
import 'package:flutter_map_search_app/data/repository/vworld_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VworldViewModel extends AutoDisposeNotifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  final vworldRepository = VworldRepository();

  void searchByName(String query) async {
    final result = await vworldRepository.findByName(query);
    state = result;
  }

  Future<void> searchByLocation(double lat, double lng) async {
    final result = await vworldRepository.findByLatLng(lat, lng);
    state = result;
  }
}

// 3. 뷰모델 관리자 만들기
final vworldViewModel =
    NotifierProvider.autoDispose<VworldViewModel, List<String>>(() {
  return VworldViewModel();
});

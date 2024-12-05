import 'package:flutter_map_search_app/data/model/location.dart';
import 'package:flutter_map_search_app/data/repository/base_remote_repository.dart';

class LocationRepository extends BaseRemoteRepository {
  Future<List<Location>> findMap(String query) async {
    final response = await client.get('', queryParameters: {
      'query': query,
      'display': 5,
    });

    if (response.statusCode == 200) {
      final items = response.data['items'] as List;

      final result = items.map((e) {
        return Location.fromJson(e);
      }).toList();

      return result;
    }

    return [];
  }
}

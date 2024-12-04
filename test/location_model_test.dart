import 'dart:convert';

import 'package:flutter_map_search_app/data/model/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String jsonString = """
  {
      "title": "<b>강남</b>구청",
      "link": "http://www.gangnam.go.kr/",
      "category": "공공,사회기관>구청",
      "description": "",
      "telephone": "",
      "address": "서울특별시 강남구 삼성동 16-1 강남구청",
      "roadAddress": "서울특별시 강남구 학동로 426 강남구청",
      "mapx": "1270475020",
      "mapy": "375173050"
    }
  """;

  test('Location model convert test', () {
    Map<String, dynamic> map = jsonDecode(jsonString);
    Location location = Location.fromJson(map);

    expect(location.category, "공공,사회기관>구청");
  });
}

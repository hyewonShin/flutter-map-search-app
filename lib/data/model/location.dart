// {
//       "title": "<b>강남</b>구청",
//       "link": "http://www.gangnam.go.kr/",
//       "category": "공공,사회기관>구청",
//       "description": "",
//       "telephone": "",
//       "address": "서울특별시 강남구 삼성동 16-1 강남구청",
//       "roadAddress": "서울특별시 강남구 학동로 426 강남구청",
//       "mapx": "1270475020",
//       "mapy": "375173050"
// },

class Location {
  String title;
  String category;
  String roadAddress;
  String link;

  Location({
    required this.title,
    required this.category,
    required this.roadAddress,
    required this.link,
  });

  Location.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          category: map['category'],
          roadAddress: map['roadAddress'],
          link: map['link'],
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'roadAddress': roadAddress,
      'link': link,
    };
  }
}

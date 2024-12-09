import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_map_search_app/ui/pages/home_detail/widgets/naver_map.dart';

class HomeDetailPage extends StatelessWidget {
  final link;
  final title;
  final lat;
  final lon;

  HomeDetailPage({
    required this.link,
    required this.title,
    required this.lat,
    required this.lon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Expanded(
              flex: 1,
              child: NaverMapApp(lat: lat, lon: lon),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: link != null
                  ? InAppWebView(
                      initialSettings: InAppWebViewSettings(
                        mediaPlaybackRequiresUserGesture: true,
                        javaScriptEnabled: true,
                        userAgent:
                            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
                      ),
                      initialUrlRequest: URLRequest(
                        url: WebUri(link),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                          child: Text(
                        '사이트가 존재하지 않습니다 😂',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
            ),
            SizedBox(
              height: 20,
            )
          ]),
        ));
  }
}

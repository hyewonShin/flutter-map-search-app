import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeDetailPage extends StatelessWidget {
  final link;

  HomeDetailPage(this.link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeDetailPage'),
        ),
        body: link != null
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
            : Center(
                child: Text(
                '사이트가 존재하지 않습니다!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )));
  }
}

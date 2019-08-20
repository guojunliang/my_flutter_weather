import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  String _title;
  String _url;

  WebViewPage(this._title, this._url);

  @override
  State<StatefulWidget> createState() {
    return WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget._url,
        displayZoomControls: true,
        withJavascript: true,
        withLocalStorage: false,
        useWideViewPort: true,
        appBar: AppBar(title: Text(widget._title),),
        initialChild: Center(child: Text("初始化中。。。。"),));
  }
}
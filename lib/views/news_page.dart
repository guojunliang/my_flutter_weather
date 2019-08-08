import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsState();
  }
}

class NewsState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("新闻"),),
      body: Center(child: Text("新闻页面"),),);
  }
}
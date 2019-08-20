import 'package:flutter/material.dart';
import 'package:my_flutter_weather/views/progress_view.dart';
import 'dart:convert';
import 'package:my_flutter_weather/views/news_list_page.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsState();
  }
}

class NewsState extends State<NewsPage> {
  List tabs = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (tabs.length == 0) {
      return ProgressView();
    } else {
      return DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: _buildSearchView(),
              bottom: TabBar(
                  isScrollable: true, tabs: tabs.map<Widget>((dynamic title) {
                return Tab(text: title.toString(),);
              }).toList()),),
            body: TabBarView(children: tabs.map<Widget>((dynamic title) {
              return NewsListPage(type: title.toString(),);
            }).toList()),));
    }
  }

  Widget _buildSearchView() {
    return GestureDetector(
        onTap: () {},
        child: Container(padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.search, color: Colors.grey,),
              SizedBox(width: 10,),
              Expanded(
                  child: Text("搜你想要的",
                    style: TextStyle(color: Colors.grey, fontSize: 16),)),
              Text("热搜", style: TextStyle(color: Colors.blue, fontSize: 16))
            ],),));
  }

  //加载tabbar数据
  loadData() async {
//    final response =
//        await http.post(Api.NEWS_TITLE_JS, body: {'appkey': Api.APPKEY_JS});
    String data = '{"status":0,"msg":"ok","result":["头条","新闻","国内","国际","政治","财经","体育","娱乐","军事","教育","科技","NBA","股票","星座","女性","健康","育儿"]}';
//    print("======response:" + response.body);
    Map map = json.decode(data);
    var list = map['result'];
    setState(() {
      tabs.addAll(list);
    });
  }
}
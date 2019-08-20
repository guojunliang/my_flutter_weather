import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_weather/api/api.dart';
import 'dart:convert';
import 'package:my_flutter_weather/modle/news_bean.dart';
import 'package:my_flutter_weather/routers/application.dart';
import 'package:my_flutter_weather/routers/routers.dart';

class NewsListPage extends StatefulWidget {
  String type;

  NewsListPage({this.type});

  @override
  State<StatefulWidget> createState() {
    return NewsListPageState(type);
  }

}


class NewsListPageState extends State<NewsListPage> {
  NewsListPageState(this.type);

  int start = 0; //开始位置
  String type;
  List<NewsItem> data = [null];
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        start = data.length - 1;
        _loadData();
      }
    });
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: _buildList(), onRefresh: _handleRefresh);
  }

  Widget _buildList() {
    return ListView.builder(controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        if (data[index] == null) {
          return Container(
            alignment: AlignmentDirectional.center,
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(strokeWidth: 2,),),);
        } else {
          return _getItem(index);
        }
      },
      itemCount: data.length,);
  }

  Widget _getItem(int index) {
    var newsItem = data[index];
    return GestureDetector(
      onTap: () {
        Application.router.navigateTo(context,
            "${Routers.pageWebView}?title=${Uri.encodeComponent(
                newsItem.title)}&url=${Uri.encodeComponent(newsItem.url)}");
      },
      child: Container(margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(newsItem.title, style: TextStyle(
                          fontSize: 18,
                          color: Colors.black
                      ), maxLines: 2, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5,),
                      Text("${newsItem.src} ${newsItem.time}",
                        style: TextStyle(fontSize: 13, color: Colors.grey),)
                    ],)),
              Image.network(
                newsItem.pic, height: 65, width: 95, fit: BoxFit.cover,),
            ],),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(height: 1, child: Container(color: Colors.grey,),),)
        ],),),);
  }

  Future<Null> _handleRefresh() async {
    start = 0;
    _loadData();
    return null;
  }


  void _loadData() async {
    if (start <= 0) {
      start = 0;
    }
    final response = await http.post(Api.NEWS_LIST_JS +
        "?channel=$type&appkey=${Api.APPKEY_JS}&start=$start}",);
    setState(() {
      print("response list:" + response.body);
      var decode = json.decode(response.body);
      var newsBean = NewsBean.fromJson(decode);
      var result = newsBean.result;
      if (result != null) {
        var list = result.list;
        if (list != null) {
          if (start == 0) {
            data.clear();
            data.add(null);
          }

          data.insertAll((data.length - 1), list);
        }
      }
    });
  }
}
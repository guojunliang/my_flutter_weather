import 'package:json_annotation/json_annotation.dart';

part 'news_bean.g.dart';

@JsonSerializable()
class NewsBean {
  final int status;
  final String msg;
  final NewResult result;

  NewsBean(this.status, this.msg, this.result);

  @override
  String toString() {
    return 'NewsBean{status: $status, msg: $msg, result: $result}';
  }

  factory NewsBean.fromJson(Map<String, dynamic> json){
    return _$NewsBeanFromJson(json);
  }

}

@JsonSerializable()
class NewResult {
  final String channel;
  final int num;
  final List<NewsItem> list;

  NewResult(this.channel, this.num, this.list);

  factory NewResult.fromJson(Map<String, dynamic> json){
    return _$NewResultFromJson(json);
  }

  @override
  String toString() {
    return 'NewResult{channel: $channel, num: $num, list: $list}';
  }

}

@JsonSerializable()
class NewsItem {
  final String title;
  final String time;
  final String src;
  final String category;
  final String pic;
  final String content;
  final String url;
  final String weburl;

  NewsItem(this.title, this.time, this.src, this.category, this.pic,
      this.content, this.url, this.weburl);

  factory NewsItem.fromJson(Map<String, dynamic> json){
    return _$NewsItemFromJson(json);
  }

}
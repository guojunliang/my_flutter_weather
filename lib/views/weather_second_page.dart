import "dart:async";
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:event_bus/event_bus.dart';

import 'package:flutter/material.dart';
import 'package:my_flutter_weather/modle/page_event.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_flutter_weather/modle/weather_bean.dart';
import 'package:my_flutter_weather/util/weather_icon_util.dart';
import 'package:my_flutter_weather/views/progress_view.dart';
import 'package:my_flutter_weather/views/weather_day_view.dart';

class WeatherSecondPage extends StatefulWidget {

  WeatherResult _weatherResult;

  WeatherSecondPage(this._weatherResult);

  @override
  State<StatefulWidget> createState() {
    return WeatherSecondPageState();
  }

}

class WeatherSecondPageState extends State<WeatherSecondPage> {
  bool imageLoaded = true;
  List<ui.Image> days = [];
  List<ui.Image> nights = [];
  bool top = false;
  StreamSubscription streamSubscription;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    top = false;
    //控制ListView的滑动属性
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //加载更多
//        print("滑动到底部");
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
//        print("滑动到顶部");
        setState(() {
          top = true;
        });
      } else {
        top = false;
      }
    });
    //接收pageview的滑动事件
    streamSubscription = eventBus.on<PageEvent>().listen((event) {
      setState(() {
        top = false;
      });
    });
    initDayImages();
    initNightImage();
  }

  @override
  Widget build(BuildContext context) {
    if (imageLoaded) {
      return Stack(fit: StackFit.expand, children: <Widget>[
        Image.asset("assets/images/second_bg.jpg", fit: BoxFit.cover,),
        SingleChildScrollView(scrollDirection: Axis.vertical,
          controller: _scrollController,
          physics: getScrollPhysics(top),
          child: Column(mainAxisSize: MainAxisSize.max,
            mainAxisAlignment:
            MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle("24小时预报"),
              _buildLine(),
              _buildHourWeather(widget._weatherResult),
              _buildLine(),
              _buildTitle("多天预报"),
              _buildLine(),
              _buildDaysWeather(widget._weatherResult),
              _buildLine(),
              _buildTitle("生活指数"),
              _buildLine(),
              _buildGridView(widget._weatherResult.index),
            ],),),
      ],);
    }
    else {
      return ProgressView();
    }
  }

//获得滑动系数
  ScrollPhysics getScrollPhysics(bool top){
    if(top){
      return NeverScrollableScrollPhysics();
    }else{
      return BouncingScrollPhysics();
    }
  }

  Widget _buildTitle(String title) {
    return Container(padding: EdgeInsets.all(10),
      child: Text(
        title, style: TextStyle(color: Colors.white, fontSize: 16),),);
  }

  Widget _buildLine({double height, Color color}) {
    return Container(height: height ?? 0.5, color: color ?? Colors.white70,);
  }

  Widget _buildDaysWeather(WeatherResult result) {
    return SingleChildScrollView(scrollDirection: Axis.horizontal,
      child: WeatherDayView(result.daily, days, nights),);
  }

  Widget _buildHourWeather(WeatherResult result) {
    List widgets = [];
    for (int i = 0; i < result.hourly.length; i++) {
      widgets.add(Text("text $i"));
    }
    return SizedBox(height: 120,
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return _buildHoureWeatherItem(result.hourly[index]);
      }, itemCount: widgets.length, scrollDirection: Axis.horizontal,),);
  }

  Widget _buildHoureWeatherItem(WeatherHourly hourly) {
    return Padding(padding: EdgeInsets.only(left: 15, right: 15), child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(hourly.time, style: TextStyle(color: Colors.white),),
        SizedBox(height: 10,),
        Image.asset(WeatherIconUtil.getImagePath(hourly.img), height: 30,),
        SizedBox(height: 10,),
        Text("${hourly.temp}℃", style: TextStyle(color: Colors.white),),
      ],),);
  }

  void initDayImages() async {
    var daily = widget._weatherResult.daily;
    for (int i = 0; i < daily.length; i++) {
      // ignore: unnecessary_statements
      var daily2 = daily[i];
      var img = daily2.day.img;
      var path = WeatherIconUtil.getImagePath(img);
      ByteData load = await rootBundle.load(path);
      await loadDayImage(Uint8List.view(load.buffer)).then((value) {
        days.add(value);
        if (days.length >= daily.length && nights.length >= daily.length) {
          imageLoaded = true;
          setState(() {

          });
        }
      });
    }
  }

  initNightImage() async {
    var daily = widget._weatherResult.daily;
    for (int i = 0; i < daily.length; i++) {
      var img = daily[i].night.img;
      var path = WeatherIconUtil.getImagePath(img);
      var load = await rootBundle.load(path);
      await loadDayImage(Uint8List.view(load.buffer)).then((value) {
        nights.add(value);
        if (days.length >= daily.length && nights.length >= daily.length) {
          imageLoaded = true;
          setState(() {

          });
        }
      });
    }
  }

  //加载白天天气图片
  Future<ui.Image> loadDayImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  _buildGridView(List<WeatherIndex> index) {
    return Container(child: GridView.builder(shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: index.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
        itemBuilder: (BuildContext context, int i) {
          return Container(height: 50,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                Text(index[i].ivalue,
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                SizedBox(height: 5,),
                Text(index[i].iname,
                  style: TextStyle(color: Colors.white, fontSize: 15),),
              ],),);
        }),);
  }
  @override
  void dispose() {
    top = false;
    if (streamSubscription != null) {
      streamSubscription.cancel();
    }
    // TODO: implement dispose
    super.dispose();
  }


}
import 'package:flutter/material.dart';
import 'package:my_flutter_weather/modle/weather_bean.dart';
import 'package:my_flutter_weather/views/progress_view.dart';
import 'package:my_flutter_weather/views/weather_first_page.dart';
import 'package:my_flutter_weather/views/weather_second_page.dart';
import 'package:my_flutter_weather/modle/page_event.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_flutter_weather/api/api.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeatherState();
  }
}

class WeatherState extends State<WeatherPage> {
  String city = "";
  String weatherJson = "";
  WeatherResult weatherResult;
  int loadState = 2; //0加载失败，1加载成功 2正在加载
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.position.pixels ==
          _pageController.position.extentInside) {
        eventBus.fire(PageEvent());
      }
    });
    _loadWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    if (weatherJson.isNotEmpty) {
      var decode = json.decode(weatherJson);
      print("decode:$decode");
      var weatherBean = WeatherBean.fromJson(decode);
      if (weatherBean.status == 0) {
        weatherResult = weatherBean.result;
        print("weatherBean:$weatherBean");
        loadState = 1;
      } else {
        loadState = 0;
      }
    }
    return Material(child: Column(children: <Widget>[
      buildBar(context),
      _buildeContent(context),
    ],),);
  }

  Widget _buildeContent(BuildContext context) {
//    loadState = 1;
    if (loadState == 2) {
      return ProgressView();
    } else if (loadState == 1) {
//      return   WeatherFirstPage();
      return
        Expanded(child: PageView(
          scrollDirection: Axis.vertical, controller: _pageController,
          children: <Widget>[
            WeatherFirstPage(weatherResult),
            WeatherSecondPage(),
          ],),);
    }
  }

  Widget buildBar(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, top: MediaQuery
            .of(context)
            .padding
            .top),
        height: MediaQuery
            .of(context)
            .padding
            .top + 40, color: Color(0xff022780),
        child: GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.add, size: 20, color: Colors.white,),
              SizedBox(width: 10,),
              Text(city, style: TextStyle(fontSize: 16, color: Colors.white),),
              SizedBox(width: 10,),
              Icon(Icons.location_on, size: 20, color: Colors.white,)
            ],),
          onTap: () {

          },));
  }

  Future<String> _loadWeatherData() async {
    if (city.isEmpty) {
      city = "杭州";
    }
    var response = await http.get(Api.WEATHER_QUERY + city);
    setState(() {
      weatherJson = response.body;
      print("json:$weatherJson");
    });
  }

}
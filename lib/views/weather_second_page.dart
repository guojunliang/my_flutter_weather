import 'package:flutter/material.dart';
import 'package:my_flutter_weather/modle/weather_bean.dart';
import 'package:my_flutter_weather/views/progress_view.dart';

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

  @override
  Widget build(BuildContext context) {
    if (imageLoaded) {
      return Stack(fit: StackFit.expand, children: <Widget>[
        Image.asset("assets/images/second_bg.jpg", fit: BoxFit.cover,),
        SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle("24小时预报"),
              _buildLine(),
              _buildHourWeather(widget._weatherResult),
            ],),),
      ],
      );
    }
    else {
      return ProgressView();
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

  Widget _buildHourWeather(WeatherResult result) {
    List widgets = [];
    for (int i = 0; i < result.hourly.length; i++) {
      widgets.add(Text("text $i"));
    }
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return widgets[index];
    }, itemCount: widgets.length, scrollDirection: Axis.horizontal,);
  }
}
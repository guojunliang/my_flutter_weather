import 'package:flutter/material.dart';
import 'package:my_flutter_weather/modle/weather_bean.dart';

class WeatherFirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeatherFirstPageState();
  }
}

class WeatherFirstPageState extends State<WeatherFirstPage> {
  @override
  Widget build(BuildContext context) {
//    return Image(image: AssetImage("assets/images/first.png"), fit: BoxFit.cover,);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(image: AssetImage("assets/images/first.png"), fit: BoxFit.cover,),
      ],
    );
  }
}
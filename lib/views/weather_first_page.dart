import 'package:flutter/material.dart';
import 'package:my_flutter_weather/modle/weather_bean.dart';

class WeatherFirstPage extends StatefulWidget {
  final WeatherResult _weatherResult;

  WeatherFirstPage(this._weatherResult);

  @override
  State<StatefulWidget> createState() {
    return WeatherFirstPageState();
  }
}

class WeatherFirstPageState extends State<WeatherFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(image: AssetImage("assets/images/first.png"), fit: BoxFit.cover,),
        Column(mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            SizedBox(height: 30,),
            _buildTop(widget._weatherResult),
          ],),
      ],
    );
  }

  Widget _buildTop(WeatherResult result) {
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(width: 200, height: 90,
              child: Stack(alignment: Alignment.center,
                fit: StackFit.expand,
                children: <Widget>[Positioned(child: Text(result.temp,
                  style: TextStyle(color: Colors.white, fontSize: 30),),
                  left: 10,),
                Positioned(child: Text("℃",
                  style: TextStyle(color: Colors.white, fontSize: 15),),
                  left: 50,
                  top: 5,),
                Positioned(child: Text(result.weather,
                  style: TextStyle(color: Colors.white, fontSize: 15),),
                  left: 50,
                  top: 50,),
                ],),),

          ],),
        Expanded(child: Container()),
        Container(width: 70,
          height: 30,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Color(0x4fffffff), borderRadius: BorderRadius.circular(3)),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Container(width: 2,
                height: 20,
                decoration: BoxDecoration(color: Colors.green,
                    borderRadius: BorderRadius.circular(1)),),
              Text(" ${result.aqi.quality} ${result.aqi.aqi}",
                style: TextStyle(color: Colors.white, fontSize: 16),)
            ],),)

      ],);
  }

  Widget _buildBottom(BuildContext context) {

  }
}
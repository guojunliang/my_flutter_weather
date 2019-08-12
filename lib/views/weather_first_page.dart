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
            Expanded(child: Text(""), flex: 1,),
            _buildBottom(widget._weatherResult),
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
                  style: TextStyle(color: Colors.white, fontSize: 60),),
                  left: 10,),
                Positioned(child: Text("℃",
                  style: TextStyle(color: Colors.white, fontSize: 15),),
                  left: 100,
                  top: 5,),
                Positioned(child: Text(result.weather,
                  style: TextStyle(color: Colors.white, fontSize: 15),),
                  left: 100,
                  top: 50,),
                ],),),
            Container(padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Color(0x4fffffff),
                  borderRadius: BorderRadius.circular(5)),
              child: Text("${result.winddirect} ${result.windpower} 湿度 ${result
                  .humidity}",
                style: TextStyle(color: Colors.white, fontSize: 20),),),

          ],),
        Expanded(child: Container()),
        Container(
          width: 70,
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

  Widget _buildBottom(WeatherResult result) {
    return Flex(direction: Axis.horizontal,
      children: <Widget>[
        Expanded(child: _buildBottomItem(result.daily[0]), flex: 1,),
        SizedBox(width: 20,),
        Expanded(child: _buildBottomItem(result.daily[1]), flex: 1,)
      ],);
//    return Row(children: <Widget>[
//
//      _buildBottomItem(result.daily[0]),
//      _buildBottomItem(result.daily[1])
//    ],);
  }

  Widget _buildBottomItem(WeatherDaily daily) {
    TextStyle _style = TextStyle(color: Colors.white, fontSize: 16);

    return Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("${daily.date}", style: _style,),
            Text(
              "${daily.day.temphigh}/${daily.night.templow}℃", style: _style,),
            Text("${daily.night.weather}", style: _style,),
          ],),
        Expanded(child: Text("")),
        Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Row(children: <Widget>[
            Text("良 ", style: _style),
            Container(
              width: 2,
              height: 20,
              decoration: BoxDecoration(color: Colors.green),)
          ],),
          Text("  "),
          Icon(Icons.wb_sunny, color: Colors.yellow,)
        ],),
      ],);
  }
}
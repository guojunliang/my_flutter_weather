import 'package:flutter/material.dart';

class WeatherSecondPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return WeatherSecondPageState();
  }

}

class WeatherSecondPageState extends State<WeatherSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text("second page"),);
  }
}
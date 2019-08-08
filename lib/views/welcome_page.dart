import 'package:flutter/material.dart';
import 'package:my_flutter_weather/views/app_home.dart';

//欢迎页面
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
        // ignore: missing_return
          MaterialPageRoute(builder: (context) {
           return AppHome();
          }), (route) => route == null);
    });
    return Scaffold(
      body: Container(child: Stack(
        children: <Widget>[
          Image(image: AssetImage("assets/images/welcome.jpg")),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            Expanded(child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(child: Text("My flutter weather"), bottom: 10,)
              ],), flex: 6,),
            Expanded(child: Text(""), flex: 4,),
          ],)
        ],)),);
  }
}
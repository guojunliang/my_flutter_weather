import 'package:flutter/material.dart';
import 'package:my_flutter_weather/views/weather_page.dart';
import 'package:my_flutter_weather/views/news_page.dart';
import 'package:my_flutter_weather/views/my_page.dart';

class AppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppHomeState();
  }

}

class AppHomeState extends State<AppHome> {
  List<Widget> _widgets = [];
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _widgets..add(WeatherPage())..add(NewsPage())..add(MyPage());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: IndexedStack(index: _currentIndex, children: _widgets,),
      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny), title: Text("天气")),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books), title: Text("新闻"),),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("我的")),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xff212121),
        iconSize: 25,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        onTap: _changeTab,),);
  }

  _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
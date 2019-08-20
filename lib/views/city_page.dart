import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter_weather/modle/city.dart';
import 'package:my_flutter_weather/routers/application.dart';

class CityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Color(0xff343434),
      leading: GestureDetector(
        child: Icon(Icons.arrow_back, color: Colors.white,), onTap: () {
        Application.router.pop(context);
      },),
      title: Text("选择城市"),), body: HomePage(),);
  }

}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CityPageState();
  }
}

class CityPageState extends State<HomePage> {
  List<City> resultCitys = [];
  List<City> citys = [];

  @override
  void initState() {
    super.initState();
    loadCity();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContentView();
  }

  Widget _buildContentView() {
    return Column(mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[_buildSearchView(), _buildResultView()],);
  }

  Widget _buildResultView() {
    return Expanded(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return GestureDetector(onTap: () {
          Navigator.of(context).pop(resultCitys[index].city);
        },
          child: Container(height: 40,
            child: Text("${resultCitys[index].city}"),
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,),);
      },
        itemCount: resultCitys.length, padding: EdgeInsets.all(10),),);
  }

  Widget _buildSearchView() {
    TextEditingController controller = TextEditingController();
    return Container(height: 60, padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container(
            height: 40,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "请输入城市名称"),),
            decoration: BoxDecoration(
                color: Color(0xfff3f3f3), borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5))),)),
          GestureDetector(onTap: () {
            var text = controller.value.text;
            _searchCity(text);
          }, child: Container(width: 40, height: 40, decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5))),
            child: Icon(Icons.search, size: 30, color: Colors.white,),)),
        ],),);
  }

  void loadCity() async {
    DefaultAssetBundle.of(context).loadString(
        "assets/json/city.json").then((value) {
      var cityBean = CityBean.formJson(json.decode(value));
      citys = cityBean.result;
    });
  }

  //加载城市信息
//  loadCitys() async {
//    Future<String> future = DefaultAssetBundle.of(context).loadString(
//        "assets/json/city.json");
//    future.then((value) {
//      CityBean cityBean = CityBean.formJson(json.decode(value));
//      citys.addAll(cityBean.result);
//    });
//  }


  void _searchCity(String cityName) {
    resultCitys.clear();
    if (cityName != null) {
      for (int i = 0; i < citys.length; i++) {
        var city = citys[i];
        if (city.city.contains(cityName)) {
          resultCitys.add(city);
        }
      }
    }
    setState(() {

    });
  }

}

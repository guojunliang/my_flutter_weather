import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  String msg = "Flutter Weather是一个flutter的练习项目，通过该项目算是对flutter有个基本的认知，当然也仅仅局限于基本。"
      "因为目前公司用不到，当做一个储备技能。需要的时候能够很快进入状态";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("关于我"),
      backgroundColor: Colors.blue,
      leading: Icon(Icons.person, color: Colors.white,),),
      body: Text(msg),);
  }

}
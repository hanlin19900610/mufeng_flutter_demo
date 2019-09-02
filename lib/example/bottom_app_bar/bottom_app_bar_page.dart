import 'package:flutter/material.dart';

import 'bottom_app_bar_demo.dart';
import 'bottom_app_bar_demo2.dart';

class BottomAppBarPage extends StatefulWidget {
  BottomAppBarPage({Key key}) : super(key: key);

  @override
  _BottomAppBarPageState createState() => _BottomAppBarPageState();
}

class _BottomAppBarPageState extends State<BottomAppBarPage> {
  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomAppBarDemo"),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index){
          return InkWell(
            child: Card(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                child: Text(routerName[index]),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, routeLists[index]);
            },
          );
        },
          itemCount: routers.length,
        ),
      ),
    );
  }
}

///路由名称
const routerName = [
  "BottomAppBarDemo",
  "BottomAppBarDemo2",
];

///路由集合
Map<String, WidgetBuilder> routers = {
  "bottom_app_bar_demo": (context) {
    return new BottomAppBarDemo();
  },
  "bottom_app_bar_demo2": (context){
    return BottomAppBarDemo2();
  }
};

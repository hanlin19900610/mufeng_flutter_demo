import 'package:flutter/material.dart';

import 'bottom_navigation_bar_keep_alive_widget.dart';
import 'bottom_navigation_bar_widget.dart';

class BottomNavigationBarPage extends StatefulWidget {
  BottomNavigationBarPage({Key key}) : super(key: key);

  @override
  _BottomNavigationBarPageState createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
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
  "BottomNavigationBarDemo",
  "BottomNavigationBarKeepAliveDemo",
];

///路由集合
Map<String, WidgetBuilder> routers = {
  "bottom_navigation_bar_widget": (context) {
    return new BottomNavigationBarWidget();
  },
  "bottom_navigation_bar_keep_alive_widget": (context){
    return BottomNavigationBarKeepAliveWidget();
  }
};

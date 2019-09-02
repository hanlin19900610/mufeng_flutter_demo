import 'package:flutter/material.dart';

import 'example/bottom_app_bar/bottom_app_bar_demo.dart';
import 'example/bottom_app_bar/bottom_app_bar_demo2.dart';
import 'example/bottom_app_bar/bottom_app_bar_page.dart';
import 'example/bottom_navigation_bar/bottom_navigation_bar_keep_alive_widget.dart';
import 'example/bottom_navigation_bar/bottom_navigation_bar_page.dart';
import 'example/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'example/custom_router_transition/custom_router_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MuFeng Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: totalRouters,
      home: MyHomePage(
        title: "MuFeng Flutter Demo",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Text(routerName[index]),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, routeLists[index]);
              },
            );
          },
          itemCount: routerName.length,
        ),
      ),
    );
  }
}

///路由名称
const routerName = [
  "BottomNavigationBar",
  "BottomAppBar",
];

///路由集合
Map<String, WidgetBuilder> routers = {
  "example/bottom_navigation_bar": (context) {
    return new BottomNavigationBarPage();
  },
  "example/bottom_app_bar": (context) {
    return BottomAppBarPage();
  },
  "example/custom_router_transition": (context) {
    return CustomRouterPage();
  }
};

///路由集合
Map<String, WidgetBuilder> totalRouters = {
  ///BottomNavigationBar
  "example/bottom_navigation_bar": (context) {
    return new BottomNavigationBarPage();
  },
  "bottom_navigation_bar_widget": (context) {
    return new BottomNavigationBarWidget();
  },
  "bottom_navigation_bar_keep_alive_widget": (context) {
    return BottomNavigationBarKeepAliveWidget();
  },

  ///BottomAppBar
  "example/bottom_app_bar": (context) {
    return BottomAppBarPage();
  },
  "bottom_app_bar_demo": (context) {
    return new BottomAppBarDemo();
  },
  "bottom_app_bar_demo2": (context) {
    return BottomAppBarDemo2();
  },

  ///自定义路由
  "example/custom_router_transition": (context) {
    return CustomRouterPage();
  }
};

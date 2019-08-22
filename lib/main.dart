import 'package:flutter/material.dart';

import 'widget/controller_demo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MuFeng Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      routes: routers,
      home: MyHomePage(title: "MuFeng Flutter Demo",),
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
  "Controller 例子",
];

///路由集合
Map<String, WidgetBuilder> routers = {
  "widget/controller": (context) {
    return new ControllerDemoPage();
  },
};
import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

import 'package:fluro_demo/config/routes.dart';
import 'package:fluro_demo/config/navigator_util.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //2秒后跳转到主页面
    Observable.timer(0, Duration(seconds: 2))
    .listen((_){
      NavigatorUtil.launch(context, Routes.home);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('我是闪屏页面'),
        ),
      ),
    );
  }
}
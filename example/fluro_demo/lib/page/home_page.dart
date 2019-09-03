import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:fluro_demo/utils/fluro_convert_util.dart';
import 'package:fluro_demo/model/Person.dart';
import 'package:fluro_demo/config/navigator_util.dart';
import 'package:fluro_demo/config/routes.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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

    String name = "来自第一个界面测试一下";
    int age = 14;
    double score = 6.4;
    bool sex = true;

    Person person = Person(
      name: name,
      age: age,
      sex: sex,
      score: score
    );

    String paramsJson = FluroConvertUtils.object2string(person);

    ///自定义转场动画
    var transition = (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return new ScaleTransition(
        scale: animation,
        child: new RotationTransition(
          turns: animation,
          child: child,
        ),
      );
    };

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(child: Text('这是主页'),),
          RaisedButton(
            child: Text('传递参数, 包含中文参数'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams, paramsJson: paramsJson);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 nativeModal'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.nativeModal);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 native'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.native);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 inFromLeft'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.inFromLeft);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 inFromRight'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.inFromRight);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 inFromBottom'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.inFromBottom);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 fadeIn'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.fadeIn);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 material'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.material);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 materialFullScreenDialog'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.materialFullScreenDialog);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 cupertino'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.cupertino);
            },
          ),
          RaisedButton(
            child: Text('框架 自带 转场动画 cupertinoFullScreenDialog'),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson, transition: TransitionType.cupertinoFullScreenDialog);
            },
          ),
          RaisedButton(
            child: Text('框架 自定义 转场动画 '),
            onPressed: (){
              NavigatorUtil.launch(context, Routes.demoParams,
                  paramsJson: paramsJson,
                  transition: TransitionType.custom,
                transitionDuration: const Duration(milliseconds: 600),
                transitionBuilder: transition
              );
            },
          ),
        ],
      ),
    );
  }
}
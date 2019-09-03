
import 'package:fluro/fluro.dart';

import 'package:fluro_demo/page/splash_page.dart';
import 'package:fluro_demo/page/home_page.dart';
import 'package:fluro_demo/page/demo_params_page.dart';

///闪屏页
var splashHandler = Handler(
  handlerFunc: (context, params) {
    return SplashPage();
  }
);

///首页
var homeHandler = Handler(
  handlerFunc: (context, params){
    return HomePage();
  }
);

///跳转传参数
var demoParamsHandler = Handler(
  handlerFunc: (context, params){
    String paramsJson = params['paramsJson']?.first;
    return DemoParamsPage(paramsJson: paramsJson,);
  }
);
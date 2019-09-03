import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handlers.dart';

class Routes {
  //闪屏页
  static String root = '/';

  //无参
  static String home = '/home';

  //传参的例子
  static String demoParams = '/demo_params';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ROUTE WAS NOT FOUND!!!');
      return null;
    });

    ///第一个参数是路由地址, 第二个参数是页面跳转和传参, 第三个参数是默认的转场动画,
    router.define(root, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(demoParams, handler: demoParamsHandler);
  }
}

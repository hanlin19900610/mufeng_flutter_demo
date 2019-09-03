import 'application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class NavigatorUtil {
  ///返回
  static void goBack(BuildContext context) {
    ///其实这边调用的是Navigator.pop(context)
    Application.router.pop(context);
  }

  ///带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  ///跳转界面
  static void launch(BuildContext context, String route,
      {bool replace = false,
      String paramsJson,
      bool clearStack = false,
      TransitionType transition,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    var cRoute = route;
    if (paramsJson != null && paramsJson.length > 0) {
      cRoute = '$route?paramsJson=$paramsJson';
    }
    Application.router.navigateTo(context, cRoute,
        replace: replace,
        transition: transition,
        transitionBuilder: transitionBuilder,
        transitionDuration: transitionDuration);
  }
}

import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {

  final Widget widget;

  CustomRoute(this.widget)
      : super(
      transitionDuration: const Duration(seconds: 2),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        //淡出过渡路由
        return FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animation, curve: Curves.fastLinearToSlowEaseIn)),
          child: child,
        );
      }
  );

}

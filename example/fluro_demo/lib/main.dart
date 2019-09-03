import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'config/routes.dart';
import 'config/application.dart';

void main() {

  //注册路由
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluro Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
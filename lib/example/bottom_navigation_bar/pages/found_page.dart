import 'package:flutter/material.dart';

class FoundPage extends StatelessWidget {
  FoundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发现"),
      ),
      body: Center(
        child: Text("我是发现页面"),
      ),
    );
  }
}

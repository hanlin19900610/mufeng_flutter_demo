import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
      ),
      body: Center(
        child: Text("我是消息界面"),
      ),
    );
  }
}

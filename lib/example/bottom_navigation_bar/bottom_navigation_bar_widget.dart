import 'package:flutter/material.dart';

import 'pages/found_page.dart';
import 'pages/home_page.dart';
import 'pages/message_page.dart';
import 'pages/mine_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() {
    return _BottomNavigationBarWidgetState();
  }
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;

  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(HomePage())
      ..add(MessagePage())
      ..add(FoundPage())
      ..add(MinePage());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '首页',
              style: TextStyle(color: _bottomNavigationColor),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '消息',
              style: TextStyle(color: _bottomNavigationColor),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.view_comfy,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '发现',
              style: TextStyle(color: _bottomNavigationColor),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '我的',
              style: TextStyle(color: _bottomNavigationColor),
            )),
      ],
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}

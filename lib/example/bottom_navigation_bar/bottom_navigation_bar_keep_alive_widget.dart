import 'package:flutter/material.dart';

import 'pages_keep_alive/found_page.dart';
import 'pages_keep_alive/home_page.dart';
import 'pages_keep_alive/message_page.dart';
import 'pages_keep_alive/mine_page.dart';

class BottomNavigationBarKeepAliveWidget extends StatefulWidget {
  BottomNavigationBarKeepAliveWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationBarKeepAliveWidgetState createState() {
    return _BottomNavigationBarKeepAliveWidgetState();
  }
}

class _BottomNavigationBarKeepAliveWidgetState
    extends State<BottomNavigationBarKeepAliveWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[HomePage(), MessagePage(), FoundPage(), MinePage()],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
        onTap: (index) {
          _controller.jumpToPage(index);

          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

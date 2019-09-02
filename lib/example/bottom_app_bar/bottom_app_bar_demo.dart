import 'package:flutter/material.dart';

import 'each_view.dart';

class BottomAppBarDemo extends StatefulWidget {
  BottomAppBarDemo({Key key}) : super(key: key);

  @override
  _BottomAppBarDemoState createState() {
    return _BottomAppBarDemoState();
  }
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _eachView = List();
    _eachView
      ..add(EachView(
        title: '首页',
      ))
      ..add(EachView(
        title: '我的',
      ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return EachView(title: '新页面');
          }));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.near_me),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
                icon: Icon(Icons.edit_location),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                })
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'each_view.dart';

class BottomAppBarDemo2 extends StatefulWidget {
  BottomAppBarDemo2({Key key}) : super(key: key);

  @override
  _BottomAppBarDemoState createState() {
    return _BottomAppBarDemoState();
  }
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo2> {
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
            return EachView(
              title: '新页面',
            );
          }));
        },
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        tooltip: 'Increment',
        child: DecoratedBox(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: SizedBox(
            height: 48,
            width: 48,
            child: Icon(
              Icons.add,
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.near_me),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.edit_location),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() {
    return _MessagePageState();
  }
}

class _MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("你多次按下按钮："),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}

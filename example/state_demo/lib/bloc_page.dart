import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BlocPage extends StatelessWidget {
  BlocPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of(context);
    final pageBloc = blocProvider.pageBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
          child: StreamBuilder(
            initialData: pageBloc.value,
            stream: pageBloc.stream,
            builder: (context, snapShot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have pushed the button this many times:'),
                  Text(
                    snapShot.data,
                    style: TextStyle(fontSize: 26.0, color: Colors.blue),
                  ),
                  RaisedButton(
                    child: Text('+'),
                    onPressed: () => pageBloc.add(),
                  ),
                  RaisedButton(
                    child: Text('-'),
                    onPressed: () => pageBloc.dec(),
                  ),
                  RaisedButton(
                    child: Text('跳转'),
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => BlocPage2())),
                  )
                ],
              );
            },
          )),
    );
  }
}


class BlocPage2 extends StatelessWidget {
  BlocPage2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBloc = BlocProvider.of(context).pageBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
          child: StreamBuilder(
            initialData: pageBloc.value,
            stream: pageBloc.stream,
            builder: (context, snapShot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have pushed the button this many times:'),
                  Text(
                    snapShot.data.toString(),
                    style: TextStyle(fontSize: 26.0, color: Colors.blue),
                  ),
                  RaisedButton(
                    child: Text('+'),
                    onPressed: () => pageBloc.add(),
                  ),
                  RaisedButton(
                    child: Text('-'),
                    onPressed: () => pageBloc.dec(),
                  ),
                  RaisedButton(
                    child: Text('返回'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
            },
          )),
    );
  }
}


class PageBloc {
  int _count = 0;

  var _subject = BehaviorSubject<int>();

  Stream<int> get stream => _subject.stream;

  int get value => _count;

  void dispose() {
    _subject.close();
  }

  void add() {
    _count++;
    _subject.add(_count);
  }

  void dec() {
    _count--;
    _subject.add(_count);
  }
}

class BlocProvider extends InheritedWidget {
  final PageBloc pageBloc = PageBloc();

  BlocProvider({Key key, Widget child}): super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static BlocProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(BlocProvider);
}
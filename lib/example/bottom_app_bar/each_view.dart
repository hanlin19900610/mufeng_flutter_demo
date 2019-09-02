import 'package:flutter/material.dart';

class EachView extends StatefulWidget {
  String title;
  EachView({
    Key key,
    this.title
  }) : super(key: key);

  @override
  _EachViewState createState() {
    return _EachViewState();
  }
}

class _EachViewState extends State<EachView> {
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
        title: Text(widget.title),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
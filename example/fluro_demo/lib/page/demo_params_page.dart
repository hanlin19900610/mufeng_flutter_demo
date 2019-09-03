import 'package:flutter/material.dart';
import 'package:fluro_demo/config/navigator_util.dart';
import 'package:fluro_demo/utils/fluro_convert_util.dart';

import 'package:fluro_demo/model/Person.dart';

class DemoParamsPage extends StatefulWidget {

  final String paramsJson;

  DemoParamsPage({Key key, this.paramsJson}) : super(key: key);

  @override
  _DemoParamsPageState createState() {
    return _DemoParamsPageState();
  }
}

class _DemoParamsPageState extends State<DemoParamsPage> {
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

    Person person = Person.fromJson(FluroConvertUtils.string2map(widget.paramsJson));
    print(person);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('name: ${person.name}'),
            Text('age: ${person.age}'),
            Text('sex: ${person.sex}'),
            Text('score: ${person.score}'),
            RaisedButton(
              child: Text('返回'),
              onPressed: (){
                NavigatorUtil.goBack(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
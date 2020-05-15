import 'package:flutter/material.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    print("LaunchPage ....");

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: true,
                onChanged: null,
              ),
              Text("abc"),
              Checkbox(
                value: false,
                onChanged: null,
              ),
              Text("efg")
            ],
          ),
          TextField(
            textAlign: TextAlign.center,
            autofocus: false,
            decoration: InputDecoration(hintText: "127.0.0.1"),
          ),
          TextField(
            textAlign: TextAlign.center,
            autofocus: false,
            decoration: InputDecoration(hintText: "6666"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text("go--->"),
                ),
              ),
            ],
          )
        ],
      ),
    );

    return MaterialApp(
      title: "LaunchPage MaterialApp",
      home: scaffold,
    );
  }
}

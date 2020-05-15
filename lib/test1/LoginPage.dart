import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginPage",
      home: Scaffold(
        appBar: AppBar(
          title: Text("登陆"),
        ),
        body: Column(
          children: <Widget>[
            Text("welcome to flutter"),
            TextField(
                onChanged: (value) {
                  print("TextField onChanged text: $value");
                  name = value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: "用户名")),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: login,
                    child: Text("登陆"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void login() {
    print("name: $name");
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MainActivityFlutterPage extends StatefulWidget {
  @override
  _MainActivityFlutterPageState createState() =>
      _MainActivityFlutterPageState();
}

class _MainActivityFlutterPageState extends State<MainActivityFlutterPage> {
  static String methodChannel_name = "app.methodChannel.shared.data";
  MethodChannel methodChannel = MethodChannel(methodChannel_name);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MainActivityFlutterPage ***",
      home: Scaffold(
        appBar: AppBar(
          title: Text("MainActivityFlutterPage"),
        ),
        body: RaisedButton(
          onPressed: openNativeActivity,
          child: Text("openNativeActivity"),
        ),
      ),
    );
  }

  void openNativeActivity() {
  }
}

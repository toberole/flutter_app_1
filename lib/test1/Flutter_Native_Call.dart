import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Flutter_Native_Call extends StatefulWidget {
  @override
  _Flutter_Native_CallState createState() => _Flutter_Native_CallState();
}

class _Flutter_Native_CallState extends State<Flutter_Native_Call> {
  static String methodChannel_name = "app.methodChannel.shared.data";
  MethodChannel methodChannel = MethodChannel(methodChannel_name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "Flutter_Native_Call",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter_Native_Call demo"),
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: methodChannel_dart_call_java,
                      child: Text("methodChannel_dart_call_java"),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: methodChannel_java_call_dart,
                      child: Text("methodChannel_java_call_dart"),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: null,
                      child: Text("btn3"),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: null,
                      child: Text("btn4"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /**
   * 触发java 调用 dart
   */
  void methodChannel_java_call_dart() {
    print("xxxxx methodChannel_java_call_dart ****");
  }

  /**
   * dart 调用 java
   */
  void methodChannel_dart_call_java() async {
    print("xxxxx methodChannel_dart_call_java ++++");
    var res =
        await methodChannel.invokeMethod("test_dart_call_java", [1, 2, 3]);
    if (res != null) {
      print("methodChannel_dart_call_java res:" + res);
    }
  }
}

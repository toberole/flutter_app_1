import 'package:flutter/material.dart';

class CheckBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CheckBoxPage_Title",
      home: new CheckBoxPageX(),
    );
  }
}

class CheckBoxPageX extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckBoxPageXState();
  }
}

class CheckBoxPageXState extends State<CheckBoxPageX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBoxPage"),
      ),
      body: Checkbox(value: true, onChanged: onChanged_x),
    );
  }

  void onChanged_x(bool isChecked) {
    print("isChecked: " + isChecked.toString());
  }
}

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:puzzle/metadata.dart';
import 'main.binding.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

@Binding('main.dart.xaml')
class MyAppState extends State<MyApp> {
  String platformVersion = 'Unknown';
  final String titleText = 'Hello World';
  int _inner(int v) {
    return 555555 + v;
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = "TEST";
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    var a = {"a": 23, "b": "2342"};
    print(_inner(a['a']));
    var list = [1, 2, 3, 4, 5, 6, 7, 8];
    return bindXDML(this, context, a, list);
  }
}

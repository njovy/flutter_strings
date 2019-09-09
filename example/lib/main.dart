import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:strings/strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message = 'Unknown';

  @override
  void initState() {
    super.initState();
    initMessages();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMessages() async {
    String message;
    // Platform messages may fail, so we use a try/catch PlatformException.
    String test = await Strings.getString("test");
    String testWithFormats =
        await Strings.getString("test_with_formats", args: ["TEST1", "TEST2"]);
    String testNonExists = await Strings.getString("testt");

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _message =
          'Strings.getString("test"):$test\nStrings.getString("test_with_formats", args: ["TEST1", "TEST2"]):$testWithFormats\nStrings.getString("testt"):$testNonExists';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('$_message\n'),
        ),
      ),
    );
  }
}

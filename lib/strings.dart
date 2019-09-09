import 'dart:async';

import 'package:flutter/services.dart';

class Strings {
  static const MethodChannel _channel =
  const MethodChannel('plugins.njovy.com/strings');

  static Future<String> getString(String key, {List<dynamic> args}) async {
    return await _channel
        .invokeMethod('getString', <String, dynamic>{"key": key, "args": args});
  }
}

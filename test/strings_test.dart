import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:strings/strings.dart';

void main() {
  const MethodChannel channel = MethodChannel('strings');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getString', () async {
    expect(await Strings.getString('app_name'), 'strings');
  });
}

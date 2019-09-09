# Strings

A Flutter plugin to access native resource strings on the app

## Usage
To use this plugin, add `strings` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

``` dart
// Import package
import 'package:strings/strings.dart';


// Access string with a given key
print(await Strings.getString("test"));

// Access string with a given key and arguments
await Strings.getString("test_with_formats", args: ["TEST1", "TEST2"])

// If a resource doesn't exist, it just returns a given key.
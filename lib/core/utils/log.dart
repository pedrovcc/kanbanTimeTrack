import 'dart:io';

import 'package:flutter/foundation.dart';

void printDebug(String msg) {
  if (kDebugMode && !Platform.environment.containsKey('FLUTTER_TEST')) {
    print(msg);
  }
}

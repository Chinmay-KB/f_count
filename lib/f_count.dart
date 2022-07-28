library f_count;

import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';

final Map<String, int> _callCounts = HashMap();

/// This is Dart equivalent of calling `console.count()` in JS.
/// To learn about how `console.count() works in JS, go through the
/// [MDN Docs]:https://developer.mozilla.org/en-US/docs/Web/API/console/count
String fCount(String? label) {
  final stackBytes = utf8.encode(StackTrace.current.toString());
  final locationHash = sha1.convert(stackBytes).toString();

  if (_callCounts.containsKey(locationHash)) {
    _callCounts.update(locationHash, (value) => _callCounts[locationHash]! + 1);
  } else {
    _callCounts[locationHash] = 1;
  }
  final logMessage =
      '${label ?? locationHash} rendered ${_callCounts[locationHash]} times';
  log(logMessage);
  return logMessage;
}

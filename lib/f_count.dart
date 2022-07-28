library f_count;

import 'dart:collection';
import 'dart:developer';

import 'package:stack_trace/stack_trace.dart';

final Map<String, int> _callCounts = HashMap();

/// This is Dart equivalent of calling `console.count()` in JS.
/// To learn about how `console.count() works in JS, go through the
/// [MDN Docs]:https://developer.mozilla.org/en-US/docs/Web/API/console/count
String fCount(String? label) {
  final trace = Trace.from(StackTrace.current);
  final callLocation = trace.frames[2].location;

  if (_callCounts.containsKey(callLocation)) {
    _callCounts.update(callLocation, (value) => _callCounts[callLocation]! + 1);
  } else {
    _callCounts[callLocation] = 1;
  }
  final logMessage =
      '${label ?? callLocation} rendered ${_callCounts[callLocation]} times';
  log(logMessage);
  return logMessage;
}

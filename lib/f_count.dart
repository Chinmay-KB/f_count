library f_count;

import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:stack_trace/stack_trace.dart';

final Map<String, int> _callCounts = HashMap();

/// This is Dart equivalent of calling `console.count()` in JS.
/// To learn about how `console.count() works in JS, go through the
/// [MDN Docs]:https://developer.mozilla.org/en-US/docs/Web/API/console/count
String fCount({String? label}) {
  final trace = Trace.from(StackTrace.current);
  var callString = '';
  for (final frame in trace.frames) {
    /// `package` is `flutter` means that the stacktrace depth has now exceeded
    /// that of the whole project, and is now at the framework level.
    /// `package` as null occurs when stacktrace depth is now at language level
    /// i.e - dart in this case. To make this package framework agnostic, this
    /// check is needed.
    /// Stack trace below this point will be the same, so they are redundant
    if (frame.package == null || frame.package == 'flutter') {
      break;
    } else {
      callString = callString + frame.location;
    }
  }
  final locationHash =
      label ?? sha1.convert(utf8.encode(callString)).toString();
  _callCounts.update(
    locationHash,
    (value) => value + 1,
    ifAbsent: () => 1,
  );

  final logMessage =
      '${label ?? locationHash} rendered ${_callCounts[locationHash]} times';
  log(logMessage);
  return logMessage;
}

/// Resets count for a particular label
void resetCount(String label) =>
    _callCounts.update(label, (value) => 0, ifAbsent: () => 0);

/// Resets all counts
void resetAllCounts() => _callCounts.clear();

library f_count;

import 'dart:collection';
import 'dart:developer';

import 'package:stack_trace/stack_trace.dart';

final Map<String, int> _callCounts = HashMap();

void fCount(String? label) {

  final trace = Trace.from(StackTrace.current);
  final callLocation = trace.frames[1].location;
  
  if (_callCounts.containsKey(callLocation)) {
    _callCounts.update(callLocation, (value) => _callCounts[callLocation]! + 1);
  } else {
    _callCounts[callLocation] = 1;
  }
  log('${label??callLocation}, ${_callCounts[callLocation]}');
}

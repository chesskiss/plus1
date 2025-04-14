// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> filterSelection(List<String>? selection) async {
  List<String> safeSelection = selection ?? [];
  List<String> filter = FFAppState().filter;

  List<bool> result =
      filter.map((item) => safeSelection.contains(item)).toList();

  FFAppState().update(() {
    FFAppState().selectedFilter = result;
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

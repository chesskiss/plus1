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

extension EnumTestExtension on Exclusivity {
  String serialize() {
    return this.toString().split('.').last;
  }
}

List<Exclusivity>? exclusiveTypes2Enums(List<String>? exclusivityInputs) {
  debugPrint('CheckPoint!:  excl 2 enum'); //$someVal

  List<Exclusivity> enumsList = [];

  if (exclusivityInputs?.contains("Exclusive Access") ?? false) {
    enumsList.add(Exclusivity.Exclusive);
  } else if (exclusivityInputs?.contains("Public") ?? false) {
    enumsList.add(Exclusivity.Public);
  }
  if (exclusivityInputs?.contains("Sponsorship") ?? false) {
    enumsList.add(Exclusivity.Sponsorship);
  }
  if (exclusivityInputs?.contains("Need a ticket") ?? false) {
    enumsList.add(Exclusivity.Ticket);
  }

  return enumsList;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

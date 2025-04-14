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

extension EnumTestExtension on RelationPreference {
  String serialize() {
    return this.toString().split('.').last;
  }
}

List<RelationPreference>? relations2Enums(List<String>? relationsInputs) {
  debugPrint('CheckPoint!:  excl 2 enum'); //$someVal

  List<RelationPreference> enumsList = [];

  if (relationsInputs?.contains("LongTerm") ?? false) {
    enumsList.add(RelationPreference.LongTerm);
  }
  if (relationsInputs?.contains("ShortTerm") ?? false) {
    enumsList.add(RelationPreference.ShortTerm);
  }
  if (relationsInputs?.contains("Friendship") ?? false) {
    enumsList.add(RelationPreference.Friendship);
  }
  if (relationsInputs?.contains("NonMonogamous") ?? false) {
    enumsList.add(RelationPreference.NonMonogamous);
  }
  if (relationsInputs?.contains("Other") ?? false) {
    enumsList.add(RelationPreference.Other);
  }

  return enumsList;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

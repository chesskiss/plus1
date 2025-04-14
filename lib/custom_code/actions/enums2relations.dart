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

List<String>? enums2relations(List<RelationPreference>? relationsEnumList) {
  debugPrint('CheckPoint!:  enum 2 excl'); //$someVal
  List<String> stringList = [];

/*
  if (relationsEnumList?.contains(RelationPreference.LongTerm) ?? false) {
    stringList.add("LongTerm");
  }
  if (relationsEnumList?.contains(RelationPreference.ShortTerm) ?? false) {
    stringList.add("ShortTerm");
  }
  if (relationsEnumList?.contains(RelationPreference.Friendship) ?? false) {
    stringList.add("Friendship");
  }
  if (relationsEnumList?.contains(RelationPreference.NonMonogamous) ?? false) {
    stringList.add("NonMonogamous");
  }
  if (relationsEnumList?.contains(RelationPreference.Other) ?? false) {
    stringList.add("Other");
  } */

  return stringList;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

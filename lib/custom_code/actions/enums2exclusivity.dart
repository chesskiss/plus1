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

List<String>? enums2exclusivity(List<Exclusivity>? exclusivityEnumList) {
  debugPrint('CheckPoint!:  enum 2 excl'); //$someVal
  List<String> stringList = [];

  if (exclusivityEnumList?.contains(Exclusivity.Exclusive) ?? false) {
    stringList.add("Exclusive Access");
  } else if (exclusivityEnumList?.contains(Exclusivity.Public) ?? false) {
    stringList.add("Public");
  }
  if (exclusivityEnumList?.contains(Exclusivity.Sponsorship) ?? false) {
    stringList.add("Sponsorship");
  }
  if (exclusivityEnumList?.contains(Exclusivity.Ticket) ?? false) {
    stringList.add("Need a ticket");
  }

  return stringList;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

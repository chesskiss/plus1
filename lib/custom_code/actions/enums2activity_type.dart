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

extension EnumTestExtension on ActivityType {
  String serialize() {
    return this.toString().split('.').last;
  }
}

List<String>? enums2activityType(List<ActivityType>? activitiesTypeEnumList) {
  debugPrint('CheckPoint!: enum 2 activity'); //$someVal
  List<String> stringList = [];

  if (activitiesTypeEnumList?.contains(ActivityType.Sports) ?? false) {
    stringList.add("Sports");
  }
  if (activitiesTypeEnumList?.contains(ActivityType.Watch) ?? false) {
    stringList.add("Watch");
  }
  if (activitiesTypeEnumList?.contains(ActivityType.Dine) ?? false) {
    stringList.add("Dine");
  }
  if (activitiesTypeEnumList?.contains(ActivityType.Drink) ?? false) {
    stringList.add("Drink");
  }
  if (activitiesTypeEnumList?.contains(ActivityType.Other) ?? false) {
    stringList.add("Other");
  }
  return stringList;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

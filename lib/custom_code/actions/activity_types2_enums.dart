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

Future<List<ActivityType>> activityTypes2Enums(
    List<String>? activityInputes) async {
  debugPrint('CheckPoint!: activity 2 enum'); //$someVal
  List<ActivityType> enumsList = [];

  if (activityInputes?.contains("Sports") ?? false) {
    enumsList.add(ActivityType.Sports);
  }
  if (activityInputes?.contains("Relax") ?? false) {
    enumsList.add(ActivityType.Relax);
  }
  if (activityInputes?.contains("Watch") ?? false) {
    enumsList.add(ActivityType.Watch);
  }
  if (activityInputes?.contains("Dine") ?? false) {
    enumsList.add(ActivityType.Dine);
  }
  if (activityInputes?.contains("Drink") ?? false) {
    enumsList.add(ActivityType.Drink);
  }
  if (activityInputes?.contains("Other") ?? false) {
    enumsList.add(ActivityType.Other);
  }
  return enumsList;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

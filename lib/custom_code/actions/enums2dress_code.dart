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

extension EnumTestExtension on DressCode {
  String serialize() {
    return this.toString().split('.').last;
  }
}

List<String>? enums2dressCode(List<DressCode>? dressCodeEnumList) {
  debugPrint('CheckPoint!:  enum 2 excl'); //$someVal
  List<String> stringList = [];

  if (dressCodeEnumList?.contains(DressCode.WhiteTie) ?? false) {
    stringList.add("WhiteTie");
  }
  if (dressCodeEnumList?.contains(DressCode.BlackTie) ?? false) {
    stringList.add("BlackTie");
  }
  if (dressCodeEnumList?.contains(DressCode.Semiformal) ?? false) {
    stringList.add("Semi-fromal / Business");
  }
  if (dressCodeEnumList?.contains(DressCode.BusinessCasual) ?? false) {
    stringList.add("Business casual");
  }
  if (dressCodeEnumList?.contains(DressCode.Casual) ?? false) {
    stringList.add("Casual");
  }
  if (dressCodeEnumList?.contains(DressCode.Beach) ?? false) {
    stringList.add("Beach");
  }

  return stringList;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

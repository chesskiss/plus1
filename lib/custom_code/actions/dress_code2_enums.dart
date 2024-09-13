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

List<DressCode>? dressCode2Enums(List<String>? DressCodeInputs) {
  debugPrint('CheckPoint!:  excl 2 enum'); //$someVal

  List<DressCode> enumsList = [];

  if (DressCodeInputs?.contains("White Tie") ?? false) {
    enumsList.add(DressCode.WhiteTie);
  }
  if (DressCodeInputs?.contains("Black Tie") ?? false) {
    enumsList.add(DressCode.BlackTie);
  }
  if (DressCodeInputs?.contains("Semi-fromal / Business") ?? false) {
    enumsList.add(DressCode.Semiformal);
  }
  if (DressCodeInputs?.contains("Business casual") ?? false) {
    enumsList.add(DressCode.BusinessCasual);
  }
  if (DressCodeInputs?.contains("Casual") ?? false) {
    enumsList.add(DressCode.Casual);
  }
  if (DressCodeInputs?.contains("Beach") ?? false) {
    enumsList.add(DressCode.Beach);
  }

  return enumsList;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

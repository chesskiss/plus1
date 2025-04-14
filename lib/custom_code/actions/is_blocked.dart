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

Future<bool> isBlocked(
    DocumentReference user2check, DocumentReference user) async {
  try {
    DocumentSnapshot userSnapshot = await user.get();

    if (!userSnapshot.exists)
      return false; // If B doesn't exist, A can't be blocked.

    List<dynamic>? blockedList = userSnapshot.get("blocked");

    if (blockedList == null)
      return false; // If there's no "blocked" field, A isn't blocked.

    return blockedList.contains(user2check);
  } catch (e) {
    print("Error checking block status: $e");
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

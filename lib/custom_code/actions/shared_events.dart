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

Future<void> sharedEvents(
  BuildContext context,
  DocumentReference currentUser,
  DocumentReference secondUser,
) async {
  // Get the current user's data
  final currentUserDoc =
      await FirebaseFirestore.instance.doc(currentUser.path).get();
  final currentUserData = currentUserDoc.data() as Map<String, dynamic>;
  final currentUserLikes =
      List<DocumentReference>.from(currentUserData['likes'] ?? []);
  final currentUserPosts =
      List<DocumentReference>.from(currentUserData['posts'] ?? []);

  // Get the second user's data
  final secondUserDoc =
      await FirebaseFirestore.instance.doc(secondUser.path).get();
  final secondUserData = secondUserDoc.data() as Map<String, dynamic>;
  final secondUserLikes =
      List<DocumentReference>.from(secondUserData['likes'] ?? []);
  final secondUserPosts =
      List<DocumentReference>.from(secondUserData['posts'] ?? []);

  // Find posts that one user liked and the other posted
  final currentUserLikedSecondUserPosts =
      currentUserLikes.toSet().intersection(secondUserPosts.toSet());
  final secondUserLikedCurrentUserPosts =
      secondUserLikes.toSet().intersection(currentUserPosts.toSet());

  // Find posts that both users liked
  final bothUsersLiked =
      currentUserLikes.toSet().intersection(secondUserLikes.toSet());

  // Combine all the results
  final result = [
    ...currentUserLikedSecondUserPosts,
    ...secondUserLikedCurrentUserPosts,
    ...bothUsersLiked,
  ].toSet().toList();

  //debugPrint('Message: $someVal');
  debugPrint('Message: test');

  Navigator.pushNamed(
    context,
    'shared_events', //target page
    arguments: result,
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

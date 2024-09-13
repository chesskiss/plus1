import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? enum2exclusivity(List<Exclusivity>? exclusivityEnumList) {
  debugPrint('CheckPoint!:  enum 2 excl'); //$someVal
  List<String> stringList = [];

  // if (exclusivityEnumList?.contains(Exclusivity.Exclusive) ?? false) {
  //   stringList.add("Exclusive Access");
  // } else if (exclusivityEnumList?.contains(Exclusivity.Public) ?? false) {
  //   stringList.add("Public");
  // }
  // if (exclusivityEnumList?.contains(Exclusivity.Sponsorship) ?? false) {
  //   stringList.add("Sponsorship");
  // }
  // if (exclusivityEnumList?.contains(Exclusivity.Ticket) ?? false) {
  //   stringList.add("Need a ticket");
  // }

  // return stringList;
  return stringList;
}

List<DocumentReference> sharedPostsDraft(
  DocumentReference currentUser,
  DocumentReference secondUser,
) {
  // // Get the current user's data TODO - revert back to this + async above the comment (ask GPT/Claude how)
  // final currentUserDoc =
  //     await FirebaseFirestore.instance.doc(currentUser.path).get();
  // final currentUserLikes = currentUserDoc['likes'] as List<DocumentReference>;
  // final currentUserPosts = currentUserDoc['posts'] as List<DocumentReference>;

  // // Get the second user's data
  // final secondUserDoc = FirebaseFirestore.instance.doc(secondUser.path).get();
  // final secondUserLikes = secondUserDoc['likes'] as List<DocumentReference>;
  // final secondUserPosts = secondUserDoc['posts'] as List<DocumentReference>;

  // // Find posts that one user liked and the other posted
  // final currentUserLikedSecondUserPosts =
  //     currentUserLikes.toSet().intersection(secondUserPosts.toSet());
  // final secondUserLikedCurrentUserPosts =
  //     secondUserLikes.toSet().intersection(currentUserPosts.toSet());

  // // Find posts that both users liked
  // final bothUsersLiked =
  //     currentUserLikes.toSet().intersection(secondUserLikes.toSet());

  // // Combine all the results
  // final result = [
  //   ...currentUserLikedSecondUserPosts,
  //   ...secondUserLikedCurrentUserPosts,
  //   ...bothUsersLiked,
  // ].toSet().toList();

  // return result;
  ///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

  // List<DocumentReference> helper() {
  //   a = FirebaseFirestore.instance
  //       .doc(currentUser.path)
  //       .get()
  //       .then((currentUserDoc) {
  //     final currentUserData = currentUserDoc.data() as Map<String, dynamic>;
  //     final currentUserLikes =
  //         List<DocumentReference>.from(currentUserData['likes'] ?? []);
  //     final currentUserPosts =
  //         List<DocumentReference>.from(currentUserData['posts'] ?? []);
  //     return FirebaseFirestore.instance
  //         .doc(secondUser.path)
  //         .get()
  //         .then((secondUserDoc) {
  //       final secondUserData = secondUserDoc.data() as Map<String, dynamic>;
  //       final secondUserLikes =
  //           List<DocumentReference>.from(secondUserData['likes'] ?? []);
  //       final secondUserPosts =
  //           List<DocumentReference>.from(secondUserData['posts'] ?? []);

  //       // Find posts that one user liked and the other posted
  //       final currentUserLikedSecondUserPosts =
  //           currentUserLikes.toSet().intersection(secondUserPosts.toSet());
  //       final secondUserLikedCurrentUserPosts =
  //           secondUserLikes.toSet().intersection(currentUserPosts.toSet());

  //       // Find posts that both users liked
  //       final bothUsersLiked =
  //           currentUserLikes.toSet().intersection(secondUserLikes.toSet());

  //       // Combine all the results
  //       final result = [
  //         ...currentUserLikedSecondUserPosts,
  //         ...secondUserLikedCurrentUserPosts,
  //         ...bothUsersLiked,
  //       ].toSet().toList();

  //       return result;
  //     });
  //   });
  // }
  final list = [currentUser, secondUser];
  return list;
}

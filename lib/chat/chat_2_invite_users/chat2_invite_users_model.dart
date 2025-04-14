import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat2_invite_users_widget.dart' show Chat2InviteUsersWidget;
import 'package:flutter/material.dart';

class Chat2InviteUsersModel extends FlutterFlowModel<Chat2InviteUsersWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> friendsList = [];
  void addToFriendsList(DocumentReference item) => friendsList.add(item);
  void removeFromFriendsList(DocumentReference item) =>
      friendsList.remove(item);
  void removeAtIndexFromFriendsList(int index) => friendsList.removeAt(index);
  void insertAtIndexInFriendsList(int index, DocumentReference item) =>
      friendsList.insert(index, item);
  void updateFriendsListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      friendsList[index] = updateFn(friendsList[index]);

  /// Users that have already matched with u
  List<DocumentReference> matchedUsers = [];
  void addToMatchedUsers(DocumentReference item) => matchedUsers.add(item);
  void removeFromMatchedUsers(DocumentReference item) =>
      matchedUsers.remove(item);
  void removeAtIndexFromMatchedUsers(int index) => matchedUsers.removeAt(index);
  void insertAtIndexInMatchedUsers(int index, DocumentReference item) =>
      matchedUsers.insert(index, item);
  void updateMatchedUsersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      matchedUsers[index] = updateFn(matchedUsers[index]);

  /// Users u haven't matched with
  List<DocumentReference> strangers = [];
  void addToStrangers(DocumentReference item) => strangers.add(item);
  void removeFromStrangers(DocumentReference item) => strangers.remove(item);
  void removeAtIndexFromStrangers(int index) => strangers.removeAt(index);
  void insertAtIndexInStrangers(int index, DocumentReference item) =>
      strangers.insert(index, item);
  void updateStrangersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      strangers[index] = updateFn(strangers[index]);

  /// Users that are invited to join but are not in the matches list, so it
  /// doesn't happen automatically.
  List<DocumentReference> invitations = [];
  void addToInvitations(DocumentReference item) => invitations.add(item);
  void removeFromInvitations(DocumentReference item) =>
      invitations.remove(item);
  void removeAtIndexFromInvitations(int index) => invitations.removeAt(index);
  void insertAtIndexInInvitations(int index, DocumentReference item) =>
      invitations.insert(index, item);
  void updateInvitationsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      invitations[index] = updateFn(invitations[index]);

  /// index for the loop action to iterate over invitations
  int inv = 0;

  /// users that blocked auth.
  ///
  /// Need this because FF can't handle query actions
  List<DocumentReference> blockedAuthUser = [];
  void addToBlockedAuthUser(DocumentReference item) =>
      blockedAuthUser.add(item);
  void removeFromBlockedAuthUser(DocumentReference item) =>
      blockedAuthUser.remove(item);
  void removeAtIndexFromBlockedAuthUser(int index) =>
      blockedAuthUser.removeAt(index);
  void insertAtIndexInBlockedAuthUser(int index, DocumentReference item) =>
      blockedAuthUser.insert(index, item);
  void updateBlockedAuthUserAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      blockedAuthUser[index] = updateFn(blockedAuthUser[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Matchedusers widget.
  List<UserRecord>? blockedAuthMatched;
  // State field(s) for CheckboxListTile widget.
  Map<DocumentReference, bool> checkboxListTileValueMap1 = {};
  List<DocumentReference> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Strangers widget.
  List<UserRecord>? blockedAuth;
  // State field(s) for CheckboxListTile widget.
  Map<DocumentReference, bool> checkboxListTileValueMap2 = {};
  List<DocumentReference> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatRecord? updatedChatThread;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
